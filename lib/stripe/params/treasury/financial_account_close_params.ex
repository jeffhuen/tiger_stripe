# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.FinancialAccountCloseParams do
  @moduledoc "Parameters for financial account close."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `forwarding_settings` - A different bank account where funds can be deposited/debited in order to get the closing FA's balance to $0
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :forwarding_settings]
end
