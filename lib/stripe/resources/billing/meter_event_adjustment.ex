# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.MeterEventAdjustment do
  @moduledoc """
  BillingMeterEventAdjustment

  A billing meter event adjustment is a resource that allows you to cancel a meter event. For example, you might create a billing meter event adjustment to cancel a meter event that was created in error or attached to the wrong customer.
  """

  @typedoc """
  * `cancel` - Specifies which event to cancel. Nullable. Expandable.
  * `event_name` - The name of the meter event. Corresponds with the `event_name` field on a meter. Max length: 100.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.meter_event_adjustment`.
  * `status` - The meter event adjustment's status. Possible values: `complete`, `pending`.
  * `type` - Specifies whether to cancel a single event or a range of events for a time period. Time period cancellation is not supported yet. Possible values: `cancel`.
  """
  @type t :: %__MODULE__{}

  defstruct [:cancel, :event_name, :livemode, :object, :status, :type]

  @object_name "billing.meter_event_adjustment"
  def object_name, do: @object_name

  def expandable_fields, do: ["cancel"]

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
