# File generated from our OpenAPI spec
defmodule Stripe.Resources.RefundedFromPayment do
  @moduledoc """
  CustomerBalanceResourceCashBalanceTransactionResourceRefundedFromPaymentTransaction
  """

  @typedoc """
  * `refund` - The [Refund](https://docs.stripe.com/api/refunds/object) that moved these funds into the customer's cash balance. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:refund]

  @object_name "customer_balance_resource_cash_balance_transaction_resource_refunded_from_payment_transaction"
  def object_name, do: @object_name

  def expandable_fields, do: ["refund"]
end
