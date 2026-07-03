# File generated from our OpenAPI spec
defmodule Stripe.Params.FinancialConnections.AccountSubscribeParams do
  @moduledoc "Parameters for account subscribe."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - The list of account features to which you would like to subscribe.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :features]
end
