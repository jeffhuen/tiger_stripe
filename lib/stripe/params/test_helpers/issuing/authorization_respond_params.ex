# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.AuthorizationRespondParams do
  @moduledoc "Parameters for authorization respond."

  @typedoc """
  * `confirmed` - Whether to simulate the user confirming that the transaction was legitimate (true) or telling Stripe that it was fraudulent (false).
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:confirmed, :expand]
end
