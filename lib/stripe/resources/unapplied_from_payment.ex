# File generated from our OpenAPI spec
defmodule Stripe.Resources.UnappliedFromPayment do
  @moduledoc """
  CustomerBalanceResourceCashBalanceTransactionResourceUnappliedFromPaymentTransaction
  """

  @typedoc """
  * `payment_intent` - The [Payment Intent](https://docs.stripe.com/api/payment_intents/object) that funds were unapplied from. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:payment_intent]

  @object_name "customer_balance_resource_cash_balance_transaction_resource_unapplied_from_payment_transaction"
  def object_name, do: @object_name

  def expandable_fields, do: ["payment_intent"]
end
