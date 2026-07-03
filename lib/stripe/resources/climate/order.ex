# File generated from our OpenAPI spec
defmodule Stripe.Resources.Climate.Order do
  @moduledoc """
  ClimateRemovalsOrders

  Orders represent your intent to purchase a particular Climate product. When you create an order, the
  payment is deducted from your merchant balance.
  """

  @typedoc """
  * `amount_fees` - Total amount of [Frontier](https://frontierclimate.com/)'s service fees in the currency's smallest unit.
  * `amount_subtotal` - Total amount of the carbon removal in the currency's smallest unit.
  * `amount_total` - Total amount of the order including fees in the currency's smallest unit.
  * `beneficiary` - Expandable.
  * `canceled_at` - Time at which the order was canceled. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `cancellation_reason` - Reason for the cancellation of this order. Possible values: `expired`, `product_unavailable`, `requested`. Nullable.
  * `certificate` - For delivered orders, a URL to a delivery certificate for the order. Max length: 5000. Nullable.
  * `confirmed_at` - Time at which the order was confirmed. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase, representing the currency for this order. Max length: 5000.
  * `delayed_at` - Time at which the order's expected_delivery_year was delayed. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `delivered_at` - Time at which the order was delivered. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `delivery_details` - Details about the delivery of carbon removal for this order. Expandable.
  * `expected_delivery_year` - The year this order is expected to be delivered.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `metric_tons` - Quantity of carbon removal that is included in this order. Format: decimal string.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `climate.order`.
  * `product` - Unique ID for the Climate `Product` this order is purchasing. Expandable.
  * `product_substituted_at` - Time at which the order's product was substituted for a different product. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `status` - The current status of this order. Possible values: `awaiting_funds`, `canceled`, `confirmed`, `delivered`, `open`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount_fees,
    :amount_subtotal,
    :amount_total,
    :beneficiary,
    :canceled_at,
    :cancellation_reason,
    :certificate,
    :confirmed_at,
    :created,
    :currency,
    :delayed_at,
    :delivered_at,
    :delivery_details,
    :expected_delivery_year,
    :id,
    :livemode,
    :metadata,
    :metric_tons,
    :object,
    :product,
    :product_substituted_at,
    :status
  ]

  @object_name "climate.order"
  def object_name, do: @object_name

  def expandable_fields, do: ["beneficiary", "delivery_details", "product"]

  def __nested_fields__ do
    %{
      "beneficiary" => %{
        fields: %{
          "public_name" => :scalar
        }
      },
      "delivery_details" => %{
        fields: %{
          "delivered_at" => :scalar,
          "location" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "latitude" => :scalar,
              "longitude" => :scalar,
              "region" => :scalar
            }
          },
          "metric_tons" => :scalar,
          "registry_url" => :scalar,
          "supplier" => {:resource, Stripe.Resources.Climate.Supplier}
        }
      }
    }
  end
end
