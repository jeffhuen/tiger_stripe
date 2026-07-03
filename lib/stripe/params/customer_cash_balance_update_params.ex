# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerCashBalanceUpdateParams do
  @moduledoc "Parameters for customer cash balance update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `settings` - A hash of settings for this cash balance.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :settings]
end
