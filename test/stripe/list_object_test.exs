defmodule Stripe.ListObjectTest do
  use ExUnit.Case, async: true

  alias Stripe.{ListObject, SearchResult}
  alias Stripe.V2

  # -- V1 ListObject auto-paging -----------------------------------------------

  describe "ListObject.auto_paging_stream/3" do
    test "single page (has_more: false) yields items and stops" do
      Stripe.Test.stub(fn _req ->
        flunk("should not fetch another page")
      end)

      page = %ListObject{
        object: "list",
        data: [
          %Stripe.Resources.Charge{id: "ch_1", amount: 100},
          %Stripe.Resources.Charge{id: "ch_2", amount: 200}
        ],
        has_more: false,
        url: "/v1/charges"
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> ListObject.auto_paging_stream(client) |> Enum.to_list()

      assert length(items) == 2
      assert %Stripe.Resources.Charge{id: "ch_1"} = hd(items)
    end

    test "multi-page iteration uses starting_after cursor" do
      # Track calls to verify pagination params
      Process.put(:page_call, 0)

      Stripe.Test.stub(fn %{url: url} ->
        call = Process.get(:page_call)
        Process.put(:page_call, call + 1)

        assert url =~ "starting_after=ch_2"

        {200, [],
         JSON.encode!(%{
           "object" => "list",
           "data" => [
             %{"object" => "charge", "id" => "ch_3", "amount" => 300}
           ],
           "has_more" => false,
           "url" => "/v1/charges"
         })}
      end)

      page = %ListObject{
        object: "list",
        data: [
          %Stripe.Resources.Charge{id: "ch_1", amount: 100},
          %Stripe.Resources.Charge{id: "ch_2", amount: 200}
        ],
        has_more: true,
        url: "/v1/charges"
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> ListObject.auto_paging_stream(client) |> Enum.to_list()

      assert length(items) == 3
      assert Enum.map(items, & &1.id) == ["ch_1", "ch_2", "ch_3"]
      assert Process.get(:page_call) == 1
    end

    test "three pages iteration" do
      Process.put(:page_call, 0)

      Stripe.Test.stub(fn %{url: url} ->
        call = Process.get(:page_call)
        Process.put(:page_call, call + 1)

        case call do
          0 ->
            assert url =~ "starting_after=ch_2"

            {200, [],
             JSON.encode!(%{
               "object" => "list",
               "data" => [%{"object" => "charge", "id" => "ch_3"}],
               "has_more" => true,
               "url" => "/v1/charges"
             })}

          1 ->
            assert url =~ "starting_after=ch_3"

            {200, [],
             JSON.encode!(%{
               "object" => "list",
               "data" => [%{"object" => "charge", "id" => "ch_4"}],
               "has_more" => false,
               "url" => "/v1/charges"
             })}
        end
      end)

      page = %ListObject{
        object: "list",
        data: [
          %Stripe.Resources.Charge{id: "ch_1"},
          %Stripe.Resources.Charge{id: "ch_2"}
        ],
        has_more: true,
        url: "/v1/charges"
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> ListObject.auto_paging_stream(client) |> Enum.to_list()

      assert Enum.map(items, & &1.id) == ["ch_1", "ch_2", "ch_3", "ch_4"]
      assert Process.get(:page_call) == 2
    end

    test "stops on error response" do
      Stripe.Test.stub(fn _req ->
        {500, [], ~s({"error": {"message": "Internal error"}})}
      end)

      page = %ListObject{
        object: "list",
        data: [%Stripe.Resources.Charge{id: "ch_1"}],
        has_more: true,
        url: "/v1/charges"
      }

      client = Stripe.Test.client("sk_test_123", max_retries: 0)
      items = page |> ListObject.auto_paging_stream(client) |> Enum.to_list()

      # Only gets the first page's items, stops gracefully on error
      assert length(items) == 1
      assert hd(items).id == "ch_1"
    end

    test "laziness — Enum.take does not exhaust infinite pages" do
      Process.put(:page_call, 0)

      Stripe.Test.stub(fn _req ->
        Process.put(:page_call, Process.get(:page_call) + 1)

        {200, [],
         JSON.encode!(%{
           "object" => "list",
           "data" => [%{"object" => "charge", "id" => "ch_next"}],
           "has_more" => true,
           "url" => "/v1/charges"
         })}
      end)

      page = %ListObject{
        object: "list",
        data: [
          %Stripe.Resources.Charge{id: "ch_1"},
          %Stripe.Resources.Charge{id: "ch_2"},
          %Stripe.Resources.Charge{id: "ch_3"}
        ],
        has_more: true,
        url: "/v1/charges"
      }

      client = Stripe.Test.client("sk_test_123")
      # Take only 4 items from an infinite stream — should not fetch all pages
      items = page |> ListObject.auto_paging_stream(client) |> Enum.take(4)

      assert length(items) == 4
      # Stream.unfold evaluates one-ahead, but should not run unbounded
      assert Process.get(:page_call) <= 2
    end
  end

  # -- V1 SearchResult auto-paging --------------------------------------------

  describe "SearchResult.auto_paging_stream/3" do
    test "single page (has_more: false) yields items and stops" do
      Stripe.Test.stub(fn _req ->
        flunk("should not fetch another page")
      end)

      page = %SearchResult{
        object: "search_result",
        data: [%Stripe.Resources.Charge{id: "ch_1"}],
        has_more: false,
        url: "/v1/charges/search",
        next_page: nil,
        total_count: 1
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> SearchResult.auto_paging_stream(client) |> Enum.to_list()

      assert length(items) == 1
    end

    test "multi-page iteration uses page token" do
      Process.put(:page_call, 0)

      Stripe.Test.stub(fn %{url: url} ->
        call = Process.get(:page_call)
        Process.put(:page_call, call + 1)

        case call do
          0 ->
            assert url =~ "page=token_abc"

            {200, [],
             JSON.encode!(%{
               "object" => "search_result",
               "data" => [%{"object" => "charge", "id" => "ch_3"}],
               "has_more" => true,
               "url" => "/v1/charges/search",
               "next_page" => "token_def",
               "total_count" => 5
             })}

          1 ->
            assert url =~ "page=token_def"

            {200, [],
             JSON.encode!(%{
               "object" => "search_result",
               "data" => [%{"object" => "charge", "id" => "ch_4"}],
               "has_more" => false,
               "url" => "/v1/charges/search",
               "next_page" => nil,
               "total_count" => 5
             })}
        end
      end)

      page = %SearchResult{
        object: "search_result",
        data: [
          %Stripe.Resources.Charge{id: "ch_1"},
          %Stripe.Resources.Charge{id: "ch_2"}
        ],
        has_more: true,
        url: "/v1/charges/search",
        next_page: "token_abc",
        total_count: 5
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> SearchResult.auto_paging_stream(client) |> Enum.to_list()

      assert Enum.map(items, & &1.id) == ["ch_1", "ch_2", "ch_3", "ch_4"]
      assert Process.get(:page_call) == 2
    end

    test "stops when next_page is nil even if has_more is true" do
      Stripe.Test.stub(fn _req ->
        flunk("should not fetch another page")
      end)

      page = %SearchResult{
        object: "search_result",
        data: [%Stripe.Resources.Charge{id: "ch_1"}],
        has_more: true,
        url: "/v1/charges/search",
        next_page: nil,
        total_count: 1
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> SearchResult.auto_paging_stream(client) |> Enum.to_list()

      assert length(items) == 1
    end
  end

  # -- V2 ListObject auto-paging ----------------------------------------------

  describe "V2.ListObject.auto_paging_stream/3" do
    test "single page (next_page_url: nil) yields items and stops" do
      Stripe.Test.stub(fn _req ->
        flunk("should not fetch another page")
      end)

      page = %V2.ListObject{
        data: [
          %Stripe.Resources.V2.Billing.MeterEvent{
            identifier: "id_1",
            event_name: "api_calls"
          }
        ],
        next_page_url: nil
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> V2.ListObject.auto_paging_stream(client) |> Enum.to_list()

      assert length(items) == 1
    end

    test "multi-page iteration uses next_page_url" do
      Process.put(:page_call, 0)

      Stripe.Test.stub(fn %{url: url} ->
        call = Process.get(:page_call)
        Process.put(:page_call, call + 1)

        case call do
          0 ->
            assert url =~ "/v2/billing/meter_events?page=2"

            {200, [],
             JSON.encode!(%{
               "data" => [
                 %{
                   "object" => "v2.billing.meter_event",
                   "identifier" => "id_3",
                   "event_name" => "api_calls"
                 }
               ],
               "next_page_url" => nil
             })}

          _ ->
            flunk("should not fetch more pages")
        end
      end)

      page = %V2.ListObject{
        data: [
          %Stripe.Resources.V2.Billing.MeterEvent{
            identifier: "id_1",
            event_name: "api_calls"
          },
          %Stripe.Resources.V2.Billing.MeterEvent{
            identifier: "id_2",
            event_name: "api_calls"
          }
        ],
        next_page_url: "https://api.stripe.com/v2/billing/meter_events?page=2"
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> V2.ListObject.auto_paging_stream(client) |> Enum.to_list()

      assert length(items) == 3
      assert Process.get(:page_call) == 1
    end

    test "three-page V2 iteration" do
      Process.put(:page_call, 0)

      Stripe.Test.stub(fn _req ->
        call = Process.get(:page_call)
        Process.put(:page_call, call + 1)

        case call do
          0 ->
            {200, [],
             JSON.encode!(%{
               "data" => [
                 %{
                   "object" => "v2.billing.meter_event",
                   "identifier" => "id_2",
                   "event_name" => "x"
                 }
               ],
               "next_page_url" => "https://api.stripe.com/v2/billing/meter_events?page=3"
             })}

          1 ->
            {200, [],
             JSON.encode!(%{
               "data" => [
                 %{
                   "object" => "v2.billing.meter_event",
                   "identifier" => "id_3",
                   "event_name" => "x"
                 }
               ],
               "next_page_url" => nil
             })}
        end
      end)

      page = %V2.ListObject{
        data: [%Stripe.Resources.V2.Billing.MeterEvent{identifier: "id_1", event_name: "x"}],
        next_page_url: "https://api.stripe.com/v2/billing/meter_events?page=2"
      }

      client = Stripe.Test.client("sk_test_123")
      items = page |> V2.ListObject.auto_paging_stream(client) |> Enum.to_list()

      assert length(items) == 3
      assert Process.get(:page_call) == 2
    end
  end
end
