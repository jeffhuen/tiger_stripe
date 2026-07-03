# File generated from our OpenAPI spec
defmodule Stripe.Resources.TransferredToBalance do
  @moduledoc """
  CustomerBalanceResourceCashBalanceTransactionResourceTransferredToBalance
  """

  @typedoc """
  * `balance_transaction` - The [Balance Transaction](https://docs.stripe.com/api/balance_transactions/object) that corresponds to funds transferred to your Stripe balance. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:balance_transaction]

  @object_name "customer_balance_resource_cash_balance_transaction_resource_transferred_to_balance"
  def object_name, do: @object_name

  def expandable_fields, do: ["balance_transaction"]
end
