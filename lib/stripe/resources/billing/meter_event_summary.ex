# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.MeterEventSummary do
  @moduledoc """
  BillingMeterEventSummary

  A billing meter event summary represents an aggregated view of a customer's billing meter events within a specified timeframe. It indicates how much
  usage was accrued by a customer for that period.

  Note: Meters events are aggregated asynchronously so the meter event summaries provide an eventually consistent view of the reported usage.
  """

  @typedoc """
  * `aggregated_value` - Aggregated value of all the events within `start_time` (inclusive) and `end_time` (inclusive). The aggregation strategy is defined on meter via `default_aggregation`.
  * `end_time` - End timestamp for this event summary (exclusive). Must be aligned with minute boundaries. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `meter` - The meter associated with this event summary. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.meter_event_summary`.
  * `start_time` - Start timestamp for this event summary (inclusive). Must be aligned with minute boundaries. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{
          aggregated_value: float(),
          end_time: integer(),
          id: String.t(),
          livemode: boolean(),
          meter: String.t(),
          object: String.t(),
          start_time: integer()
        }

  defstruct [:aggregated_value, :end_time, :id, :livemode, :meter, :object, :start_time]

  @object_name "billing.meter_event_summary"
  def object_name, do: @object_name
end
