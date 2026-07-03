# File generated from our OpenAPI spec
defmodule Stripe.Params.SetupIntentRetrieveParams do
  @moduledoc "Parameters for setup intent retrieve."

  @typedoc """
  * `client_secret` - The client secret of the SetupIntent. We require this string if you use a publishable key to retrieve the SetupIntent. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:client_secret, :expand]
end
