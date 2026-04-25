# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.MeterEvent do
  @moduledoc """
  BillingMeterEvent

  Meter events represent actions that customers take in your system. You can use meter events to bill a customer based on their usage. Meter events are associated with billing meters, which define both the contents of the event’s payload and how to aggregate those events.
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `event_name` - The name of the meter event. Corresponds with the `event_name` field on a meter. Max length: 100.
  * `identifier` - A unique identifier for the event. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.meter_event`.
  * `payload` - The payload of the event. This contains the fields corresponding to a meter's `customer_mapping.event_payload_key` (default is `stripe_customer_id`) and `value_settings.event_payload_key` (default is `value`). Read more about the [payload](https://docs.stripe.com/billing/subscriptions/usage-based/meters/configure#meter-configuration-attributes).
  * `timestamp` - The timestamp passed in when creating the event. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{
          created: integer(),
          event_name: String.t(),
          identifier: String.t(),
          livemode: boolean(),
          object: String.t(),
          payload: %{String.t() => String.t()},
          timestamp: integer()
        }

  defstruct [:created, :event_name, :identifier, :livemode, :object, :payload, :timestamp]

  @object_name "billing.meter_event"
  def object_name, do: @object_name
end
