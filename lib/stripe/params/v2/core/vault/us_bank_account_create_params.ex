# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.Vault.UsBankAccountCreateParams do
  @moduledoc "Parameters for us bank account create."

  @typedoc """
  * `account_number` - The account number of the bank account.
  * `bank_account_type` - Closed Enum. The type of the bank account (checking or savings). Possible values: `checking`, `savings`.
  * `currency` - The currency of the bank account.
  * `fedwire_routing_number` - The fedwire routing number of the bank account. Note that certain banks have the same ACH and wire routing number.
  * `routing_number` - The ACH routing number of the bank account. Note that certain banks have the same ACH and wire routing number.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_number,
    :bank_account_type,
    :currency,
    :fedwire_routing_number,
    :routing_number
  ]
end
