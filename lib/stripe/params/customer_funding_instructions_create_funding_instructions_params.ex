# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerFundingInstructionsCreateFundingInstructionsParams do
  @moduledoc "Parameters for customer funding instructions create funding instructions."

  @typedoc """
  * `bank_transfer` - Additional parameters for `bank_transfer` funding types
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `expand` - Specifies which fields in the response should be expanded.
  * `funding_type` - The `funding_type` to get the instructions for. Possible values: `bank_transfer`.
  """
  @type t :: %__MODULE__{}

  defstruct [:bank_transfer, :currency, :expand, :funding_type]
end
