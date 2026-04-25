defmodule Stripe.ResourceShapeTest do
  @moduledoc """
  Spot-check tests that verify key generated resource modules have the
  expected fields and nested-shape metadata.

  These catch regressions in the generator's type resolution logic —
  e.g. non-resource $ref schemas being flattened to map() instead of
  creating typed atom-key maps.
  """
  use ExUnit.Case, async: true

  alias Stripe.Resources.Charge
  alias Stripe.Resources.Event
  alias Stripe.Resources.InvoiceLineItem
  alias Stripe.Resources.Price

  # -- Charge -----------------------------------------------------------------

  describe "Charge" do
    test "has :invoice field (field override)" do
      assert Map.has_key?(%Charge{}, :invoice)
    end

    test "does not compile child modules for non-resource nested properties" do
      for mod <- [
            nested_module(Charge, "BillingDetails"),
            nested_module(Charge, "FraudDetails"),
            nested_module(Charge, "Outcome"),
            nested_module(Charge, "PaymentMethodDetails"),
            nested_module(Charge, "Refunds"),
            nested_module(Charge, "TransferData")
          ] do
        refute Code.ensure_loaded?(mod), "Expected #{inspect(mod)} to remain a local type"
      end
    end

    test "BillingDetails has expected nested metadata" do
      assert %{"billing_details" => %{fields: fields}} = Charge.__nested_fields__()

      for field <- [:address, :email, :name, :phone] do
        assert Map.has_key?(fields, Atom.to_string(field)), "BillingDetails missing :#{field}"
      end
    end

    test "Outcome has expected nested metadata" do
      assert %{"outcome" => %{fields: fields}} = Charge.__nested_fields__()

      for field <- [:network_status, :risk_level, :risk_score, :seller_message, :type] do
        assert Map.has_key?(fields, Atom.to_string(field)), "Outcome missing :#{field}"
      end
    end

    test "PaymentMethodDetails has deeply nested metadata" do
      refute Code.ensure_loaded?(nested_module(Charge, ["PaymentMethodDetails", "Card"]))

      refute Code.ensure_loaded?(
               nested_module(Charge, ["PaymentMethodDetails", "Card", "Checks"])
             )

      assert %{
               "payment_method_details" => %{
                 fields: %{
                   "card" => %{
                     fields: %{
                       "checks" => %{fields: checks}
                     }
                   }
                 }
               }
             } = Charge.__nested_fields__()

      assert Map.has_key?(checks, "address_line1_check")
      assert Map.has_key?(checks, "cvc_check")
    end

    test "__nested_fields__ includes local shapes and resource refs" do
      nested = Charge.__nested_fields__()

      # Local typed maps
      assert match?(%{fields: _}, nested["billing_details"])
      assert match?(%{fields: _}, nested["fraud_details"])
      assert match?(%{fields: _}, nested["outcome"])
      assert match?(%{fields: _}, nested["payment_method_details"])
      assert match?(%{fields: _}, nested["refunds"])
      assert match?(%{fields: _}, nested["transfer_data"])

      # Resource refs still deserialize to top-level structs.
      assert nested["shipping"] == {:resource, Stripe.Resources.ShippingDetails}
      assert nested["source"] == {:resource, Stripe.Resources.PaymentSource}
    end
  end

  # -- Price ------------------------------------------------------------------

  describe "Price" do
    test "has Recurring metadata with expected fields" do
      refute Code.ensure_loaded?(nested_module(Price, "Recurring"))
      assert %{"recurring" => %{fields: recurring}} = Price.__nested_fields__()

      for field <- [:interval, :interval_count, :meter, :trial_period_days, :usage_type] do
        assert Map.has_key?(recurring, Atom.to_string(field)), "Recurring missing :#{field}"
      end
    end

    test "has CustomUnitAmount metadata" do
      refute Code.ensure_loaded?(nested_module(Price, "CustomUnitAmount"))
      assert %{"custom_unit_amount" => %{fields: cua}} = Price.__nested_fields__()

      for field <- [:maximum, :minimum, :preset] do
        assert Map.has_key?(cua, Atom.to_string(field)), "CustomUnitAmount missing :#{field}"
      end
    end

    test "has TransformQuantity metadata" do
      refute Code.ensure_loaded?(nested_module(Price, "TransformQuantity"))
      assert %{"transform_quantity" => %{fields: tq}} = Price.__nested_fields__()
      assert Map.has_key?(tq, "divide_by")
      assert Map.has_key?(tq, "round")
    end

    test "__nested_fields__ maps to local shapes" do
      nested = Price.__nested_fields__()
      assert match?(%{fields: _}, nested["recurring"])
      assert match?(%{fields: _}, nested["custom_unit_amount"])
      assert match?(%{fields: _}, nested["tiers"])
      assert match?(%{fields: _}, nested["transform_quantity"])
    end
  end

  # -- InvoiceLineItem --------------------------------------------------------

  describe "InvoiceLineItem" do
    test "has Period metadata with start/end" do
      refute Code.ensure_loaded?(nested_module(InvoiceLineItem, "Period"))

      assert %{"period" => %{fields: period}} = InvoiceLineItem.__nested_fields__()
      assert Map.has_key?(period, "start")
      assert Map.has_key?(period, "end")
    end

    test "has Parent metadata with nested children" do
      refute Code.ensure_loaded?(nested_module(InvoiceLineItem, "Parent"))

      assert %{"parent" => %{fields: parent}} = InvoiceLineItem.__nested_fields__()
      assert Map.has_key?(parent, "type")
      assert Map.has_key?(parent, "invoice_item_details")
      assert Map.has_key?(parent, "subscription_item_details")

      refute Code.ensure_loaded?(nested_module(InvoiceLineItem, ["Parent", "InvoiceItemDetails"]))
      assert %{fields: iid} = parent["invoice_item_details"]

      assert Map.has_key?(iid, "invoice_item")
      assert Map.has_key?(iid, "proration")
    end

    test "__nested_fields__ includes period and parent" do
      nested = InvoiceLineItem.__nested_fields__()
      assert match?(%{fields: _}, nested["period"])
      assert match?(%{fields: _}, nested["parent"])
    end
  end

  # -- Event ------------------------------------------------------------------

  describe "Event" do
    test "has Request metadata with id and idempotency_key" do
      refute Code.ensure_loaded?(nested_module(Event, "Request"))

      assert %{"request" => %{fields: request}} = Event.__nested_fields__()
      assert Map.has_key?(request, "id")
      assert Map.has_key?(request, "idempotency_key")
    end

    test "__nested_fields__ includes resource ref for data and local shape for request" do
      nested = Event.__nested_fields__()
      assert nested["data"] == {:resource, Stripe.Resources.EventData}
      assert match?(%{fields: _}, nested["request"])
    end
  end

  defp nested_module(parent, child) when is_binary(child), do: Module.concat(parent, child)

  defp nested_module(parent, children), do: Module.concat([parent | children])
end
