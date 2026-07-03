# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceItemUpdateParams do
  @moduledoc "Parameters for invoice item update."

  @typedoc """
  * `amount` - The integer amount in cents (or local equivalent) of the charge to be applied to the upcoming invoice. If you want to apply a credit to the customer's account, pass a negative amount.
  * `description` - An arbitrary string which you can attach to the invoice item. The description is displayed in the invoice for easy tracking. Max length: 5000.
  * `discountable` - Controls whether discounts apply to this invoice item. Defaults to false for prorations or negative invoice items, and true for all other invoice items. Cannot be set to true for prorations.
  * `discounts` - The coupons, promotion codes & existing discounts which apply to the invoice item or invoice line item. Item discounts are applied before invoice discounts. Pass an empty string to remove previously-defined discounts.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `period` - The period associated with this invoice item. When set to different values, the period will be rendered on the invoice. If you have [Stripe Revenue Recognition](https://docs.stripe.com/revenue-recognition) enabled, the period will be used to recognize and defer revenue. See the [Revenue Recognition documentation](https://docs.stripe.com/revenue-recognition/methodology/subscriptions-and-invoicing) for details.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline.
  * `pricing` - The pricing information for the invoice item.
  * `quantity` - Non-negative integer. The quantity of units for the invoice item. Use `quantity_decimal` instead to provide decimal precision. This field will be deprecated in favor of `quantity_decimal` in a future version.
  * `quantity_decimal` - Non-negative decimal with at most 12 decimal places. The quantity of units for the line item. Format: decimal string.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID.
  * `tax_rates` - The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item. Pass an empty string to remove previously-defined tax rates.
  * `unit_amount_decimal` - The decimal unit amount in cents (or local equivalent) of the charge to be applied to the upcoming invoice. This `unit_amount_decimal` will be multiplied by the quantity to get the full amount. Passing in a negative `unit_amount_decimal` will reduce the `amount_due` on the invoice. Accepts at most 12 decimal places. Format: decimal string.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :description,
    :discountable,
    :discounts,
    :expand,
    :metadata,
    :period,
    :price_data,
    :pricing,
    :quantity,
    :quantity_decimal,
    :tax_behavior,
    :tax_code,
    :tax_rates,
    :unit_amount_decimal
  ]
end
