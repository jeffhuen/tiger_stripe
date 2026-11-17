# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.TransactionUpdateParams do
  @moduledoc "Parameters for transaction update."

  @typedoc """
  * `description` - A description of the Transaction, up to 100 characters. Pass `null` to clear the description,
  or omit this parameter to leave it unchanged.
  * `metadata` - Set of key-value pairs that you can attach to the Transaction. Individual keys can be unset by posting
  null to them.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :metadata]
end
