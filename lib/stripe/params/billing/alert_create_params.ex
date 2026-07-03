# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.AlertCreateParams do
  @moduledoc "Parameters for alert create."

  @typedoc """
  * `alert_type` - The type of alert to create. Possible values: `usage_threshold`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `title` - The title of the alert. Max length: 256.
  * `usage_threshold` - The configuration of the usage threshold.
  """
  @type t :: %__MODULE__{}

  defstruct [:alert_type, :expand, :title, :usage_threshold]
end
