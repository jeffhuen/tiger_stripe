# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.CreditBalanceSummary do
  @moduledoc """
  CreditBalanceSummary

  Indicates the billing credit balance for billing credits granted to a customer.
  """

  @typedoc """
  * `balances` - The billing credit balances. One entry per credit grant currency. If a customer only has credit grants in a single currency, then this will have a single balance entry. Expandable.
  * `customer` - The customer the balance is for. Expandable.
  * `customer_account` - The account the balance is for. Max length: 5000. Nullable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.credit_balance_summary`.
  """
  @type t :: %__MODULE__{
          balances: [Stripe.Resources.Billing.CreditBalance.t()],
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:balances, :customer, :customer_account, :livemode, :object]

  @object_name "billing.credit_balance_summary"
  def object_name, do: @object_name

  def expandable_fields, do: ["balances", "customer"]
end
