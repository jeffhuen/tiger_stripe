# File generated from our OpenAPI spec
defmodule Stripe.Params.ProductFeatureCreateParams do
  @moduledoc "Parameters for product feature create."

  @typedoc """
  * `entitlement_feature` - The ID of the [Feature](https://docs.stripe.com/api/entitlements/feature) object attached to this product. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:entitlement_feature, :expand]
end
