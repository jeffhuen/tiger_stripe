# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.Vault.GbBankAccountCreateParams do
  @moduledoc "Parameters for gb bank account create."

  @typedoc """
  * `account_number` - The Account Number of the bank account.
  * `bank_account_type` - Closed Enum. The type of the bank account (checking or savings). Possible values: `checking`, `savings`.
  * `currency` - The currency of the bank account.
  * `iban` - The IBAN of the bank account.
  * `sort_code` - The Sort Code of the bank account.
  """
  @type t :: %__MODULE__{}

  defstruct [:account_number, :bank_account_type, :currency, :iban, :sort_code]
end
