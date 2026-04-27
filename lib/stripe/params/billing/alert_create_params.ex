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
          usage_threshold: usage_threshold() | nil
        }

  defstruct [:alert_type, :expand, :title, :usage_threshold]

  @typedoc """
  * `filters` - The filters allows limiting the scope of this usage alert. You can only specify up to one filter at this time.
  * `gte` - Defines the threshold value that triggers the alert.
  * `meter` - The [Billing Meter](https://docs.stripe.com/api/billing/meter) ID whose usage is monitored. Max length: 5000.
  * `recurrence` - Defines how the alert will behave. Possible values: `one_time`.
  """
  @type usage_threshold :: %{
          optional(:filters) => [usage_threshold_filters()] | nil,
          optional(:gte) => integer() | nil,
          optional(:meter) => String.t() | nil,
          optional(:recurrence) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer` - Limit the scope to this usage alert only to this customer. Max length: 5000.
  * `type` - What type of filter is being applied to this usage alert. Possible values: `customer`.
  """
  @type usage_threshold_filters :: %{
          optional(:customer) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }
end
