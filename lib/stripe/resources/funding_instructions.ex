# File generated from our OpenAPI spec
defmodule Stripe.Resources.FundingInstructions do
  @moduledoc """
  CustomerBalanceFundingInstructionsCustomerBalanceFundingInstructions

  Each customer has a [`balance`](https://docs.stripe.com/api/customers/object#customer_object-balance) that is
  automatically applied to future invoices and payments using the `customer_balance` payment method.
  Customers can fund this balance by initiating a bank transfer to any account in the
  `financial_addresses` field.
  Related guide: [Customer balance funding instructions](https://docs.stripe.com/payments/customer-balance/funding-instructions)
  """

  @typedoc """
  * `bank_transfer` - Expandable.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `funding_type` - The `funding_type` of the returned instructions Possible values: `bank_transfer`.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `funding_instructions`.
  """
  @type t :: %__MODULE__{
          bank_transfer: Stripe.Resources.BankTransfer.t(),
          currency: String.t(),
          funding_type: String.t(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:bank_transfer, :currency, :funding_type, :livemode, :object]

  @object_name "funding_instructions"
  def object_name, do: @object_name

  def expandable_fields, do: ["bank_transfer"]

  def __nested_fields__ do
    %{
      "bank_transfer" => {:resource, Stripe.Resources.BankTransfer}
    }
  end
end
