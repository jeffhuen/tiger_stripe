# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Terminal.ReaderPresentPaymentMethodParams do
  @moduledoc "Parameters for reader present payment method."

  @typedoc """
  * `amount_tip` - Simulated on-reader tip amount.
  * `card` - Simulated data for the card payment method.
  * `card_present` - Simulated data for the card_present payment method.
  * `expand` - Specifies which fields in the response should be expanded.
  * `interac_present` - Simulated data for the interac_present payment method.
  * `type` - Simulated payment type. Possible values: `card`, `card_present`, `interac_present`.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount_tip, :card, :card_present, :expand, :interac_present, :type]
end
