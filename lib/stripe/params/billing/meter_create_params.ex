# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.MeterCreateParams do
  @moduledoc "Parameters for meter create."

  @typedoc """
  * `customer_mapping` - Fields that specify how to map a meter event to a customer.
  * `default_aggregation` - The default settings to aggregate a meter's events with.
  * `display_name` - The meter’s name. Not visible to the customer. Max length: 250.
  * `event_name` - The name of the meter event to record usage for. Corresponds with the `event_name` field on meter events. Max length: 100.
  * `event_time_window` - The time window which meter events have been pre-aggregated for, if any. Possible values: `day`, `hour`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `value_settings` - Fields that specify how to calculate a meter event's value.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :customer_mapping,
    :default_aggregation,
    :display_name,
    :event_name,
    :event_time_window,
    :expand,
    :value_settings
  ]
end
