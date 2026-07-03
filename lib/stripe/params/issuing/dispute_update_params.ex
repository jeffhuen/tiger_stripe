# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.DisputeUpdateParams do
  @moduledoc "Parameters for dispute update."

  @typedoc """
  * `amount` - The dispute amount in the card's currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `evidence` - Evidence provided for the dispute.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :evidence, :expand, :metadata]
end
