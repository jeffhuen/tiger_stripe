# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.MeterEventAdjustmentCreateParams do
  @moduledoc "Parameters for meter event adjustment create."

  @typedoc """
  * `cancel` - Specifies which event to cancel.
  * `event_name` - The name of the meter event. Corresponds with the `event_name` field on a meter. Max length: 100.
  * `expand` - Specifies which fields in the response should be expanded.
  * `type` - Specifies whether to cancel a single event or a range of events for a time period. Time period cancellation is not supported yet. Possible values: `cancel`.
  """
  @type t :: %__MODULE__{
          cancel: cancel() | nil,
          event_name: String.t(),
          expand: [String.t()] | nil,
          type: String.t()
        }

  defstruct [:cancel, :event_name, :expand, :type]

  @typedoc """
  * `identifier` - Unique identifier for the event. You can only cancel events within 24 hours of Stripe receiving them. Max length: 100.
  """
  @type cancel :: %{
          optional(:identifier) => String.t() | nil,
          optional(String.t()) => term()
        }
end
