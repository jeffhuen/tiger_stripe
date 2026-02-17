# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.AlertCreateParams do
  @moduledoc "Parameters for alert create."

  @typedoc """
  * `alert_type` - The type of alert to create. Possible values: `usage_threshold`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `title` - The title of the alert. Max length: 256.
  * `usage_threshold` - The configuration of the usage threshold.
  """
  @type t :: %__MODULE__{
          alert_type: String.t(),
          expand: [String.t()] | nil,
          title: String.t(),
          usage_threshold: __MODULE__.UsageThreshold.t() | nil
        }

  defstruct [:alert_type, :expand, :title, :usage_threshold]

  defmodule UsageThreshold do
    @moduledoc "Nested parameters."

    @typedoc """
    * `filters` - The filters allows limiting the scope of this usage alert. You can only specify up to one filter at this time.
    * `gte` - Defines at which value the alert will fire.
    * `meter` - The [Billing Meter](https://docs.stripe.com/api/billing/meter) ID whose usage is monitored. Max length: 5000.
    * `recurrence` - Defines how the alert will behave. Possible values: `one_time`.
    """
    @type t :: %__MODULE__{
            filters: [__MODULE__.Filters.t()] | nil,
            gte: integer() | nil,
            meter: String.t() | nil,
            recurrence: String.t() | nil
          }
    defstruct [:filters, :gte, :meter, :recurrence]

    defmodule Filters do
      @moduledoc "Nested parameters."

      @typedoc """
      * `customer` - Limit the scope to this usage alert only to this customer. Max length: 5000.
      * `type` - What type of filter is being applied to this usage alert. Possible values: `customer`.
      """
      @type t :: %__MODULE__{
              customer: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:customer, :type]
    end
  end
end
