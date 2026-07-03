# File generated from our OpenAPI spec
defmodule Stripe.Resources.LineItem do
  @moduledoc """
  LineItem

  A line item.
  """

  @typedoc """
  * `adjustable_quantity` - Nullable. Expandable.
  * `amount_discount` - Total discount amount applied. If no discounts were applied, defaults to 0.
  * `amount_subtotal` - Total before any discounts or taxes are applied.
  * `amount_tax` - Total tax amount applied. If no tax was applied, defaults to 0.
  * `amount_total` - Total after discounts and taxes.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Defaults to product name. Max length: 5000. Nullable.
  * `discounts` - The discounts applied to the line item. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `item`.
  * `price` - The price used to generate the line item. Nullable. Expandable.
  * `quantity` - The quantity of products being purchased. Nullable.
  * `taxes` - The taxes applied to the line item. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :adjustable_quantity,
    :amount_discount,
    :amount_subtotal,
    :amount_tax,
    :amount_total,
    :currency,
    :description,
    :discounts,
    :id,
    :metadata,
    :object,
    :price,
    :quantity,
    :taxes
  ]

  @object_name "item"
  def object_name, do: @object_name

  def expandable_fields, do: ["adjustable_quantity", "discounts", "price", "taxes"]

  def __nested_fields__ do
    %{
      "adjustable_quantity" => %{
        fields: %{
          "enabled" => :scalar,
          "maximum" => :scalar,
          "minimum" => :scalar
        }
      },
      "discounts" => %{
        fields: %{
          "amount" => :scalar,
          "discount" => {:resource, Stripe.Resources.Discount}
        }
      },
      "taxes" => %{
        fields: %{
          "amount" => :scalar,
          "rate" => {:resource, Stripe.Resources.TaxRate},
          "taxability_reason" => :scalar,
          "taxable_amount" => :scalar
        }
      },
      "price" => {:resource, Stripe.Resources.Price}
    }
  end
end
