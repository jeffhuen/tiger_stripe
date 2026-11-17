# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.FinancialAddressCreateParams do
  @moduledoc "Parameters for financial address create."

  @typedoc """
  * `bank_account` - Properties for creating a bank account FinancialAddress.
  * `financial_account` - The ID of the FinancialAccount the new FinancialAddress should be associated with.
  * `type` - The type of FinancialAddress to create. Must agree with which branch of financial_address_type_properties is set. Possible values: `bank_account`.
  """
  @type t :: %__MODULE__{}

  defstruct [:bank_account, :financial_account, :type]
end
