# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.TransactionEntryListParams do
  @moduledoc "Parameters for transaction entry list."

  @typedoc """
  * `created` - Filter for TransactionEntries created within a specified time range.
  * `limit` - The page limit.
  * `transaction` - Filter for TransactionEntries belonging to a specific Transaction. This filter only supports
  filtering by a Transaction ID, which appears in each TransactionEntry's `transaction` field.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :limit, :transaction]
end
