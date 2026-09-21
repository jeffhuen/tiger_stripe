# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionScheduleCreateParams do
  @moduledoc "Parameters for subscription schedule create."

  @typedoc """
  * `billing_mode` - Controls how prorations and invoices for subscriptions are calculated and orchestrated.
  * `customer` - The identifier of the customer to create the subscription schedule for. Max length: 5000.
  * `customer_account` - The identifier of the account to create the subscription schedule for. Max length: 5000.
  * `default_settings` - Object representing the subscription schedule's default settings.
  * `end_behavior` - Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running. `cancel` will end the subscription schedule and cancel the underlying subscription. Possible values: `cancel`, `none`, `release`, `renew`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `from_subscription` - Migrate an existing subscription to be managed by a subscription schedule. If this parameter is set, a subscription schedule will be created using the subscription's item(s), set to auto-renew using the subscription's interval. When using this parameter, other parameters (such as phase values) cannot be set. To create a subscription schedule with other modifications, we recommend making two separate API calls. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `phases` - List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase.
  * `start_date` - When the subscription schedule starts. We recommend using `now` so that it starts the subscription immediately, and to avoid unexpected behavior due to request delays or clock skew resulting in a slightly backdated or postdated start. You can also use a Unix timestamp to backdate the subscription so that it starts on a past date, or set a future date for the subscription to start on.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :billing_mode,
    :customer,
    :customer_account,
    :default_settings,
    :end_behavior,
    :expand,
    :from_subscription,
    :metadata,
    :phases,
    :start_date
  ]
end
