# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.FinancialAddressListParams do
  @moduledoc "Parameters for financial address list."

  @typedoc """
  * `financial_account` - The ID of the FinancialAccount for which FinancialAddresses are to be returned.
  * `limit` - The page limit.
  """
  @type t :: %__MODULE__{}

  defstruct [:financial_account, :limit]
end
