defmodule Stripe.ClientTest do
  use ExUnit.Case, async: true

  alias Stripe.Client

  describe "encode_form_params/1" do
    test "encodes flat params" do
      assert Client.encode_form_params(%{amount: 2000, currency: "usd"}) in [
               "amount=2000&currency=usd",
               "currency=usd&amount=2000"
             ]
    end

    test "encodes nested params with bracket notation" do
      result = Client.encode_form_params(%{metadata: %{order_id: "123"}})
      assert result == "metadata%5Border_id%5D=123"
    end

    test "encodes deeply nested params" do
      result =
        Client.encode_form_params(%{
          payment_method_data: %{billing_details: %{name: "Jenny"}}
        })

      assert result == "payment_method_data%5Bbilling_details%5D%5Bname%5D=Jenny"
    end

    test "encodes list params with indices" do
      result = Client.encode_form_params(%{items: ["a", "b"]})
      assert result =~ "items%5B0%5D=a"
      assert result =~ "items%5B1%5D=b"
    end

    test "encodes boolean values" do
      result = Client.encode_form_params(%{active: true, archived: false})
      assert result =~ "active=true"
      assert result =~ "archived=false"
    end

    test "encodes empty map as empty string" do
      assert Client.encode_form_params(%{}) == ""
    end
  end

  describe "client/0 (from config)" do
    setup do
      # Clean up after each test
      on_exit(fn ->
        Application.delete_env(:tiger_stripe, :api_key)
        Application.delete_env(:tiger_stripe, :max_retries)
        Application.delete_env(:tiger_stripe, :stripe_account)
        Application.delete_env(:tiger_stripe, :webhook_secret)
      end)

      :ok
    end

    test "creates client from application config" do
      Application.put_env(:tiger_stripe, :api_key, "sk_test_from_config")
      client = Stripe.client()
      assert client.api_key == "sk_test_from_config"
    end

    test "raises when api_key not configured" do
      Application.delete_env(:tiger_stripe, :api_key)

      assert_raise ArgumentError, ~r/Stripe API key not configured/, fn ->
        Stripe.client()
      end
    end

    test "merges config options into client" do
      Application.put_env(:tiger_stripe, :api_key, "sk_test_cfg")
      Application.put_env(:tiger_stripe, :max_retries, 5)
      Application.put_env(:tiger_stripe, :stripe_account, "acct_cfg")

      client = Stripe.client()
      assert client.api_key == "sk_test_cfg"
      assert client.max_retries == 5
      assert client.stripe_account == "acct_cfg"
    end

    test "ignores non-client config keys like webhook_secret" do
      Application.put_env(:tiger_stripe, :api_key, "sk_test_cfg")
      Application.put_env(:tiger_stripe, :webhook_secret, "whsec_123")

      client = Stripe.client()
      assert client.api_key == "sk_test_cfg"
      # webhook_secret is not a field on Client struct — no crash
    end
  end

  describe "client/1 (keyword overrides)" do
    setup do
      on_exit(fn ->
        Application.delete_env(:tiger_stripe, :api_key)
        Application.delete_env(:tiger_stripe, :max_retries)
      end)

      :ok
    end

    test "overrides config with keyword opts" do
      Application.put_env(:tiger_stripe, :api_key, "sk_test_cfg")
      Application.put_env(:tiger_stripe, :max_retries, 5)

      client = Stripe.client(max_retries: 10)
      assert client.api_key == "sk_test_cfg"
      assert client.max_retries == 10
    end

    test "keyword opts can provide api_key" do
      client = Stripe.client(api_key: "sk_test_kwarg")
      assert client.api_key == "sk_test_kwarg"
    end
  end

  describe "client/2 (explicit key + opts)" do
    setup do
      on_exit(fn ->
        Application.delete_env(:tiger_stripe, :max_retries)
      end)

      :ok
    end

    test "explicit key takes precedence over config" do
      Application.put_env(:tiger_stripe, :api_key, "sk_test_cfg")
      client = Stripe.client("sk_test_explicit")
      assert client.api_key == "sk_test_explicit"
    end

    test "merges config defaults with explicit opts" do
      Application.put_env(:tiger_stripe, :max_retries, 5)
      client = Stripe.client("sk_test_key", stripe_account: "acct_123")
      assert client.api_key == "sk_test_key"
      assert client.max_retries == 5
      assert client.stripe_account == "acct_123"
    end

    test "explicit opts override config" do
      Application.put_env(:tiger_stripe, :max_retries, 5)
      client = Stripe.client("sk_test_key", max_retries: 10)
      assert client.max_retries == 10
    end
  end

  describe "struct defaults" do
    test "has correct default values" do
      client = %Client{api_key: "sk_test"}
      assert client.api_base == "https://api.stripe.com"
      assert client.connect_base == "https://connect.stripe.com"
      assert client.uploads_base == "https://files.stripe.com"
      assert client.meter_events_base == "https://meter-events.stripe.com"
      assert client.max_retries == 2
      assert client.open_timeout == 30_000
      assert client.read_timeout == 80_000
      assert client.finch == Stripe.Finch
    end
  end

  describe "request/4 with stubs" do
    test "successful GET request" do
      Stripe.Test.stub(fn %{method: :get, url: url} ->
        assert url =~ "/v1/charges/ch_123"
        {200, [], ~s({"id": "ch_123", "object": "charge", "amount": 2000})}
      end)

      client = Stripe.client("sk_test_123")
      {:ok, data} = Client.request(client, :get, "/v1/charges/ch_123")

      assert data.id == "ch_123"
      assert data.amount == 2000
    end

    test "successful POST with params" do
      Stripe.Test.stub(fn %{method: :post, body: body, headers: headers} ->
        assert body =~ "amount=2000"
        assert body =~ "currency=usd"

        assert List.keyfind(headers, "content-type", 0) ==
                 {"content-type", "application/x-www-form-urlencoded"}

        {200, [], ~s({"id": "ch_new", "object": "charge"})}
      end)

      client = Stripe.client("sk_test_123")

      {:ok, data} =
        Client.request(client, :post, "/v1/charges", params: %{amount: 2000, currency: "usd"})

      assert data.id == "ch_new"
    end

    test "V2 POST sends JSON body" do
      Stripe.Test.stub(fn %{method: :post, body: body, headers: headers} ->
        assert List.keyfind(headers, "content-type", 0) == {"content-type", "application/json"}
        decoded = JSON.decode!(body)
        assert decoded["amount"] == 2000
        {200, [], ~s({"id": "evt_123"})}
      end)

      client = Stripe.client("sk_test_123")

      {:ok, data} =
        Client.request(client, :post, "/v2/billing/meter_events",
          params: %{amount: 2000},
          api_mode: :v2
        )

      assert data["id"] == "evt_123"
    end

    test "sends authorization header" do
      Stripe.Test.stub(fn %{headers: headers} ->
        assert List.keyfind(headers, "authorization", 0) ==
                 {"authorization", "Bearer sk_test_secret"}

        {200, [], ~s({"ok": true})}
      end)

      client = Stripe.client("sk_test_secret")
      assert {:ok, _} = Client.request(client, :get, "/v1/balance")
    end

    test "sends stripe-version header when set" do
      Stripe.Test.stub(fn %{headers: headers} ->
        assert List.keyfind(headers, "stripe-version", 0) ==
                 {"stripe-version", "2026-01-28.clover"}

        {200, [], ~s({"ok": true})}
      end)

      client = Stripe.client("sk_test_123", api_version: "2026-01-28.clover")
      assert {:ok, _} = Client.request(client, :get, "/v1/balance")
    end

    test "sends stripe-account header when set" do
      Stripe.Test.stub(fn %{headers: headers} ->
        assert List.keyfind(headers, "stripe-account", 0) == {"stripe-account", "acct_connect"}
        {200, [], ~s({"ok": true})}
      end)

      client = Stripe.client("sk_test_123", stripe_account: "acct_connect")
      assert {:ok, _} = Client.request(client, :get, "/v1/balance")
    end

    test "per-request option overrides client-level setting" do
      Stripe.Test.stub(fn %{headers: headers} ->
        assert List.keyfind(headers, "stripe-version", 0) ==
                 {"stripe-version", "2025-12-18.acacia"}

        {200, [], ~s({"ok": true})}
      end)

      client = Stripe.client("sk_test_123", api_version: "2026-01-28.clover")

      assert {:ok, _} =
               Client.request(client, :get, "/v1/balance", api_version: "2025-12-18.acacia")
    end

    test "sends idempotency-key when provided" do
      Stripe.Test.stub(fn %{headers: headers} ->
        assert List.keyfind(headers, "idempotency-key", 0) == {"idempotency-key", "my-key-123"}
        {200, [], ~s({"ok": true})}
      end)

      client = Stripe.client("sk_test_123")

      assert {:ok, _} =
               Client.request(client, :post, "/v1/charges", idempotency_key: "my-key-123")
    end

    test "returns error for 4xx responses" do
      Stripe.Test.stub(fn _req ->
        body =
          JSON.encode!(%{
            "error" => %{"type" => "invalid_request_error", "message" => "No such charge"}
          })

        {404, [{"request-id", "req_abc"}], body}
      end)

      client = Stripe.client("sk_test_123")
      {:error, error} = Client.request(client, :get, "/v1/charges/ch_bad")

      assert error.type == :invalid_request_error
      assert error.message == "No such charge"
      assert error.request_id == "req_abc"
    end

    test "retries on 500 and eventually succeeds" do
      # Use a counter in the process dictionary to track attempts
      Process.put(:attempt, 0)

      Stripe.Test.stub(fn _req ->
        attempt = Process.get(:attempt)
        Process.put(:attempt, attempt + 1)

        if attempt == 0 do
          {500, [], ~s({"error": {"message": "Internal error"}})}
        else
          {200, [], ~s({"id": "ch_123"})}
        end
      end)

      client = Stripe.client("sk_test_123", max_retries: 2)
      {:ok, data} = Client.request(client, :get, "/v1/charges/ch_123")

      assert data["id"] == "ch_123"
      assert Process.get(:attempt) == 2
    end

    test "respects stripe-should-retry: false" do
      Stripe.Test.stub(fn _req ->
        {500, [{"stripe-should-retry", "false"}], ~s({"error": {"message": "Fatal"}})}
      end)

      client = Stripe.client("sk_test_123", max_retries: 3)
      {:error, error} = Client.request(client, :get, "/v1/charges")

      assert error.type == :api_error
      assert error.message == "Fatal"
    end

    test "merges expand into params" do
      Stripe.Test.stub(fn %{url: url} ->
        assert url =~ "expand"
        {200, [], ~s({"id": "ch_123"})}
      end)

      client = Stripe.client("sk_test_123")
      assert {:ok, _} = Client.request(client, :get, "/v1/charges/ch_123", expand: ["customer"])
    end
  end

  describe "telemetry" do
    setup do
      ref = make_ref()
      pid = self()

      :telemetry.attach(
        "test-start-#{inspect(ref)}",
        [:stripe, :request, :start],
        fn event, measurements, metadata, _ ->
          send(pid, {:telemetry_start, ref, event, measurements, metadata})
        end,
        nil
      )

      :telemetry.attach(
        "test-stop-#{inspect(ref)}",
        [:stripe, :request, :stop],
        fn event, measurements, metadata, _ ->
          send(pid, {:telemetry_stop, ref, event, measurements, metadata})
        end,
        nil
      )

      on_exit(fn ->
        :telemetry.detach("test-start-#{inspect(ref)}")
        :telemetry.detach("test-stop-#{inspect(ref)}")
      end)

      %{ref: ref}
    end

    test "emits start and stop events on success", %{ref: ref} do
      Stripe.Test.stub(fn _req ->
        {200, [{"request-id", "req_test_123"}], ~s({"id": "ch_1"})}
      end)

      client = Stripe.client("sk_test_123")
      {:ok, _} = Client.request(client, :get, "/v1/charges/ch_1")

      assert_receive {:telemetry_start, ^ref, [:stripe, :request, :start], %{system_time: _},
                      %{method: :get, path: "/v1/charges/ch_1"}}

      assert_receive {:telemetry_stop, ^ref, [:stripe, :request, :stop], %{duration: duration},
                      %{
                        method: :get,
                        path: "/v1/charges/ch_1",
                        base_address: :api,
                        http_status: 200,
                        num_retries: 0,
                        request_id: "req_test_123"
                      }}

      assert is_integer(duration) and duration > 0
    end

    test "includes http_status and error on failure", %{ref: ref} do
      Stripe.Test.stub(fn _req ->
        body =
          JSON.encode!(%{"error" => %{"type" => "invalid_request_error", "message" => "Bad"}})

        {400, [{"request-id", "req_fail"}], body}
      end)

      client = Stripe.client("sk_test_123")
      {:error, _} = Client.request(client, :get, "/v1/bad")

      assert_receive {:telemetry_stop, ^ref, _, %{duration: _},
                      %{
                        http_status: 400,
                        num_retries: 0,
                        request_id: "req_fail",
                        error: %Stripe.Error{}
                      }}
    end

    test "reports num_retries after retry", %{ref: ref} do
      Process.put(:telemetry_attempt, 0)

      Stripe.Test.stub(fn _req ->
        attempt = Process.get(:telemetry_attempt)
        Process.put(:telemetry_attempt, attempt + 1)

        if attempt == 0 do
          {500, [{"request-id", "req_retry_0"}], ~s({"error": {"message": "Server error"}})}
        else
          {200, [{"request-id", "req_retry_1"}], ~s({"id": "ch_ok"})}
        end
      end)

      client = Stripe.client("sk_test_123", max_retries: 2)
      {:ok, _} = Client.request(client, :get, "/v1/charges")

      assert_receive {:telemetry_stop, ^ref, _, _,
                      %{http_status: 200, num_retries: 1, request_id: "req_retry_1"}}
    end

    test "handles nil request_id when no header present", %{ref: ref} do
      Stripe.Test.stub(fn _req ->
        {200, [], ~s({"id": "ch_1"})}
      end)

      client = Stripe.client("sk_test_123")
      {:ok, _} = Client.request(client, :get, "/v1/charges/ch_1")

      assert_receive {:telemetry_stop, ^ref, _, _, %{request_id: nil}}
    end
  end
end
