# File generated from our OpenAPI spec
defmodule Stripe.Resources.Discount do
  @moduledoc """
  Discount

  A discount represents the actual application of a [coupon](https://api.stripe.com#coupons) or [promotion code](https://api.stripe.com#promotion_codes).
  It contains information about when the discount began, when it will end, and what it is applied to.

  Related guide: [Applying discounts to subscriptions](https://docs.stripe.com/billing/subscriptions/discounts)
  """

  @typedoc """
  * `checkout_session` - The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode. Max length: 5000. Nullable.
  * `customer` - The ID of the customer associated with this discount. Nullable. Expandable.
  * `customer_account` - The ID of the account representing the customer associated with this discount. Max length: 5000. Nullable.
  * `end` - If the coupon has a duration of `repeating`, the date that this discount will end. If the coupon has a duration of `once` or `forever`, this attribute will be null. Format: Unix timestamp. Nullable.
  * `id` - The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array. Max length: 5000.
  * `invoice` - The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice. Max length: 5000. Nullable.
  * `invoice_item` - The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `discount`.
  * `promotion_code` - The promotion code applied to create this discount. Nullable. Expandable.
  * `source` - Expandable.
  * `start` - Date that the coupon was applied. Format: Unix timestamp.
  * `subscription` - The subscription that this coupon is applied to, if it is applied to a particular subscription. Max length: 5000. Nullable.
  * `subscription_item` - The subscription item that this coupon is applied to, if it is applied to a particular subscription item. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :checkout_session,
    :customer,
    :customer_account,
    :end,
    :id,
    :invoice,
    :invoice_item,
    :object,
    :promotion_code,
    :source,
    :start,
    :subscription,
    :subscription_item
  ]

  @object_name "discount"
  def object_name, do: @object_name

  def expandable_fields, do: ["customer", "promotion_code", "source"]

  def __nested_fields__ do
    %{
      "source" => %{
        fields: %{
          "coupon" => {:resource, Stripe.Resources.Coupon},
          "type" => :scalar
        }
      }
    }
  end
end
