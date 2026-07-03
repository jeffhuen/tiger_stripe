# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Billing.MeterEventAdjustmentCreateParams do
  @moduledoc "Parameters for meter event adjustment create."

  @typedoc """
  * `cancel` - Specifies which event to cancel.
  * `event_name` - The name of the meter event. Corresponds with the `event_name` field on a meter.
  * `type` - Specifies whether to cancel a single event or a range of events for a time period. Time period cancellation is not supported yet. Possible values: `cancel`.
  """
  @type t :: %__MODULE__{}

  defstruct [:cancel, :event_name, :type]
end
