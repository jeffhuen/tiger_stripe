# File generated from our OpenAPI spec
defmodule Stripe.Params.BalanceSettingsUpdateParams do
  @moduledoc "Parameters for balance settings update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payments` - Settings that apply to the [Payments Balance](https://docs.stripe.com/api/balance).
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :payments]
end
