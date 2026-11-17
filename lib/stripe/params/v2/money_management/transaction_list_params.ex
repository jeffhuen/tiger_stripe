# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.TransactionListParams do
  @moduledoc "Parameters for transaction list."

  @typedoc """
  * `created` - Filter for Transactions created within a specified time range.
  * `financial_account` - Filter for Transactions belonging to a specific FinancialAccount. This filter only supports filtering by the FinancialAccount's ID.
  * `flow` - Filter for Transactions created by a specific flow object. This filter only supports filtering by
  the flow object's ID, such as `ibt_123` for an InboundTransfer. A value that doesn't match a flow ID
  returns an empty list.
  * `limit` - The page limit.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :financial_account, :flow, :limit]
end
