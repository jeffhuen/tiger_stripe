# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceItemCreateParams do
  @moduledoc "Parameters for invoice item create."

  @typedoc """
  * `amount` - The integer amount in cents (or local equivalent) of the charge to be applied to the upcoming invoice. Passing in a negative `amount` will reduce the `amount_due` on the invoice.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - The ID of the customer to bill for this invoice item. Max length: 5000.
  * `customer_account` - The ID of the account representing the customer to bill for this invoice item. Max length: 5000.
  * `description` - An arbitrary string which you can attach to the invoice item. The description is displayed in the invoice for easy tracking. Max length: 5000.
  * `discountable` - Controls whether discounts apply to this invoice item. Defaults to false for prorations or negative invoice items, and true for all other invoice items.
  * `discounts` - The coupons and promotion codes to redeem into discounts for the invoice item or invoice line item.
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice` - The ID of an existing invoice to add this invoice item to. For subscription invoices, when left blank, the invoice item will be added to the next upcoming scheduled invoice. For standalone invoices, the invoice item won't be automatically added unless you pass `pending_invoice_item_behavior: 'include'` when creating the invoice. This is useful when adding invoice items in response to an invoice.created webhook. You can only add invoice items to draft invoices and there is a maximum of 250 items per invoice. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `period` - The period associated with this invoice item. When set to different values, the period will be rendered on the invoice. If you have [Stripe Revenue Recognition](https://docs.stripe.com/revenue-recognition) enabled, the period will be used to recognize and defer revenue. See the [Revenue Recognition documentation](https://docs.stripe.com/revenue-recognition/methodology/subscriptions-and-invoicing) for details.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline.
  * `pricing` - The pricing information for the invoice item.
  * `quantity` - Non-negative integer. The quantity of units for the invoice item.
  * `subscription` - The ID of a subscription to add this invoice item to. When left blank, the invoice item is added to the next upcoming scheduled invoice. When set, scheduled invoices for subscriptions other than the specified subscription will ignore the invoice item. Use this when you want to express that an invoice item has been accrued within the context of a particular subscription. Max length: 5000.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID.
  * `tax_rates` - The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item.
  * `unit_amount_decimal` - The decimal unit amount in cents (or local equivalent) of the charge to be applied to the upcoming invoice. This `unit_amount_decimal` will be multiplied by the quantity to get the full amount. Passing in a negative `unit_amount_decimal` will reduce the `amount_due` on the invoice. Accepts at most 12 decimal places. Format: decimal string.
  """
  @type t :: %__MODULE__{
          amount: integer() | nil,
          currency: String.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          description: String.t() | nil,
          discountable: boolean() | nil,
          discounts: map() | nil,
          expand: [String.t()] | nil,
          invoice: String.t() | nil,
          metadata: map() | nil,
          period: period() | nil,
          price_data: price_data() | nil,
          pricing: pricing() | nil,
          quantity: integer() | nil,
          subscription: String.t() | nil,
          tax_behavior: String.t() | nil,
          tax_code: map() | nil,
          tax_rates: [String.t()] | nil,
          unit_amount_decimal: String.t() | nil
        }

  defstruct [
    :amount,
    :currency,
    :customer,
    :customer_account,
    :description,
    :discountable,
    :discounts,
    :expand,
    :invoice,
    :metadata,
    :period,
    :price_data,
    :pricing,
    :quantity,
    :subscription,
    :tax_behavior,
    :tax_code,
    :tax_rates,
    :unit_amount_decimal
  ]

  @typedoc """
  * `end` - The end of the period, which must be greater than or equal to the start. This value is inclusive. Format: Unix timestamp.
  * `start` - The start of the period. This value is inclusive. Format: Unix timestamp.
  """
  @type period :: %{
          optional(:end) => integer() | nil,
          optional(:start) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. Max length: 5000.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `price` - The ID of the price object. Max length: 5000.
  """
  @type pricing :: %{
          optional(:price) => String.t() | nil,
          optional(String.t()) => term()
        }
end
