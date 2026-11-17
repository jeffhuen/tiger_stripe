# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.InboundTransferCreateParams do
  @moduledoc "Parameters for inbound transfer create."

  @typedoc """
  * `amount` - The amount and currency to credit to the FinancialAccount.
  * `description` - An optional, freeform description field intended to store metadata.
  * `from` - The verified bank account credential to debit for this InboundTransfer.
  * `to` - The FinancialAccount and currency to credit with the transferred funds.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :description, :from, :to]
end
