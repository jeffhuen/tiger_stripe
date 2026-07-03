# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceLineItemUpdateParams do
  @moduledoc "Parameters for invoice line item update."

  @typedoc """
  * `amount` - The integer amount in cents (or local equivalent) of the charge to be applied to the upcoming invoice. If you want to apply a credit to the customer's account, pass a negative amount.
  * `description` - An arbitrary string which you can attach to the invoice item. The description is displayed in the invoice for easy tracking. Max length: 5000.
  * `discountable` - Controls whether discounts apply to this line item. Defaults to false for prorations or negative line items, and true for all other line items. Cannot be set to true for prorations.
  * `discounts` - The coupons, promotion codes & existing discounts which apply to the line item. Item discounts are applied before invoice discounts. Pass an empty string to remove previously-defined discounts.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`. For [type=subscription](https://docs.stripe.com/api/invoices/line_item) line items, the incoming metadata specified on the request is directly used to set this value, in contrast to [type=invoiceitem](https://docs.stripe.com/api/invoices/line_item) line items, where any existing metadata on the invoice line is merged with the incoming data.
  * `period` - The period associated with this invoice item. When set to different values, the period will be rendered on the invoice. If you have [Stripe Revenue Recognition](https://docs.stripe.com/revenue-recognition) enabled, the period will be used to recognize and defer revenue. See the [Revenue Recognition documentation](https://docs.stripe.com/revenue-recognition/methodology/subscriptions-and-invoicing) for details.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline.
  * `pricing` - The pricing information for the invoice item.
  * `quantity` - Non-negative integer. The quantity of units for the line item. Use `quantity_decimal` instead to provide decimal precision. This field will be deprecated in favor of `quantity_decimal` in a future version.
  * `quantity_decimal` - Non-negative decimal with at most 12 decimal places. The quantity of units for the line item. Format: decimal string.
  * `tax_amounts` - A list of up to 20 tax amounts for this line item. This can be useful if you calculate taxes on your own or use a third-party to calculate them. You cannot set tax amounts if any line item has [tax_rates](https://docs.stripe.com/api/invoices/line_item#invoice_line_item_object-tax_rates) or if the invoice has [default_tax_rates](https://docs.stripe.com/api/invoices/object#invoice_object-default_tax_rates) or uses [automatic tax](https://docs.stripe.com/tax/invoicing). Pass an empty string to remove previously defined tax amounts.
  * `tax_rates` - The tax rates which apply to the line item. When set, the `default_tax_rates` on the invoice do not apply to this line item. Pass an empty string to remove previously-defined tax rates.
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
    :tax_amounts,
    :tax_rates
  ]
end
