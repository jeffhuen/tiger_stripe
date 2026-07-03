# File generated from our OpenAPI spec
defmodule Stripe.Params.SourceRetrieveParams do
  @moduledoc "Parameters for source retrieve."

  @typedoc """
  * `client_secret` - The client secret of the source. Required if a publishable key is used to retrieve the source. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:client_secret, :expand]
end
