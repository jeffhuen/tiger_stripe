# File generated from our OpenAPI spec
defmodule Stripe.Resources.UsBankAccount do
  @moduledoc """
  TreasurySharedResourceInitiatingPaymentMethodDetailsUSBankAccount
  """

  @typedoc """
  * `bank_name` - Bank name. Max length: 5000. Nullable.
  * `last4` - The last four digits of the bank account number. Max length: 5000. Nullable.
  * `routing_number` - The routing number for the bank account. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:bank_name, :last4, :routing_number]

  @object_name "treasury_shared_resource_initiating_payment_method_details_us_bank_account"
  def object_name, do: @object_name
end
