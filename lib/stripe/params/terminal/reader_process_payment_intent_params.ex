# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderProcessPaymentIntentParams do
  @moduledoc "Parameters for reader process payment intent."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_intent` - The ID of the PaymentIntent to process on the reader. Max length: 5000.
  * `process_config` - Configuration overrides for this transaction, such as tipping and customer cancellation settings.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :payment_intent, :process_config]
end
