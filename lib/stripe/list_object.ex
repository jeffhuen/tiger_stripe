defmodule Stripe.ListObject do
  @moduledoc """
  Represents a V1 paginated list response (`object: "list"`).

  ## Auto-paging

      client = Stripe.client("sk_test_...")
      {:ok, page} = Stripe.Client.request(client, :get, "/v1/charges")

      page
      |> Stripe.ListObject.auto_paging_stream(client)
      |> Enum.take(50)
  """

  alias Stripe.Client

  @type t :: %__MODULE__{
          object: String.t() | nil,
          data: [struct() | map()] | nil,
          has_more: boolean() | nil,
          url: String.t() | nil
        }

  defstruct [:object, :data, :has_more, :url]

  @doc """
  Returns a lazy `Stream` that yields every item across all pages.

  Uses `starting_after` cursor pagination. The stream fetches the next page
  only when consumed (via `Enum` or `Stream` functions).
  """
  @spec auto_paging_stream(t(), Client.t(), keyword()) :: Enumerable.t()
  def auto_paging_stream(%__MODULE__{} = page, client, opts \\ []) do
    Stream.unfold(page, fn
      nil ->
        nil

      %__MODULE__{data: data, has_more: has_more, url: url} ->
        next = if has_more, do: fetch_next_page(client, url, data, opts)
        {data, next}
    end)
    |> Stream.flat_map(& &1)
  end

  defp fetch_next_page(client, url, data, opts) do
    last_id = data |> List.last() |> extract_id()

    case Client.request(
           client,
           :get,
           url,
           Keyword.merge(opts, params: %{"starting_after" => last_id})
         ) do
      {:ok, %__MODULE__{} = next_page} -> next_page
      _ -> nil
    end
  end

  defp extract_id(%{id: id}) when is_binary(id), do: id
  defp extract_id(%{"id" => id}) when is_binary(id), do: id
  defp extract_id(_), do: nil
end

defmodule Stripe.SearchResult do
  @moduledoc """
  Represents a V1 search result response (`object: "search_result"`).

  ## Auto-paging

      {:ok, page} = Stripe.Client.request(client, :get, "/v1/charges/search",
        params: %{"query" => "status:'succeeded'"})

      page
      |> Stripe.SearchResult.auto_paging_stream(client)
      |> Enum.to_list()
  """

  alias Stripe.Client

  @type t :: %__MODULE__{
          object: String.t() | nil,
          data: [struct() | map()] | nil,
          has_more: boolean() | nil,
          url: String.t() | nil,
          next_page: String.t() | nil,
          total_count: integer() | nil
        }

  defstruct [:object, :data, :has_more, :url, :next_page, :total_count]

  @doc """
  Returns a lazy `Stream` that yields every item across all search result pages.

  Uses `page` token pagination (the `next_page` field from each response).
  """
  @spec auto_paging_stream(t(), Client.t(), keyword()) :: Enumerable.t()
  def auto_paging_stream(%__MODULE__{} = page, client, opts \\ []) do
    Stream.unfold(page, fn
      nil ->
        nil

      %__MODULE__{data: data, has_more: has_more, url: url, next_page: next_page_token} ->
        next =
          if has_more && next_page_token, do: fetch_next_page(client, url, next_page_token, opts)

        {data, next}
    end)
    |> Stream.flat_map(& &1)
  end

  defp fetch_next_page(client, url, next_page_token, opts) do
    case Client.request(
           client,
           :get,
           url,
           Keyword.merge(opts, params: %{"page" => next_page_token})
         ) do
      {:ok, %__MODULE__{} = next_page} -> next_page
      _ -> nil
    end
  end
end

defmodule Stripe.V2.ListObject do
  @moduledoc """
  Represents a V2 paginated list response (detected by `next_page_url` key).

  ## Auto-paging

      {:ok, page} = Stripe.Client.request(client, :get, "/v2/core/events",
        api_mode: :v2)

      page
      |> Stripe.V2.ListObject.auto_paging_stream(client)
      |> Enum.take(100)
  """

  alias Stripe.Client

  @type t :: %__MODULE__{
          data: [struct() | map()] | nil,
          next_page_url: String.t() | nil
        }

  defstruct [:data, :next_page_url]

  @doc """
  Returns a lazy `Stream` that yields every item across all V2 pages.

  Uses URL-based pagination — fetches `next_page_url` directly.
  """
  @spec auto_paging_stream(t(), Client.t(), keyword()) :: Enumerable.t()
  def auto_paging_stream(%__MODULE__{} = page, client, opts \\ []) do
    Stream.unfold(page, fn
      nil ->
        nil

      %__MODULE__{data: data, next_page_url: next_url} ->
        next = if next_url, do: fetch_next_page(client, next_url, opts)
        {data, next}
    end)
    |> Stream.flat_map(& &1)
  end

  defp fetch_next_page(client, next_url, opts) do
    path = extract_path(next_url, client)

    case Client.request(client, :get, path, Keyword.merge(opts, api_mode: :v2)) do
      {:ok, %__MODULE__{} = next_page} -> next_page
      _ -> nil
    end
  end

  defp extract_path(url, client) do
    base = client.api_base
    String.replace_prefix(url, base, "")
  end
end
