# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionScheduleUpdateParams do
  @moduledoc "Parameters for subscription schedule update."

  @typedoc """
  * `default_settings` - Object representing the subscription schedule's default settings.
  * `end_behavior` - Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running. `cancel` will end the subscription schedule and cancel the underlying subscription. Possible values: `cancel`, `none`, `release`, `renew`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `phases` - List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase. Note that past phases can be omitted.
  * `proration_behavior` - If the update changes the billing configuration (item price, quantity, etc.) of the current phase, indicates how prorations from this change should be handled. The default value is `create_prorations`. Possible values: `always_invoice`, `create_prorations`, `none`.
  """
  @type t :: %__MODULE__{}

  defstruct [:default_settings, :end_behavior, :expand, :metadata, :phases, :proration_behavior]
end
