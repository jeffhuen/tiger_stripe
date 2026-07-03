# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderCollectPaymentMethodParams do
  @moduledoc "Parameters for reader collect payment method."

  @typedoc """
  * `collect_config` - Configuration overrides for this collection, such as tipping, surcharging, and customer cancellation settings.
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_intent` - The ID of the PaymentIntent to collect a payment method for. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:collect_config, :expand, :payment_intent]
end
