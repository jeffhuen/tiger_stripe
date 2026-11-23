# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.FinancialAccountListParams do
  @moduledoc "Parameters for financial account list."

  @typedoc """
  * `include` - Additional fields to include in the response.
  * `limit` - Maximum number of results to return. Default: 10. Valid range: 1-20.
  * `statuses` - Return FinancialAccounts whose `status` matches any of the provided values.
  If omitted, closed FinancialAccounts are not returned.
  """
  @type t :: %__MODULE__{}

  defstruct [:include, :limit, :statuses]
end
