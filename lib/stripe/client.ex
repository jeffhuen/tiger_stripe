defmodule Stripe.Client do
  @moduledoc """
  Stripe API client. Holds configuration and executes HTTP requests.

  Create a client via `Stripe.client/2`:

      client = Stripe.client("sk_test_...")
      {:ok, data} = Stripe.Client.request(client, :get, "/v1/charges")
  """

  alias Stripe.{Deserializer, Error, Multipart}

  # Resolved at compile time. Wrapped because `System.cmd/3` raises (rather than
  # returning a non-zero status) when `uname` is absent — e.g. on Windows or
  # minimal build images — and that must not break compilation.
  @uname (try do
            case System.cmd("uname", ["-a"], stderr_to_stdout: true) do
              {result, 0} -> String.trim(result)
              _ -> "unknown"
            end
          rescue
            _ -> "unknown"
          end)

  @type transport ::
          :finch
          | (map() ->
               {integer(), [{String.t(), String.t()}], binary()}
               | {:ok, integer(), [{String.t(), String.t()}], binary()}
               | {:error, term()})

  @type t :: %__MODULE__{
          api_key: String.t(),
          api_version: String.t() | nil,
          api_base: String.t(),
          connect_base: String.t(),
          uploads_base: String.t(),
          meter_events_base: String.t(),
          stripe_account: String.t() | nil,
          stripe_context: String.t() | nil,
          client_id: String.t() | nil,
          max_retries: non_neg_integer(),
          open_timeout: pos_integer(),
          read_timeout: pos_integer(),
          finch: atom(),
          transport: transport()
        }

  defstruct [
    :api_key,
    api_version: nil,
    api_base: "https://api.stripe.com",
    connect_base: "https://connect.stripe.com",
    uploads_base: "https://files.stripe.com",
    meter_events_base: "https://meter-events.stripe.com",
    stripe_account: nil,
    stripe_context: nil,
    client_id: nil,
    max_retries: 2,
    open_timeout: 30_000,
    read_timeout: 80_000,
    finch: Stripe.Finch,
    transport: :finch
  ]

  @doc """
  Execute an API request.

  ## Options

    * `:params` - Request parameters (map)
    * `:base_address` - `:api` | `:connect` | `:files` | `:meter_events` (default `:api`)
    * `:api_mode` - `:v1` | `:v2` (default `:v1`)
    * `:api_version` - Override API version for this request
    * `:stripe_account` - Override connected account for this request
    * `:stripe_context` - Override Stripe context for this request
    * `:idempotency_key` - Idempotency key for POST/DELETE requests
    * `:expand` - List of fields to expand
  """
  @spec request(t(), atom(), String.t(), keyword()) ::
          {:ok, struct() | map()} | {:error, Error.t()}
  def request(%__MODULE__{} = client, method, path, opts \\ []) do
    params = Keyword.get(opts, :params, %{})
    base_address = Keyword.get(opts, :base_address, :api)
    api_mode = Keyword.get(opts, :api_mode, :v1)
    url = base_url(client, base_address) <> path

    # Merge expand into params
    params =
      case Keyword.get(opts, :expand) do
        nil -> params
        fields -> Map.put(params, "expand", fields)
      end

    headers = build_headers(client, method, api_mode, opts)

    {url, headers, body} = encode_request(method, url, headers, params, api_mode)

    metadata = %{method: method, path: path, base_address: base_address}
    start_time = System.monotonic_time()

    :telemetry.execute(
      [:stripe, :request, :start],
      %{system_time: System.system_time()},
      metadata
    )

    {result, resp_meta} =
      execute_with_retries(
        client,
        %{method: method, url: url, headers: headers, body: body},
        0,
        api_mode
      )

    duration = System.monotonic_time() - start_time
    stop_metadata = Map.merge(metadata, resp_meta)

    case result do
      {:ok, data} ->
        :telemetry.execute([:stripe, :request, :stop], %{duration: duration}, stop_metadata)
        {:ok, data}

      {:error, error} ->
        :telemetry.execute(
          [:stripe, :request, :stop],
          %{duration: duration},
          Map.put(stop_metadata, :error, error)
        )

        {:error, error}
    end
  end

  @doc """
  Execute an API request and return the raw response without deserialization.

  Returns `{:ok, %{status: integer, headers: list, body: binary}}` on success,
  or `{:error, Error.t()}` on failure.
  """
  @spec raw_request(t(), atom(), String.t(), keyword()) ::
          {:ok, %{status: integer(), headers: list(), body: binary()}} | {:error, Error.t()}
  def raw_request(%__MODULE__{} = client, method, path, opts \\ []) do
    params = Keyword.get(opts, :params, %{})
    base_address = Keyword.get(opts, :base_address, :api)
    api_mode = Keyword.get(opts, :api_mode, :v1)
    url = base_url(client, base_address) <> path

    params =
      case Keyword.get(opts, :expand) do
        nil -> params
        fields -> Map.put(params, "expand", fields)
      end

    headers = build_headers(client, method, api_mode, opts)
    {url, headers, body} = encode_request(method, url, headers, params, api_mode)

    case do_request(client, %{method: method, url: url, headers: headers, body: body}) do
      {:ok, status, resp_headers, resp_body} ->
        {:ok, %{status: status, headers: resp_headers, body: resp_body}}

      {:error, reason} ->
        {:error, Error.connection_error("Request failed: #{inspect(reason)}")}
    end
  end

  @doc """
  Execute a streaming API request.

  Streams the response body through `fun`, which receives chunks as they arrive.
  The function signature is `(chunk, acc -> acc)` where chunk is one of:

    * `{:status, integer()}` — HTTP status code
    * `{:headers, [{String.t(), String.t()}]}` — response headers
    * `{:data, binary()}` — body chunk

  Returns `{:ok, acc}` with the final accumulator, or `{:error, Error.t()}`.

  ## Example

      Stripe.Client.stream_request(client, :post, "/v2/billing/meter_event_stream",
        params: %{events: [...]},
        api_mode: :v2
      ) do
        fn
          {:data, chunk}, acc -> [chunk | acc]
          _other, acc -> acc
        end, []
      end
  """
  @spec stream_request(t(), atom(), String.t(), (term(), acc -> acc), acc, keyword()) ::
          {:ok, acc} | {:error, Error.t()}
        when acc: term()
  def stream_request(%__MODULE__{} = client, method, path, fun, acc, opts \\ []) do
    params = Keyword.get(opts, :params, %{})
    base_address = Keyword.get(opts, :base_address, :api)
    api_mode = Keyword.get(opts, :api_mode, :v1)
    url = base_url(client, base_address) <> path

    headers = build_headers(client, method, api_mode, opts)
    {url, headers, body} = encode_request(method, url, headers, params, api_mode)

    case client.transport do
      :finch ->
        req = Finch.build(method, url, headers, body)

        case Finch.stream(req, client.finch, acc, fun, receive_timeout: client.read_timeout) do
          {:ok, acc} ->
            {:ok, acc}

          {:error, reason, _acc} ->
            {:error, Error.connection_error("Stream failed: #{inspect(reason)}")}
        end

      _custom ->
        case do_request(client, %{method: method, url: url, headers: headers, body: body}) do
          {:ok, status, resp_headers, resp_body} ->
            acc = fun.({:status, status}, acc)
            acc = fun.({:headers, resp_headers}, acc)
            acc = fun.({:data, resp_body}, acc)
            {:ok, acc}

          {:error, reason} ->
            {:error, Error.connection_error("Stream failed: #{inspect(reason)}")}
        end
    end
  end

  # -- Request Encoding -------------------------------------------------------

  defp encode_request(method, url, headers, params, _api_mode)
       when method in [:get, :head, :delete] do
    if params == %{} do
      {url, headers, nil}
    else
      {url <> "?" <> encode_form_params(params), headers, nil}
    end
  end

  defp encode_request(_method, url, headers, params, :v2) do
    headers = [{"content-type", "application/json"} | headers]
    {url, headers, JSON.encode!(params)}
  end

  defp encode_request(_method, url, headers, params, _api_mode) when params == %{} do
    {url, headers, nil}
  end

  defp encode_request(_method, url, headers, params, _api_mode) do
    if Multipart.has_file?(params) do
      {content_type, body} = Multipart.encode(params)
      headers = [{"content-type", content_type} | headers]
      {url, headers, body}
    else
      headers = [{"content-type", "application/x-www-form-urlencoded"} | headers]
      {url, headers, encode_form_params(params)}
    end
  end

  @doc false
  def encode_form_params(params) do
    params
    |> flatten_params()
    |> URI.encode_query(:www_form)
  end

  defp flatten_params(params, prefix \\ nil)

  defp flatten_params(%{} = map, prefix) do
    Enum.flat_map(map, fn {key, value} ->
      new_prefix = if prefix, do: "#{prefix}[#{key}]", else: to_string(key)
      flatten_params(value, new_prefix)
    end)
  end

  defp flatten_params(list, prefix) when is_list(list) do
    list
    |> Enum.with_index()
    |> Enum.flat_map(fn {value, idx} ->
      flatten_params(value, "#{prefix}[#{idx}]")
    end)
  end

  defp flatten_params(true, prefix), do: [{prefix, "true"}]
  defp flatten_params(false, prefix), do: [{prefix, "false"}]
  defp flatten_params(value, prefix), do: [{prefix, to_string(value)}]

  # -- HTTP Execution ---------------------------------------------------------

  defp execute_with_retries(client, request, attempt, api_mode) do
    case do_request(client, request) do
      {:ok, status, resp_headers, resp_body} when status in 200..299 ->
        result = decode_success(resp_body, api_mode)
        {result, response_meta(status, resp_headers, attempt)}

      {:ok, status, resp_headers, resp_body} ->
        if should_retry?(status, resp_headers, attempt, client.max_retries) do
          Process.sleep(backoff_ms(attempt))
          execute_with_retries(client, request, attempt + 1, api_mode)
        else
          error = {:error, Error.from_response(status, resp_body, resp_headers)}
          {error, response_meta(status, resp_headers, attempt)}
        end

      {:error, reason} ->
        if attempt < client.max_retries do
          Process.sleep(backoff_ms(attempt))
          execute_with_retries(client, request, attempt + 1, api_mode)
        else
          error = {:error, Error.connection_error("Request failed: #{inspect(reason)}")}
          {error, response_meta(nil, [], attempt)}
        end
    end
  end

  defp response_meta(http_status, resp_headers, num_retries) do
    request_id =
      case List.keyfind(resp_headers, "request-id", 0) do
        {_, id} -> id
        nil -> nil
      end

    %{http_status: http_status, num_retries: num_retries, request_id: request_id}
  end

  defp decode_success(resp_body, api_mode) do
    case JSON.decode(resp_body) do
      {:ok, data} -> {:ok, Deserializer.cast(data, api_mode: api_mode)}
      {:error, _} -> {:ok, %{"raw" => resp_body}}
    end
  end

  defp do_request(%__MODULE__{transport: :finch} = client, %{
         method: method,
         url: url,
         headers: headers,
         body: body
       }) do
    req = Finch.build(method, url, headers, body)

    case Finch.request(req, client.finch, receive_timeout: client.read_timeout) do
      {:ok, %Finch.Response{status: status, body: resp_body, headers: resp_headers}} ->
        {:ok, status, resp_headers, resp_body}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp do_request(%__MODULE__{transport: transport}, request) when is_function(transport, 1) do
    request
    |> transport.()
    |> normalize_transport_result()
  end

  defp normalize_transport_result({status, headers, body}) when is_integer(status) do
    {:ok, status, headers, body}
  end

  defp normalize_transport_result({:ok, status, headers, body}) when is_integer(status) do
    {:ok, status, headers, body}
  end

  defp normalize_transport_result({:error, reason}), do: {:error, reason}

  defp should_retry?(status, headers, attempt, max_retries) when attempt < max_retries do
    case List.keyfind(headers, "stripe-should-retry", 0) do
      {_, "true"} -> true
      {_, "false"} -> false
      _ -> status in [409, 429, 500, 503]
    end
  end

  defp should_retry?(_status, _headers, _attempt, _max_retries), do: false

  # Exponential backoff with jitter. Matches Ruby: 0.5s * 2^n, max 5s, +0-50% jitter.
  defp backoff_ms(attempt) do
    base = min(500 * Integer.pow(2, attempt), 5_000)
    jitter = trunc(base * 0.5 * :rand.uniform())
    base + jitter
  end

  # -- Headers ----------------------------------------------------------------

  defp build_headers(client, method, api_mode, opts) do
    api_key = Keyword.get(opts, :api_key, client.api_key)

    headers = [
      {"authorization", "Bearer #{api_key}"},
      {"user-agent", user_agent()},
      {"x-stripe-client-user-agent", client_user_agent()}
    ]

    headers =
      put_header_if(
        headers,
        "stripe-version",
        resolve_opt(opts, :api_version, client.api_version)
      )

    headers =
      put_header_if(
        headers,
        "stripe-account",
        resolve_opt(opts, :stripe_account, client.stripe_account)
      )

    headers =
      put_header_if(
        headers,
        "stripe-context",
        resolve_opt(opts, :stripe_context, client.stripe_context)
      )

    headers = put_header_if(headers, "idempotency-key", Keyword.get(opts, :idempotency_key))

    # Auto-generate idempotency key for POST/DELETE in V2 (matches Ruby SDK)
    if method in [:post, :delete] and api_mode == :v2 and
         not List.keymember?(headers, "idempotency-key", 0) do
      [{"idempotency-key", generate_idempotency_key()} | headers]
    else
      headers
    end
  end

  defp resolve_opt(opts, key, client_default), do: Keyword.get(opts, key, client_default)

  defp put_header_if(headers, _name, nil), do: headers
  defp put_header_if(headers, name, value), do: [{name, value} | headers]

  # -- User-Agent -------------------------------------------------------------

  defp user_agent, do: "Stripe/#{Stripe.version()}"

  defp client_user_agent do
    JSON.encode!(%{
      bindings_version: Stripe.version(),
      lang: "elixir",
      lang_version: System.version(),
      platform: :erlang.system_info(:system_architecture) |> to_string(),
      engine: "BEAM",
      publisher: "jeffhuen",
      uname: uname()
    })
  end

  defp uname do
    @uname
  end

  defp generate_idempotency_key do
    Base.url_encode64(:crypto.strong_rand_bytes(16), padding: false)
  end

  # -- Base URLs --------------------------------------------------------------

  defp base_url(client, :api), do: client.api_base
  defp base_url(client, :connect), do: client.connect_base
  defp base_url(client, :files), do: client.uploads_base
  defp base_url(client, :meter_events), do: client.meter_events_base
end
