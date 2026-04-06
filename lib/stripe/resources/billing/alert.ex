# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.Alert do
  @moduledoc """
  ThresholdsResourceAlert

  A billing alert is a resource that notifies you when a certain usage threshold on a meter is crossed. For example, you might create a billing alert to notify you when a certain user made 100 API requests.
  """

  @typedoc """
  * `alert_type` - Defines the type of the alert. Possible values: `usage_threshold`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.alert`.
  * `status` - Status of the alert. This can be active, inactive or archived. Possible values: `active`, `archived`, `inactive`. Nullable.
  * `title` - Title of the alert. Max length: 5000.
  * `usage_threshold` - Encapsulates configuration of the alert to monitor usage on a specific [Billing Meter](https://docs.stripe.com/api/billing/meter). Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          alert_type: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          status: String.t(),
          title: String.t(),
          usage_threshold: __MODULE__.UsageThreshold.t()
        }

  defstruct [:alert_type, :id, :livemode, :object, :status, :title, :usage_threshold]

  @object_name "billing.alert"
  def object_name, do: @object_name

  def expandable_fields, do: ["usage_threshold"]

  defmodule UsageThreshold do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `filters` - The filters allow limiting the scope of this usage alert. You can only specify up to one filter at this time. Nullable.
    * `gte` - The value at which this alert will trigger.
    * `meter` - The [Billing Meter](https://docs.stripe.com/api/billing/meter) ID whose usage is monitored.
    * `recurrence` - Defines how the alert will behave. Possible values: `one_time`.
    """
    @type t :: %__MODULE__{
            filters: [__MODULE__.Filters.t()] | nil,
            gte: integer() | nil,
            meter: String.t() | Stripe.Resources.Billing.Meter.t() | nil,
            recurrence: String.t() | nil
          }
    defstruct [:filters, :gte, :meter, :recurrence]

    defmodule Filters do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `customer` - Limit the scope of the alert to this customer ID Nullable.
      * `type` - Possible values: `customer`.
      """
      @type t :: %__MODULE__{
              customer: String.t() | Stripe.Resources.Customer.t() | nil,
              type: String.t() | nil
            }
      defstruct [:customer, :type]
    end

    def __inner_types__ do
      %{
        "filters" => __MODULE__.Filters
      }
    end
  end

  def __inner_types__ do
    %{
      "usage_threshold" => __MODULE__.UsageThreshold
    }
  end
end
