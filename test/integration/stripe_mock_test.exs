defmodule Stripe.Integration.StripeMockTest do
  @moduledoc """
  Integration tests against stripe-mock (https://github.com/stripe/stripe-mock).

  Requires stripe-mock running on localhost:12111:

      # Install: brew install stripe/stripe-mock/stripe-mock
      # Run:     stripe-mock

  Run with:

      mix test --include integration
  """
  use ExUnit.Case

  @moduletag :integration

  @client Stripe.client("sk_test_123",
            api_base: "http://localhost:12111",
            max_retries: 0
          )

  setup_all do
    case :gen_tcp.connect(~c"localhost", 12_111, [], 1_000) do
      {:ok, socket} ->
        :gen_tcp.close(socket)
        :ok

      {:error, _} ->
        raise "stripe-mock not running on localhost:12111. Install: brew install stripe/stripe-mock/stripe-mock"
    end
  end

  # -- Deserialization --------------------------------------------------------

  describe "deserialization" do
    test "GET /v1/charges returns ListObject with Charge structs" do
      {:ok, result} = Stripe.Client.request(@client, :get, "/v1/charges")

      assert %Stripe.ListObject{} = result
      assert is_list(result.data)
      assert result.object == "list"
      assert is_binary(result.url)
    end

    test "POST /v1/charges returns a Charge struct" do
      {:ok, charge} =
        Stripe.Client.request(@client, :post, "/v1/charges",
          params: %{"amount" => 2000, "currency" => "usd", "source" => "tok_visa"}
        )

      assert %Stripe.Resources.Charge{} = charge
      assert is_binary(charge.id)
      assert charge.object == "charge"
    end

    test "GET /v1/customers returns typed Customer structs" do
      {:ok, result} = Stripe.Client.request(@client, :get, "/v1/customers")

      assert %Stripe.ListObject{} = result

      for customer <- result.data do
        assert %Stripe.Resources.Customer{} = customer
        assert customer.object == "customer"
      end
    end

    test "GET /v1/balance returns a Balance struct" do
      {:ok, balance} = Stripe.Client.request(@client, :get, "/v1/balance")

      assert %Stripe.Resources.Balance{} = balance
      assert balance.object == "balance"
    end
  end

  # -- Pagination wrappers ----------------------------------------------------

  describe "list pagination" do
    test "ListObject has correct pagination fields" do
      {:ok, result} =
        Stripe.Client.request(@client, :get, "/v1/charges", params: %{"limit" => 3})

      assert %Stripe.ListObject{} = result
      assert is_boolean(result.has_more)
      assert is_binary(result.url)
    end

    test "auto_paging_stream yields items" do
      {:ok, page} =
        Stripe.Client.request(@client, :get, "/v1/charges", params: %{"limit" => 2})

      items =
        page
        |> Stripe.ListObject.auto_paging_stream(@client)
        |> Enum.take(5)

      assert is_list(items)
      assert items != []
    end
  end

  describe "search pagination" do
    test "GET /v1/charges/search returns SearchResult" do
      {:ok, result} =
        Stripe.Client.request(@client, :get, "/v1/charges/search",
          params: %{"query" => "amount>100"}
        )

      assert %Stripe.SearchResult{} = result
      assert result.object == "search_result"
      assert is_list(result.data)
    end
  end

  # -- Expandable fields ------------------------------------------------------

  describe "expandable fields" do
    test "expanded object is deserialized to a struct" do
      {:ok, charge} =
        Stripe.Client.request(@client, :post, "/v1/charges",
          params: %{"amount" => 2000, "currency" => "usd", "source" => "tok_visa"},
          expand: ["balance_transaction"]
        )

      assert %Stripe.Resources.Charge{} = charge

      # When expanded, balance_transaction must be a struct (not a string ID).
      # An unconditional assert so a failed expansion breaks the build.
      assert %Stripe.Resources.BalanceTransaction{} = charge.balance_transaction
    end
  end

  # -- Webhook construction path ----------------------------------------------

  describe "webhook construction" do
    test "construct_event with valid signature produces typed struct" do
      payload = ~s({"id": "evt_123", "object": "event", "type": "charge.created"})
      secret = "whsec_test_secret"
      timestamp = System.system_time(:second)
      sig = Stripe.Webhook.compute_signature(timestamp, payload, secret)
      sig_header = "t=#{timestamp},v1=#{sig}"

      {:ok, event} = Stripe.Webhook.construct_event(payload, sig_header, secret)

      assert %Stripe.Resources.Event{} = event
      assert event.id == "evt_123"
      assert event.type == "charge.created"
    end
  end

  # -- Error handling ---------------------------------------------------------

  describe "error responses" do
    test "404 returns an error tuple" do
      {:error, error} = Stripe.Client.request(@client, :get, "/v1/charges/nonexistent_123")

      assert %Stripe.Error{} = error
      assert error.http_status in [404, 400]
    end
  end
end
