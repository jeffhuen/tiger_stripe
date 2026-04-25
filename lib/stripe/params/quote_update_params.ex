# File generated from our OpenAPI spec
defmodule Stripe.Params.QuoteUpdateParams do
  @moduledoc "Parameters for quote update."

  @typedoc """
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. There cannot be any line items with recurring prices when using this field.
  * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. There must be at least 1 line item with a recurring price to use this field.
  * `automatic_tax` - Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or at invoice finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions and mark the subscription as `active`. Defaults to `charge_automatically`. Possible values: `charge_automatically`, `send_invoice`.
  * `customer` - The customer for which this quote belongs to. A customer is required before finalizing the quote. Once specified, it cannot be changed. Max length: 5000.
  * `customer_account` - The account for which this quote belongs to. A customer or account is required before finalizing the quote. Once specified, it cannot be changed. Max length: 5000.
  * `default_tax_rates` - The tax rates that will apply to any line item that does not have `tax_rates` set.
  * `description` - A description that will be displayed on the quote PDF.
  * `discounts` - The discounts applied to the quote.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - A future timestamp on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `footer` - A footer that will be displayed on the quote PDF.
  * `header` - A header that will be displayed on the quote PDF.
  * `invoice_settings` - All invoices will be billed using the specified settings.
  * `line_items` - A list of line items the customer is being quoted for. Each line item includes information about the product, the quantity, and the resulting cost.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `on_behalf_of` - The account on behalf of which to charge.
  * `subscription_data` - When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
  * `transfer_data` - The data with which to automatically create a Transfer for each of the invoices.
  """
  @type t :: %__MODULE__{
          application_fee_amount: map() | nil,
          application_fee_percent: map() | nil,
          automatic_tax: automatic_tax() | nil,
          collection_method: String.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          default_tax_rates: map() | nil,
          description: map() | nil,
          discounts: map() | nil,
          expand: [String.t()] | nil,
          expires_at: integer() | nil,
          footer: map() | nil,
          header: map() | nil,
          invoice_settings: invoice_settings() | nil,
          line_items: [line_items()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          on_behalf_of: map() | nil,
          subscription_data: subscription_data() | nil,
          transfer_data: map() | nil
        }

  defstruct [
    :application_fee_amount,
    :application_fee_percent,
    :automatic_tax,
    :collection_method,
    :customer,
    :customer_account,
    :default_tax_rates,
    :description,
    :discounts,
    :expand,
    :expires_at,
    :footer,
    :header,
    :invoice_settings,
    :line_items,
    :metadata,
    :on_behalf_of,
    :subscription_data,
    :transfer_data
  ]

  @typedoc """
  * `enabled` - Controls whether Stripe will automatically compute tax on the resulting invoices or subscriptions as well as the quote itself.
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
  """
  @type automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => automatic_tax_liability() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type automatic_tax_liability :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `days_until_due` - Number of days within which a customer must pay the invoice generated by this quote. This value will be `null` for quotes where `collection_method=charge_automatically`.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  """
  @type invoice_settings :: %{
          optional(:days_until_due) => integer() | nil,
          optional(:issuer) => invoice_settings_issuer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
  """
  @type invoice_settings_issuer :: %{
          optional(:account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The discounts applied to this line item.
  * `id` - The ID of an existing line item on the quote. Max length: 5000.
  * `price` - The ID of the price object. One of `price` or `price_data` is required. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required.
  * `quantity` - The quantity of the line item.
  * `tax_rates` - The tax rates which apply to the line item. When set, the `default_tax_rates` on the quote do not apply to this line item.
  """
  @type line_items :: %{
          optional(:discounts) => map() | nil,
          optional(:id) => String.t() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => line_items_price_data() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_rates) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. Max length: 5000.
  * `recurring` - The recurring components of a price such as `interval` and `interval_count`.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type line_items_price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:recurring) => line_items_price_data_recurring() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
  """
  @type line_items_price_data_recurring :: %{
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - The subscription's description, meant to be displayable to the customer. Use this field to optionally store an explanation of the subscription for rendering in Stripe surfaces and certain local payment methods UIs.
  * `effective_date` - When creating a new subscription, the date of which the subscription schedule will start after the quote is accepted. The `effective_date` is ignored if it is in the past when the quote is accepted.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that will set metadata on the subscription or subscription schedule when the quote is accepted. If a recurring price is included in `line_items`, this field will be passed to the resulting subscription's `metadata` field. If `subscription_data.effective_date` is used, this field will be passed to the resulting subscription schedule's `phases.metadata` field. Unlike object-level metadata, this field is declarative. Updates will clear prior values.
  * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time.
  """
  @type subscription_data :: %{
          optional(:description) => map() | nil,
          optional(:effective_date) => map() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:trial_period_days) => map() | nil,
          optional(String.t()) => term()
        }
end
