# File generated from our OpenAPI spec
defmodule Stripe.Params.QuoteCreateParams do
  @moduledoc "Parameters for quote create."

  @typedoc """
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. There cannot be any line items with recurring prices when using this field.
  * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. There must be at least 1 line item with a recurring price to use this field.
  * `automatic_tax` - Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
  * `collection_method` - Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or at invoice finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions and mark the subscription as `active`. Defaults to `charge_automatically`. Possible values: `charge_automatically`, `send_invoice`.
  * `customer` - The customer for which this quote belongs to. A customer is required before finalizing the quote. Once specified, it cannot be changed. Max length: 5000.
  * `customer_account` - The account for which this quote belongs to. A customer or account is required before finalizing the quote. Once specified, it cannot be changed. Max length: 5000.
  * `default_tax_rates` - The tax rates that will apply to any line item that does not have `tax_rates` set.
  * `description` - A description that will be displayed on the quote PDF. If no value is passed, the default description configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
  * `discounts` - The discounts applied to the quote.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - A future timestamp on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch. If no value is passed, the default expiration date configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used. Format: Unix timestamp.
  * `footer` - A footer that will be displayed on the quote PDF. If no value is passed, the default footer configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
  * `from_quote` - Clone an existing quote. The new quote will be created in `status=draft`. When using this parameter, you cannot specify any other parameters except for `expires_at`.
  * `header` - A header that will be displayed on the quote PDF. If no value is passed, the default header configured in your [quote template settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
  * `invoice_settings` - All invoices will be billed using the specified settings.
  * `line_items` - A list of line items the customer is being quoted for. Each line item includes information about the product, the quantity, and the resulting cost.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `on_behalf_of` - The account on behalf of which to charge.
  * `subscription_data` - When creating a subscription or subscription schedule, the specified configuration data will be used. There must be at least one line item with a recurring price for a subscription or subscription schedule to be created. A subscription schedule is created if `subscription_data[effective_date]` is present and in the future, otherwise a subscription is created.
  * `test_clock` - ID of the test clock to attach to the quote. Max length: 5000.
  * `transfer_data` - The data with which to automatically create a Transfer for each of the invoices.
  """
  @type t :: %__MODULE__{}

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
    :from_quote,
    :header,
    :invoice_settings,
    :line_items,
    :metadata,
    :on_behalf_of,
    :subscription_data,
    :test_clock,
    :transfer_data
  ]
end
