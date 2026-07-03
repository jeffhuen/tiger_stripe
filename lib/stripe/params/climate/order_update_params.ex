# File generated from our OpenAPI spec
defmodule Stripe.Params.Climate.OrderUpdateParams do
  @moduledoc "Parameters for order update."

  @typedoc """
  * `beneficiary` - Publicly sharable reference for the end beneficiary of carbon removal. Assumed to be the Stripe account if not set.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:beneficiary, :expand, :metadata]
end
