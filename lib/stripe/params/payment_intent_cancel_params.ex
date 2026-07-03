# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentCancelParams do
  @moduledoc "Parameters for payment intent cancel."

  @typedoc """
  * `cancellation_reason` - Reason for canceling this PaymentIntent. Possible values are: `duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned` Possible values: `abandoned`, `duplicate`, `fraudulent`, `requested_by_customer`. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:cancellation_reason, :expand]
end
