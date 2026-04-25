# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Billing.MeterEventAdjustment do
  @moduledoc """
  Meter Event Adjustment
  """

  @typedoc """
  * `cancel` - Specifies which event to cancel.
  * `created` - The time the adjustment was created. Format: date-time.
  * `event_name` - The name of the meter event. Corresponds with the `event_name` field on a meter.
  * `id` - The unique id of this meter event adjustment.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.billing.meter_event_adjustment`.
  * `status` - Open Enum. The meter event adjustment’s status. Possible values: `complete`, `pending`.
  * `type` - Open Enum. Specifies whether to cancel a single event or a range of events for a time period. Time period cancellation is not supported yet. Possible values: `cancel`.
  """
  @type t :: %__MODULE__{
          cancel: cancel(),
          created: String.t(),
          event_name: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          status: String.t(),
          type: String.t()
        }

  defstruct [:cancel, :created, :event_name, :id, :livemode, :object, :status, :type]

  @object_name "v2.billing.meter_event_adjustment"
  def object_name, do: @object_name

  @typedoc """
  * `identifier` - Unique identifier for the event. You can only cancel events within 24 hours of Stripe receiving them.
  """
  @type cancel :: %{
          optional(:identifier) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "cancel" => %{
        fields: %{
          "identifier" => :scalar
        }
      }
    }
  end
end
