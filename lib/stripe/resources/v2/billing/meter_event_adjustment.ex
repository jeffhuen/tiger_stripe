# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Billing.MeterEventAdjustment do
  @moduledoc """
  Meter Event Adjustment

  A Meter Event Adjustment is used to cancel or modify previously recorded meter events. Meter Event Adjustments allow you to correct billing data by canceling individual events or event ranges, with tracking of adjustment status and creation time.
  """

  @typedoc """
  * `cancel` - Specifies which event to cancel.
  * `created` - The time the adjustment was created. Format: date-time.
  * `event_name` - The name of the meter event. Corresponds with the `event_name` field on a meter.
  * `id` - The unique ID of this meter event adjustment.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.billing.meter_event_adjustment`.
  * `status` - Open Enum. The meter event adjustment's status. Possible values: `complete`, `pending`.
  * `type` - Open Enum. Specifies the type of cancellation. Currently supports canceling a single event. Possible values: `cancel`.
  """
  @type t :: %__MODULE__{}

  defstruct [:cancel, :created, :event_name, :id, :livemode, :object, :status, :type]

  @object_name "v2.billing.meter_event_adjustment"
  def object_name, do: @object_name

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
