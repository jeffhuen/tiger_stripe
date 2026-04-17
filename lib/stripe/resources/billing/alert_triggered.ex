# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.AlertTriggered do
  @moduledoc """
  ThresholdsResourceAlert
  """

  @typedoc """
  * `alert` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - ID of customer for which the alert triggered Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.alert_triggered`.
  * `value` - The value triggering the alert
  """
  @type t :: %__MODULE__{
          alert: Stripe.Resources.Billing.Alert.t(),
          created: integer(),
          customer: String.t(),
          livemode: boolean(),
          object: String.t(),
          value: integer()
        }

  defstruct [:alert, :created, :customer, :livemode, :object, :value]

  @object_name "billing.alert_triggered"
  def object_name, do: @object_name

  def expandable_fields, do: ["alert"]

  def __inner_types__ do
    %{
      "alert" => Stripe.Resources.Billing.Alert
    }
  end
end
