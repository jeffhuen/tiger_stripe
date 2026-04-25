# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Billing.MeterEventSession do
  @moduledoc """
  Meter Event Session
  """

  @typedoc """
  * `authentication_token` - The authentication token for this session. Use this token when calling the
  high-throughput meter event API.
  * `created` - The creation time of this session. Format: date-time.
  * `expires_at` - The time at which this session will expire. Format: date-time.
  * `id` - The unique id of this auth session.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.billing.meter_event_session`.
  """
  @type t :: %__MODULE__{
          authentication_token: String.t(),
          created: String.t(),
          expires_at: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:authentication_token, :created, :expires_at, :id, :livemode, :object]

  @object_name "v2.billing.meter_event_session"
  def object_name, do: @object_name
end
