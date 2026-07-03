# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionItemCreateParams do
  @moduledoc "Parameters for subscription item create."

  @typedoc """
  * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
  * `discounts` - The coupons to redeem into discounts for the subscription item.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_behavior` - Controls how Stripe handles payment when a subscription update requires payment and `collection_method=charge_automatically`. Possible values: `allow_incomplete`, `default_incomplete`, `error_if_incomplete`, `pending_if_incomplete`.
  * `plan` - The identifier of the plan to add to the subscription. Max length: 5000.
  * `price` - The ID of the price object. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline.
  * `proration_behavior` - Determines how to handle [prorations](https://docs.stripe.com/billing/subscriptions/prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. The default value is `create_prorations`. Possible values: `always_invoice`, `create_prorations`, `none`.
  * `proration_date` - If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply the same proration that was previewed with the [upcoming invoice](https://docs.stripe.com/api/invoices/create_preview) endpoint. Format: Unix timestamp.
  * `quantity` - The quantity you'd like to apply to the subscription item you're creating.
  * `subscription` - The identifier of the subscription to modify. Max length: 5000.
  * `tax_rates` - A list of [Tax Rate](https://docs.stripe.com/api/tax_rates) ids. These Tax Rates will override the [`default_tax_rates`](https://docs.stripe.com/api/subscriptions/create#create_subscription-default_tax_rates) on the Subscription. When updating, pass an empty string to remove previously-defined tax rates.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :billing_thresholds,
    :discounts,
    :expand,
    :metadata,
    :payment_behavior,
    :plan,
    :price,
    :price_data,
    :proration_behavior,
    :proration_date,
    :quantity,
    :subscription,
    :tax_rates
  ]
end
