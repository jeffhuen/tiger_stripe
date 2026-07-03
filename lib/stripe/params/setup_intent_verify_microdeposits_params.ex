# File generated from our OpenAPI spec
defmodule Stripe.Params.SetupIntentVerifyMicrodepositsParams do
  @moduledoc "Parameters for setup intent verify microdeposits."

  @typedoc """
  * `amounts` - Two positive integers, in *cents*, equal to the values of the microdeposits sent to the bank account.
  * `descriptor_code` - A six-character code starting with SM present in the microdeposit sent to the bank account. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:amounts, :descriptor_code, :expand]
end
