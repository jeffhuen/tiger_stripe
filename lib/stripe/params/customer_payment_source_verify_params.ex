# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerPaymentSourceVerifyParams do
  @moduledoc "Parameters for customer payment source verify."

  @typedoc """
  * `amounts` - Two positive integers, in *cents*, equal to the values of the microdeposits sent to the bank account.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:amounts, :expand]
end
