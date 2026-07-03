# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.Meter do
  @moduledoc """
  BillingMeter

  Meters specify how to aggregate meter events over a billing period. Meter events represent the actions that customers take in your system. Meters attach to prices and form the basis of the bill.

  Related guide: [Usage based billing](https://docs.stripe.com/billing/subscriptions/usage-based)
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer_mapping` - Expandable.
  * `default_aggregation` - Expandable.
  * `display_name` - The meter's name. Max length: 5000.
  * `event_name` - The name of the meter event to record usage for. Corresponds with the `event_name` field on meter events. Max length: 5000.
  * `event_time_window` - The time window which meter events have been pre-aggregated for, if any. Possible values: `day`, `hour`. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.meter`.
  * `status` - The meter's status. Possible values: `active`, `inactive`.
  * `status_transitions` - Expandable.
  * `updated` - Time at which the object was last updated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `value_settings` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :customer_mapping,
    :default_aggregation,
    :display_name,
    :event_name,
    :event_time_window,
    :id,
    :livemode,
    :object,
    :status,
    :status_transitions,
    :updated,
    :value_settings
  ]

  @object_name "billing.meter"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["customer_mapping", "default_aggregation", "status_transitions", "value_settings"]

  def __nested_fields__ do
    %{
      "customer_mapping" => %{
        fields: %{
          "event_payload_key" => :scalar,
          "type" => :scalar
        }
      },
      "default_aggregation" => %{
        fields: %{
          "formula" => :scalar
        }
      },
      "status_transitions" => %{
        fields: %{
          "deactivated_at" => :scalar
        }
      },
      "value_settings" => %{
        fields: %{
          "event_payload_key" => :scalar
        }
      }
    }
  end
end
