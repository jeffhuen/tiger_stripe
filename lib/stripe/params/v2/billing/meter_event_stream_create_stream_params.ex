# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Billing.MeterEventStreamCreateStreamParams do
  @moduledoc "Parameters for meter event stream create stream."

  @typedoc """
  * `events` - List of meter events to include in the request. Supports up to 100 events per request.
  """
  @type t :: %__MODULE__{
          events: [events()]
        }

  defstruct [:events]

  @typedoc """
  * `event_name` - The name of the meter event. Corresponds with the `event_name` field on a meter.
  * `identifier` - A unique identifier for the event. If not provided, one will be generated.
  We recommend using a globally unique identifier for this. We’ll enforce
  uniqueness within a rolling 24 hour period.
  * `payload` - The payload of the event. This must contain the fields corresponding to a meter’s
  `customer_mapping.event_payload_key` (default is `stripe_customer_id`) and
  `value_settings.event_payload_key` (default is `value`). Read more about
  the
  [payload](https://docs.stripe.com/billing/subscriptions/usage-based/recording-usage#payload-key-overrides).
  * `timestamp` - The time of the event. Must be within the past 35 calendar days or up to
  5 minutes in the future. Defaults to current timestamp if not specified. Format: date-time.
  """
  @type events :: %{
          optional(:event_name) => String.t() | nil,
          optional(:identifier) => String.t() | nil,
          optional(:payload) => %{String.t() => String.t()} | nil,
          optional(:timestamp) => String.t() | nil,
          optional(String.t()) => term()
        }
end
