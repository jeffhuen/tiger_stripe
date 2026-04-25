# File generated from our OpenAPI spec
defmodule Stripe.Resources.DeletedDiscount do
  @moduledoc """
  DeletedDiscount
  """

  @typedoc """
  * `checkout_session` - The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode. Max length: 5000. Nullable.
  * `customer` - The ID of the customer associated with this discount. Nullable. Expandable.
  * `customer_account` - The ID of the account representing the customer associated with this discount. Max length: 5000. Nullable.
  * `deleted` - Always true for a deleted object Possible values: `true`.
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
  @type t :: %__MODULE__{
          checkout_session: String.t(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          deleted: boolean(),
          id: String.t(),
          invoice: String.t(),
          invoice_item: String.t(),
          object: String.t(),
          promotion_code: String.t() | Stripe.Resources.PromotionCode.t(),
          source: source(),
          start: integer(),
          subscription: String.t(),
          subscription_item: String.t()
        }

  defstruct [
    :checkout_session,
    :customer,
    :customer_account,
    :deleted,
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

  @object_name "deleted_discount"
  def object_name, do: @object_name

  def expandable_fields, do: ["customer", "promotion_code", "source"]

  @typedoc """
  * `coupon` - The coupon that was redeemed to create this discount. Nullable.
  * `type` - The source type of the discount. Possible values: `coupon`.
  """
  @type source :: %{
          optional(:coupon) => String.t() | Stripe.Resources.Coupon.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

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
