# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.OutboundPaymentCreateParams do
  @moduledoc "Parameters for outbound payment create."

  @typedoc """
  * `amount` - The requested amount and currency for the OutboundPayment.
  * `description` - An arbitrary string attached to the OutboundPayment. Often useful for displaying to users.
  * `from` - From which FinancialAccount and BalanceType to pull funds from.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `recipient_notification` - Details about the notification settings for the OutboundPayment recipient.
  * `recipient_verification` - The ID of the RecipientVerification for this OutboundPayment. Required where recipient-name verification is mandated before creating an OutboundPayment.
  * `statement_descriptor` - The description that appears on the receiving end for an OutboundPayment (for example, on a bank statement). Must be between 3 and 22 characters long for most destinations (500 for FinancialAccount destinations), and not contain profanity.
  * `to` - To which payout method to send the OutboundPayment.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :description,
    :from,
    :metadata,
    :recipient_notification,
    :recipient_verification,
    :statement_descriptor,
    :to
  ]
end
