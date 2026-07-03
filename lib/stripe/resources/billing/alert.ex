# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.Alert do
  @moduledoc """
  ThresholdsResourceAlert

  A billing alert is a resource that notifies you when a certain usage threshold on a meter is crossed. For example, you might create a billing alert to notify you when a certain user made 100 API requests.
  """

  @typedoc """
  * `alert_type` - Defines the type of the alert. Possible values: `usage_threshold`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.alert`.
  * `status` - Status of the alert. This can be active, inactive or archived. Possible values: `active`, `archived`, `inactive`. Nullable.
  * `title` - Title of the alert. Max length: 5000.
  * `usage_threshold` - Encapsulates configuration of the alert to monitor usage on a specific [Billing Meter](https://docs.stripe.com/api/billing/meter). Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:alert_type, :id, :livemode, :object, :status, :title, :usage_threshold]

  @object_name "billing.alert"
  def object_name, do: @object_name

  def expandable_fields, do: ["usage_threshold"]

  def __nested_fields__ do
    %{
      "usage_threshold" => %{
        fields: %{
          "filters" =>
            {:list,
             %{
               fields: %{
                 "customer" => {:resource, Stripe.Resources.Customer},
                 "type" => :scalar
               }
             }},
          "gte" => :scalar,
          "meter" => {:resource, Stripe.Resources.Billing.Meter},
          "recurrence" => :scalar
        }
      }
    }
  end
end
