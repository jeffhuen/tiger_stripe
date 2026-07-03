# File generated from our OpenAPI spec
defmodule Stripe.Resources.CashBalance do
  @moduledoc """
  cash_balance

  A customer's `Cash balance` represents real funds. Customers can add funds to their cash balance by sending a bank transfer. These funds can be used for payment and can eventually be paid out to your bank account.
  """

  @typedoc """
  * `available` - A hash of all cash balances available to this customer. You cannot delete a customer with any cash balances, even if the balance is 0. Amounts are represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable.
  * `customer` - The ID of the customer whose cash balance this object represents. Max length: 5000.
  * `customer_account` - The ID of an Account representing a customer whose cash balance this object represents. Max length: 5000. Nullable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `cash_balance`.
  * `settings` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:available, :customer, :customer_account, :livemode, :object, :settings]

  @object_name "cash_balance"
  def object_name, do: @object_name

  def expandable_fields, do: ["settings"]

  def __nested_fields__ do
    %{
      "settings" => %{
        fields: %{
          "reconciliation_mode" => :scalar,
          "using_merchant_default" => :scalar
        }
      }
    }
  end
end
