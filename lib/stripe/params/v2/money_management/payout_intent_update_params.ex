# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.PayoutIntentUpdateParams do
  @moduledoc "Parameters for payout intent update."

  @typedoc """
  * `description` - An arbitrary string attached to the PayoutIntent. Often useful for displaying to users.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `recipient_notification` - Recipient notification settings for the PayoutIntent. Only applicable when the PayoutIntent creates an OutboundPayment.
  * `schedule_options` - Scheduling options for the payout. If omitted, the payout is scheduled for immediate execution.
  * `statement_descriptor` - The description that appears on the receiving end for the payout (for example, on a bank statement).
  * `to` - To which payout method the payout is sent.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :description,
    :metadata,
    :recipient_notification,
    :schedule_options,
    :statement_descriptor,
    :to
  ]
end
