# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentRetrieveParams do
  @moduledoc "Parameters for payment intent retrieve."

  @typedoc """
  * `client_secret` - The client secret of the PaymentIntent. We require it if you use a publishable key to retrieve the source. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:client_secret, :expand]
end
