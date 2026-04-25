# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Billing.MeterEvent do
  @moduledoc """
  Meter Event

  Fix me empty_doc_string.
  """

  @typedoc """
  * `created` - The creation time of this meter event. Format: date-time.
  * `event_name` - The name of the meter event. Corresponds with the `event_name` field on a meter.
  * `identifier` - A unique identifier for the event. If not provided, one will be generated. We recommend using a globally unique identifier for this. We’ll enforce uniqueness within a rolling 24 hour period.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.billing.meter_event`.
  * `payload` - The payload of the event. This must contain the fields corresponding to a meter’s
  `customer_mapping.event_payload_key` (default is `stripe_customer_id`) and
  `value_settings.event_payload_key` (default is `value`). Read more about
  the [payload](https://docs.stripe.com/billing/subscriptions/usage-based/recording-usage#payload-key-overrides)..
  * `timestamp` - The time of the event. Must be within the past 35 calendar days or up to
  5 minutes in the future. Defaults to current timestamp if not specified. Format: date-time.
  """
  @type t :: %__MODULE__{
          created: String.t(),
          event_name: String.t(),
          identifier: String.t(),
          livemode: boolean(),
          object: String.t(),
          payload: %{String.t() => String.t()},
          timestamp: String.t()
        }

  defstruct [:created, :event_name, :identifier, :livemode, :object, :payload, :timestamp]

  @object_name "v2.billing.meter_event"
  def object_name, do: @object_name
end
