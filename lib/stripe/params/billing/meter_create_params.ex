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
  @type t :: %__MODULE__{
          customer_mapping: customer_mapping() | nil,
          default_aggregation: default_aggregation(),
          display_name: String.t(),
          event_name: String.t(),
          event_time_window: String.t() | nil,
          expand: [String.t()] | nil,
          value_settings: value_settings() | nil
        }

  defstruct [
    :customer_mapping,
    :default_aggregation,
    :display_name,
    :event_name,
    :event_time_window,
    :expand,
    :value_settings
  ]

  @typedoc """
  * `event_payload_key` - The key in the meter event payload to use for mapping the event to a customer. Max length: 100.
  * `type` - The method for mapping a meter event to a customer. Must be `by_id`. Possible values: `by_id`.
  """
  @type customer_mapping :: %{
          optional(:event_payload_key) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `formula` - Specifies how events are aggregated. Allowed values are `count` to count the number of events, `sum` to sum each event's value and `last` to take the last event's value in the window. Possible values: `count`, `last`, `sum`.
  """
  @type default_aggregation :: %{
          optional(:formula) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `event_payload_key` - The key in the usage event payload to use as the value for this meter. For example, if the event payload contains usage on a `bytes_used` field, then set the event_payload_key to "bytes_used". Max length: 100.
  """
  @type value_settings :: %{
          optional(:event_payload_key) => String.t() | nil,
          optional(String.t()) => term()
        }
end
