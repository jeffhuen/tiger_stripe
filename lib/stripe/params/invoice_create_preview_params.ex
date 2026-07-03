# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceCreatePreviewParams do
  @moduledoc "Parameters for invoice create preview."

  @typedoc """
  * `automatic_tax` - Settings for automatic tax lookup for this invoice preview.
  * `currency` - The currency to preview this invoice in. Defaults to that of `customer` if not specified. Format: ISO 4217 currency code.
  * `customer` - The identifier of the customer whose upcoming invoice you're retrieving. If `automatic_tax` is enabled then one of `customer`, `customer_details`, `subscription`, or `schedule` must be set. Max length: 5000.
  * `customer_account` - The identifier of the account representing the customer whose upcoming invoice you're retrieving. If `automatic_tax` is enabled then one of `customer`, `customer_account`, `customer_details`, `subscription`, or `schedule` must be set. Max length: 5000.
  * `customer_details` - Details about the customer you want to invoice or overrides for an existing customer. If `automatic_tax` is enabled then one of `customer`, `customer_details`, `subscription`, or `schedule` must be set.
  * `discounts` - The coupons to redeem into discounts for the invoice preview. If not specified, inherits the discount from the subscription or customer. This works for both coupons directly applied to an invoice and coupons applied to a subscription. Pass an empty string to avoid inheriting any discounts.
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice_items` - List of invoice items to add or update in the upcoming invoice preview (up to 250).
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
  * `on_behalf_of` - The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://docs.stripe.com/billing/invoices/connect) documentation for details.
  * `preview_mode` - Customizes the types of values to include when calculating the invoice. Defaults to `next` if unspecified. Possible values: `next`, `recurring`.
  * `schedule` - The identifier of the schedule whose upcoming invoice you'd like to retrieve. Cannot be used with subscription or subscription fields. Max length: 5000.
  * `schedule_details` - The schedule creation or modification params to apply as a preview. Cannot be used with `subscription` or `subscription_` prefixed fields.
  * `subscription` - The identifier of the subscription for which you'd like to retrieve the upcoming invoice. If not provided, but a `subscription_details.items` is provided, you will preview creating a subscription with those items. If neither `subscription` nor `subscription_details.items` is provided, you will retrieve the next upcoming invoice from among the customer's subscriptions. Max length: 5000.
  * `subscription_details` - The subscription creation or modification params to apply as a preview. Cannot be used with `schedule` or `schedule_details` fields.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :automatic_tax,
    :currency,
    :customer,
    :customer_account,
    :customer_details,
    :discounts,
    :expand,
    :invoice_items,
    :issuer,
    :on_behalf_of,
    :preview_mode,
    :schedule,
    :schedule_details,
    :subscription,
    :subscription_details
  ]
end
