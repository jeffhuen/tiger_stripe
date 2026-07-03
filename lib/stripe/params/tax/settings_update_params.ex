# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.SettingsUpdateParams do
  @moduledoc "Parameters for settings update."

  @typedoc """
  * `defaults` - Default configuration to be used on Stripe Tax calculations.
  * `expand` - Specifies which fields in the response should be expanded.
  * `head_office` - The place where your business is located.
  """
  @type t :: %__MODULE__{}

  defstruct [:defaults, :expand, :head_office]
end
