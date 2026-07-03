# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.AssociationFindParams do
  @moduledoc "Parameters for association find."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_intent` - Valid [PaymentIntent](https://docs.stripe.com/api/payment_intents/object) id Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :payment_intent]
end
