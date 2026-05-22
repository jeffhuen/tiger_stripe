defmodule Stripe.StreamingTest do
  use ExUnit.Case, async: true

  alias Stripe.Client

  setup do
    client = Stripe.client("sk_test_123")
    %{client: client}
  end

  describe "raw_request/4" do
    test "returns raw response without deserialization" do
      Stripe.Test.stub(fn _req ->
        {200, [{"request-id", "req_abc"}],
         ~s({"id": "ch_123", "object": "charge", "amount": 2000})}
      end)

      client = Stripe.Test.client("sk_test_123")
      {:ok, resp} = Client.raw_request(client, :get, "/v1/charges/ch_123")

      assert resp.status == 200
      assert is_binary(resp.body)
      assert is_list(resp.headers)
      # Body is raw JSON string, NOT a struct
      assert resp.body =~ "ch_123"
    end

    test "returns error tuple on connection failure", %{client: client} do
      bad_client = %{client | transport: fn _request -> {:error, :econnrefused} end}

      {:error, error} = Client.raw_request(bad_client, :get, "/v1/charges")

      assert %Stripe.Error{type: :api_connection_error} = error
    end

    test "passes params as query string for GET" do
      Stripe.Test.stub(fn %{url: url} ->
        assert url =~ "limit=5"
        {200, [], ~s({"ok": true})}
      end)

      client = Stripe.Test.client("sk_test_123")
      {:ok, resp} = Client.raw_request(client, :get, "/v1/charges", params: %{"limit" => 5})

      assert resp.status == 200
    end
  end

  describe "stream_request/6" do
    test "streams response chunks through accumulator" do
      body = String.duplicate("chunk_data", 100)

      Stripe.Test.stub(fn _req ->
        {200, [{"content-type", "text/event-stream"}], body}
      end)

      client = Stripe.Test.client("sk_test_123")

      {:ok, result} =
        Client.stream_request(
          client,
          :get,
          "/v1/events",
          fn
            {:status, status}, acc -> Map.put(acc, :status, status)
            {:headers, headers}, acc -> Map.put(acc, :headers, headers)
            {:data, data}, acc -> Map.update(acc, :chunks, [data], &[data | &1])
          end,
          %{},
          []
        )

      assert result.status == 200
      assert is_list(result.headers)
      assert length(result.chunks) == 1
      assert hd(result.chunks) == body
    end

    test "streams large payload" do
      # 1MB payload
      large_body = :crypto.strong_rand_bytes(1_000_000) |> Base.encode64()

      Stripe.Test.stub(fn _req ->
        {200, [], large_body}
      end)

      client = Stripe.Test.client("sk_test_123")

      {:ok, result} =
        Client.stream_request(
          client,
          :get,
          "/v1/files/file_123/contents",
          fn
            {:data, chunk}, acc -> acc + byte_size(chunk)
            _other, acc -> acc
          end,
          0,
          []
        )

      assert result == byte_size(large_body)
    end

    test "uses api_mode for V2 requests" do
      Stripe.Test.stub(fn %{headers: headers} ->
        # V2 requests should have an idempotency-key header for POST
        assert Enum.any?(headers, fn {k, _} -> k == "idempotency-key" end)
        {200, [], ~s({"ok": true})}
      end)

      client = Stripe.Test.client("sk_test_123")

      {:ok, _} =
        Client.stream_request(
          client,
          :post,
          "/v2/billing/meter_event_stream",
          fn _chunk, acc -> acc end,
          nil,
          api_mode: :v2,
          params: %{}
        )
    end
  end
end
