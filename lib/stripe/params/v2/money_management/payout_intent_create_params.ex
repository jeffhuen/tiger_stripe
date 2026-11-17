# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.PayoutIntentCreateParams do
  @moduledoc "Parameters for payout intent create."

  @typedoc """
  * `amount` - The monetary amount to be sent.
  * `confirmation_method` - Controls whether the PayoutIntent requires explicit confirmation before transitioning to `pending`. Defaults to `automatic`, but regulatory requirements may still require confirmation. See [Send money with Global Payouts](https://docs.stripe.com/global-payouts/send-money) for details. Possible values: `automatic`, `manual`.
  * `description` - An arbitrary string attached to the PayoutIntent. Often useful for displaying to users.
  * `from` - The FinancialAccount that funds are pulled from.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `recipient_notification` - Recipient notification settings for the PayoutIntent. Only applicable when the PayoutIntent creates an OutboundPayment.
  * `schedule_options` - Scheduling options for the payout. If omitted, the payout is scheduled for immediate execution.
  * `statement_descriptor` - The description that appears on the receiving end for the payout (for example, on a bank statement).
  * `to` - To which payout method the payout is sent.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :confirmation_method,
    :description,
    :from,
    :metadata,
    :recipient_notification,
    :schedule_options,
    :statement_descriptor,
    :to
  ]
end
