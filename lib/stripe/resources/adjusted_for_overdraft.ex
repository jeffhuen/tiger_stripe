# File generated from our OpenAPI spec
defmodule Stripe.Resources.AdjustedForOverdraft do
  @moduledoc """
  CustomerBalanceResourceCashBalanceTransactionResourceAdjustedForOverdraft
  """

  @typedoc """
  * `balance_transaction` - The [Balance Transaction](https://docs.stripe.com/api/balance_transactions/object) that corresponds to funds taken out of your Stripe balance. Expandable.
  * `linked_transaction` - The [Cash Balance Transaction](https://docs.stripe.com/api/cash_balance_transactions/object) that brought the customer balance negative, triggering the clawback of funds. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:balance_transaction, :linked_transaction]

  @object_name "customer_balance_resource_cash_balance_transaction_resource_adjusted_for_overdraft"
  def object_name, do: @object_name

  def expandable_fields, do: ["balance_transaction", "linked_transaction"]
end
