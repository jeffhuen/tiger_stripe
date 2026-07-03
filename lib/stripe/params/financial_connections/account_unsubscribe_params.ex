# File generated from our OpenAPI spec
defmodule Stripe.Params.FinancialConnections.AccountUnsubscribeParams do
  @moduledoc "Parameters for account unsubscribe."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - The list of account features from which you would like to unsubscribe.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :features]
end
