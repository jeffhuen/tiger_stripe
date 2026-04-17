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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.meter`.
  * `status` - The meter's status. Possible values: `active`, `inactive`.
  * `status_transitions` - Expandable.
  * `updated` - Time at which the object was last updated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `value_settings` - Expandable.
  """
  @type t :: %__MODULE__{
          created: integer(),
          customer_mapping: __MODULE__.CustomerMapping.t(),
          default_aggregation: __MODULE__.DefaultAggregation.t(),
          display_name: String.t(),
          event_name: String.t(),
          event_time_window: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          status: String.t(),
          status_transitions: __MODULE__.StatusTransitions.t(),
          updated: integer(),
          value_settings: __MODULE__.ValueSettings.t()
        }

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

  defmodule CustomerMapping do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `event_payload_key` - The key in the meter event payload to use for mapping the event to a customer. Max length: 5000.
    * `type` - The method for mapping a meter event to a customer. Possible values: `by_id`.
    """
    @type t :: %__MODULE__{
            event_payload_key: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [:event_payload_key, :type]
  end

  defmodule DefaultAggregation do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `formula` - Specifies how events are aggregated. Possible values: `count`, `last`, `sum`.
    """
    @type t :: %__MODULE__{
            formula: String.t() | nil
          }
    defstruct [:formula]
  end

  defmodule StatusTransitions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `deactivated_at` - The time the meter was deactivated, if any. Measured in seconds since Unix epoch. Format: Unix timestamp. Nullable.
    """
    @type t :: %__MODULE__{
            deactivated_at: integer() | nil
          }
    defstruct [:deactivated_at]
  end

  defmodule ValueSettings do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `event_payload_key` - The key in the meter event payload to use as the value for this meter. Max length: 5000.
    """
    @type t :: %__MODULE__{
            event_payload_key: String.t() | nil
          }
    defstruct [:event_payload_key]
  end

  def __inner_types__ do
    %{
      "customer_mapping" => __MODULE__.CustomerMapping,
      "default_aggregation" => __MODULE__.DefaultAggregation,
      "status_transitions" => __MODULE__.StatusTransitions,
      "value_settings" => __MODULE__.ValueSettings
    }
  end
end
