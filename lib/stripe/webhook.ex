defmodule Stripe.Webhook do
  @moduledoc """
  Webhook signature verification and event construction.

  ## Usage

      case Stripe.Webhook.construct_event(payload, sig_header, secret) do
        {:ok, event} -> handle_event(event)
        {:error, error} -> send_resp(conn, 400, error.message)
      end
  """

  alias Stripe.{Deserializer, Error}

  @default_tolerance 300

  @doc """
  Verify a webhook signature and construct a typed event struct.

  ## Parameters

    * `payload` - Raw request body (binary string, NOT parsed JSON)
    * `sig_header` - Value of the `Stripe-Signature` header
    * `secret` - Webhook endpoint signing secret (`whsec_...`)

  ## Options

    * `:tolerance` - Maximum age of the event in seconds (default: 300)
  """
  @spec construct_event(binary(), String.t(), String.t(), keyword()) ::
          {:ok, struct() | map()} | {:error, Error.t()}
  def construct_event(payload, sig_header, secret, opts \\ []) do
    with :ok <- verify_header(payload, sig_header, secret, opts) do
      case JSON.decode(payload) do
        {:ok, data} -> {:ok, Deserializer.cast(data)}
        {:error, _} -> {:error, Error.signature_verification_error("Invalid JSON payload")}
      end
    end
  end

  @doc """
  Verify a webhook signature header without constructing the event.

  Returns `:ok` or `{:error, %Error{}}`.
  """
  @spec verify_header(binary(), String.t(), String.t(), keyword()) ::
          :ok | {:error, Error.t()}
  def verify_header(payload, sig_header, secret, opts \\ []) do
    tolerance = Keyword.get(opts, :tolerance, @default_tolerance)

    # Match Ruby order: parse → verify signature → check timestamp
    with {:ok, timestamp, signatures} <- parse_header(sig_header),
         :ok <- verify_signature(payload, timestamp, secret, signatures) do
      verify_timestamp(timestamp, tolerance)
    end
  end

  @doc """
  Compute the expected signature for a payload.
  """
  @spec compute_signature(integer(), binary(), String.t()) :: String.t()
  def compute_signature(timestamp, payload, secret) do
    signed_payload = "#{timestamp}.#{payload}"

    :crypto.mac(:hmac, :sha256, secret, signed_payload)
    |> Base.encode16(case: :lower)
  end

  # -- Private ----------------------------------------------------------------

  defp parse_header(nil) do
    {:error, Error.signature_verification_error("No Stripe-Signature header present")}
  end

  defp parse_header(header) when is_binary(header) do
    parts =
      header
      |> String.split(",")
      |> Enum.map(&String.trim/1)
      |> Enum.map(fn part ->
        case String.split(part, "=", parts: 2) do
          [key, value] -> {key, value}
          _ -> nil
        end
      end)
      |> Enum.reject(&is_nil/1)

    timestamp =
      case List.keyfind(parts, "t", 0) do
        {"t", ts} -> String.to_integer(ts)
        nil -> nil
      end

    signatures =
      parts
      |> Enum.filter(fn {k, _} -> k == "v1" end)
      |> Enum.map(fn {_, v} -> v end)

    cond do
      is_nil(timestamp) ->
        {:error, Error.signature_verification_error("Unable to extract timestamp from header")}

      signatures == [] ->
        {:error, Error.signature_verification_error("No v1 signatures found in header")}

      true ->
        {:ok, timestamp, signatures}
    end
  end

  defp verify_timestamp(timestamp, tolerance) do
    now = System.system_time(:second)
    age = now - timestamp

    if age > tolerance do
      {:error,
       Error.signature_verification_error(
         "Timestamp outside the tolerance zone (#{age}s > #{tolerance}s)"
       )}
    else
      :ok
    end
  end

  defp verify_signature(payload, timestamp, secret, signatures) do
    expected = compute_signature(timestamp, payload, secret)

    if Enum.any?(signatures, &secure_compare(&1, expected)) do
      :ok
    else
      {:error,
       Error.signature_verification_error(
         "No matching v1 signature found. Are you passing the raw request body?"
       )}
    end
  end

  # Constant-time string comparison to prevent timing attacks.
  defp secure_compare(a, b) when byte_size(a) != byte_size(b), do: false

  defp secure_compare(a, b) do
    a_bytes = :binary.bin_to_list(a)
    b_bytes = :binary.bin_to_list(b)

    result =
      Enum.zip(a_bytes, b_bytes)
      |> Enum.reduce(0, fn {x, y}, acc -> Bitwise.bor(acc, Bitwise.bxor(x, y)) end)

    result == 0
  end
end
