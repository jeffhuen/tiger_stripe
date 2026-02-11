defmodule Stripe.DeserializerTest do
  use ExUnit.Case, async: true

  alias Stripe.Deserializer

  describe "cast/2 basic objects" do
    test "casts a known object type to struct" do
      data = %{
        "object" => "charge",
        "id" => "ch_123",
        "amount" => 2000,
        "currency" => "usd",
        "captured" => true
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.Charge{} = result
      assert result.id == "ch_123"
      assert result.amount == 2000
      assert result.currency == "usd"
      assert result.captured == true
      assert result.object == "charge"
    end

    test "returns raw map for unknown object type" do
      data = %{"object" => "unknown_thing", "id" => "x_123"}
      assert Deserializer.cast(data) == data
    end

    test "returns raw map when no object key" do
      data = %{"id" => "something", "ok" => true}
      assert Deserializer.cast(data) == data
    end

    test "nil fields remain nil" do
      data = %{"object" => "charge", "id" => "ch_123", "description" => nil}
      result = Deserializer.cast(data)
      assert %Stripe.Resources.Charge{} = result
      assert result.description == nil
    end

    test "extra JSON keys not in struct are ignored" do
      data = %{"object" => "charge", "id" => "ch_123", "nonexistent_field" => "ignored"}
      result = Deserializer.cast(data)
      assert %Stripe.Resources.Charge{} = result
      assert result.id == "ch_123"
      refute Map.has_key?(result, :nonexistent_field)
    end
  end

  describe "cast/2 list wrappers" do
    test "casts V1 list object with deserialized items" do
      data = %{
        "object" => "list",
        "data" => [
          %{"object" => "charge", "id" => "ch_1", "amount" => 100},
          %{"object" => "charge", "id" => "ch_2", "amount" => 200}
        ],
        "has_more" => true,
        "url" => "/v1/charges"
      }

      result = Deserializer.cast(data)
      assert %Stripe.ListObject{} = result
      assert result.object == "list"
      assert result.has_more == true
      assert result.url == "/v1/charges"
      assert length(result.data) == 2
      assert %Stripe.Resources.Charge{id: "ch_1"} = hd(result.data)
    end

    test "casts V1 search result with deserialized items" do
      data = %{
        "object" => "search_result",
        "data" => [
          %{"object" => "charge", "id" => "ch_1"}
        ],
        "has_more" => false,
        "url" => "/v1/charges/search",
        "next_page" => "page_2",
        "total_count" => 42
      }

      result = Deserializer.cast(data)
      assert %Stripe.SearchResult{} = result
      assert result.has_more == false
      assert result.next_page == "page_2"
      assert result.total_count == 42
      assert %Stripe.Resources.Charge{id: "ch_1"} = hd(result.data)
    end

    test "casts V2 list object with deserialized items" do
      data = %{
        "data" => [
          %{
            "object" => "v2.billing.meter_event",
            "event_name" => "api_calls",
            "identifier" => "id_1"
          }
        ],
        "next_page_url" => "https://api.stripe.com/v2/billing/meter_events?page=2"
      }

      result = Deserializer.cast(data, api_mode: :v2)
      assert %Stripe.V2.ListObject{} = result
      assert result.next_page_url == "https://api.stripe.com/v2/billing/meter_events?page=2"
      assert length(result.data) == 1
      assert %Stripe.Resources.V2.Billing.MeterEvent{} = hd(result.data)
    end
  end

  describe "cast/2 inner types" do
    test "casts embedded list inner type (Charge.Refunds)" do
      data = %{
        "object" => "charge",
        "id" => "ch_123",
        "refunds" => %{
          "object" => "list",
          "data" => [
            %{"object" => "refund", "id" => "re_1", "amount" => 500},
            %{"object" => "refund", "id" => "re_2", "amount" => 300}
          ],
          "has_more" => false,
          "url" => "/v1/charges/ch_123/refunds"
        }
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.Charge{} = result
      assert %Stripe.Resources.Charge.Refunds{} = result.refunds
      assert result.refunds.has_more == false
      assert result.refunds.url == "/v1/charges/ch_123/refunds"
      # The embedded list's data items should be recursively cast
      assert length(result.refunds.data) == 2
      assert %Stripe.Resources.Refund{id: "re_1"} = hd(result.refunds.data)
    end
  end

  describe "cast/2 deeply nested inner types" do
    test "casts InvoiceLineItem.Parent.SubscriptionItemDetails to struct" do
      data = %{
        "object" => "line_item",
        "id" => "il_123",
        "amount" => 1000,
        "currency" => "usd",
        "parent" => %{
          "type" => "subscription_item_details",
          "subscription_item_details" => %{
            "invoice_item" => "ii_123",
            "proration" => true,
            "proration_details" => %{
              "credited_items" => %{
                "invoice" => "in_456",
                "invoice_line_items" => ["il_789"]
              }
            },
            "subscription" => "sub_123",
            "subscription_item" => "si_123"
          },
          "invoice_item_details" => nil
        }
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.InvoiceLineItem{} = result
      assert %Stripe.Resources.InvoiceLineItem.Parent{} = result.parent
      assert result.parent.type == "subscription_item_details"

      # Key assertion: nested inner type should be a struct, not a raw map
      sub_details = result.parent.subscription_item_details
      assert %Stripe.Resources.InvoiceLineItem.Parent.SubscriptionItemDetails{} = sub_details
      assert sub_details.proration == true
      assert sub_details.subscription == "sub_123"
      assert sub_details.subscription_item == "si_123"

      # 3 levels deep
      assert %Stripe.Resources.InvoiceLineItem.Parent.SubscriptionItemDetails.ProrationDetails{} =
               sub_details.proration_details

      assert %Stripe.Resources.InvoiceLineItem.Parent.SubscriptionItemDetails.ProrationDetails.CreditedItems{} =
               sub_details.proration_details.credited_items

      assert sub_details.proration_details.credited_items.invoice == "in_456"
    end
  end

  describe "cast/2 expandable fields" do
    test "expandable field as string ID passes through" do
      data = %{
        "object" => "charge",
        "id" => "ch_123",
        "customer" => "cus_456"
      }

      result = Deserializer.cast(data)
      assert result.customer == "cus_456"
    end

    test "expandable field as expanded object is recursively cast" do
      data = %{
        "object" => "charge",
        "id" => "ch_123",
        "customer" => %{
          "object" => "customer",
          "id" => "cus_456",
          "email" => "test@example.com"
        }
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.Customer{} = result.customer
      assert result.customer.id == "cus_456"
      assert result.customer.email == "test@example.com"
    end
  end

  describe "cast/2 expandable field edge cases" do
    test "array of expandable objects with mixed string IDs and expanded objects" do
      data = %{
        "object" => "list",
        "data" => [
          %{
            "object" => "charge",
            "id" => "ch_1",
            "customer" => "cus_unexpanded"
          },
          %{
            "object" => "charge",
            "id" => "ch_2",
            "customer" => %{
              "object" => "customer",
              "id" => "cus_expanded",
              "email" => "expanded@test.com"
            }
          }
        ],
        "has_more" => false,
        "url" => "/v1/charges"
      }

      result = Deserializer.cast(data)
      assert %Stripe.ListObject{} = result
      [charge1, charge2] = result.data

      # First charge: customer is unexpanded string ID
      assert charge1.customer == "cus_unexpanded"

      # Second charge: customer is expanded to a Customer struct
      assert %Stripe.Resources.Customer{id: "cus_expanded"} = charge2.customer
      assert charge2.customer.email == "expanded@test.com"
    end

    test "nested expanded objects inside paginated response" do
      data = %{
        "object" => "list",
        "data" => [
          %{
            "object" => "charge",
            "id" => "ch_1",
            "balance_transaction" => %{
              "object" => "balance_transaction",
              "id" => "txn_1",
              "amount" => 2000
            }
          }
        ],
        "has_more" => false,
        "url" => "/v1/charges"
      }

      result = Deserializer.cast(data)
      charge = hd(result.data)
      assert %Stripe.Resources.Charge{} = charge
      assert %Stripe.Resources.BalanceTransaction{id: "txn_1"} = charge.balance_transaction
      assert charge.balance_transaction.amount == 2000
    end

    test "deeply nested expanded objects (charge -> payment_intent -> customer)" do
      data = %{
        "object" => "charge",
        "id" => "ch_1",
        "payment_intent" => %{
          "object" => "payment_intent",
          "id" => "pi_1",
          "customer" => %{
            "object" => "customer",
            "id" => "cus_1",
            "email" => "deep@test.com"
          }
        }
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.Charge{} = result
      assert %Stripe.Resources.PaymentIntent{} = result.payment_intent
      assert %Stripe.Resources.Customer{} = result.payment_intent.customer
      assert result.payment_intent.customer.email == "deep@test.com"
    end

    test "list field with no inner type mapping but objects inside" do
      # A field that is a list of objects with "object" keys but not in __inner_types__
      data = %{
        "object" => "customer",
        "id" => "cus_1",
        "preferred_locales" => ["en", "fr"]
      }

      result = Deserializer.cast(data)
      assert result.preferred_locales == ["en", "fr"]
    end
  end

  describe "cast/2 event data deserialization" do
    test "event.data is an EventData struct" do
      data = %{
        "object" => "event",
        "id" => "evt_123",
        "type" => "invoice.created",
        "data" => %{
          "object" => %{
            "id" => "inv_123",
            "object" => "invoice",
            "amount_due" => 5000
          },
          "previous_attributes" => nil
        }
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.Event{} = result
      assert %Stripe.Resources.EventData{} = result.data
    end

    test "event.data.object is cast to typed resource struct" do
      data = %{
        "object" => "event",
        "id" => "evt_123",
        "type" => "invoice.created",
        "data" => %{
          "object" => %{
            "id" => "inv_123",
            "object" => "invoice",
            "amount_due" => 5000
          },
          "previous_attributes" => nil
        }
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.Invoice{} = result.data.object
      assert result.data.object.id == "inv_123"
      assert result.data.object.amount_due == 5000
    end

    test "event.data.object works with charge type" do
      data = %{
        "object" => "event",
        "id" => "evt_456",
        "type" => "charge.succeeded",
        "data" => %{
          "object" => %{
            "id" => "ch_789",
            "object" => "charge",
            "amount" => 2000,
            "currency" => "usd"
          },
          "previous_attributes" => nil
        }
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.Charge{} = result.data.object
      assert result.data.object.id == "ch_789"
      assert result.data.object.amount == 2000
    end

    test "event.data.previous_attributes is nil when absent" do
      data = %{
        "object" => "event",
        "id" => "evt_123",
        "type" => "invoice.created",
        "data" => %{
          "object" => %{"id" => "inv_123", "object" => "invoice"},
          "previous_attributes" => nil
        }
      }

      result = Deserializer.cast(data)
      assert result.data.previous_attributes == nil
    end

    test "event.data.previous_attributes is a raw map when present" do
      data = %{
        "object" => "event",
        "id" => "evt_123",
        "type" => "invoice.updated",
        "data" => %{
          "object" => %{"id" => "inv_123", "object" => "invoice"},
          "previous_attributes" => %{"amount_due" => 3000}
        }
      }

      result = Deserializer.cast(data)
      assert %Stripe.Resources.EventData{} = result.data
      assert result.data.previous_attributes == %{"amount_due" => 3000}
    end
  end

  describe "cast/2 V2 objects" do
    test "casts V2 object to struct" do
      data = %{
        "object" => "v2.billing.meter_event",
        "event_name" => "api_calls",
        "identifier" => "id_123",
        "livemode" => false,
        "created" => "2024-01-01T00:00:00Z",
        "timestamp" => "2024-01-01T00:00:00Z",
        "payload" => %{"value" => "10"}
      }

      result = Deserializer.cast(data, api_mode: :v2)
      assert %Stripe.Resources.V2.Billing.MeterEvent{} = result
      assert result.event_name == "api_calls"
      assert result.identifier == "id_123"
      assert result.livemode == false
    end

    test "V2 mode can resolve V1 objects embedded in V2 responses" do
      data = %{
        "object" => "charge",
        "id" => "ch_123"
      }

      result = Deserializer.cast(data, api_mode: :v2)
      assert %Stripe.Resources.Charge{id: "ch_123"} = result
    end
  end

  describe "cast/2 passthrough" do
    test "nil passes through" do
      assert Deserializer.cast(nil) == nil
    end

    test "string passes through" do
      assert Deserializer.cast("hello") == "hello"
    end

    test "integer passes through" do
      assert Deserializer.cast(42) == 42
    end

    test "top-level list casts each element individually" do
      data = [
        %{"object" => "charge", "id" => "ch_1"},
        %{"object" => "charge", "id" => "ch_2"},
        %{"id" => "raw_map"}
      ]

      result = Deserializer.cast(data)
      assert length(result) == 3
      assert %Stripe.Resources.Charge{id: "ch_1"} = Enum.at(result, 0)
      assert %Stripe.Resources.Charge{id: "ch_2"} = Enum.at(result, 1)
      assert %{"id" => "raw_map"} = Enum.at(result, 2)
    end
  end
end
