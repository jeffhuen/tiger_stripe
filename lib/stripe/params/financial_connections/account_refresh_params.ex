# File generated from our OpenAPI spec
defmodule Stripe.Params.FinancialConnections.AccountRefreshParams do
  @moduledoc "Parameters for account refresh."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - The list of account features that you would like to refresh.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :features]
end
