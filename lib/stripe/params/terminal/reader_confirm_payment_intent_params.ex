# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderConfirmPaymentIntentParams do
  @moduledoc "Parameters for reader confirm payment intent."

  @typedoc """
  * `confirm_config` - Configuration overrides for this confirmation, such as surcharge settings and return URL.
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_intent` - The ID of the PaymentIntent to confirm. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:confirm_config, :expand, :payment_intent]
end
