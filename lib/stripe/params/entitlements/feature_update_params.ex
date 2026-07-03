# File generated from our OpenAPI spec
defmodule Stripe.Params.Entitlements.FeatureUpdateParams do
  @moduledoc "Parameters for feature update."

  @typedoc """
  * `active` - Inactive features cannot be attached to new products and will not be returned from the features list endpoint.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - The feature's name, for your own purpose, not meant to be displayable to the customer. Max length: 80.
  """
  @type t :: %__MODULE__{}

  defstruct [:active, :expand, :metadata, :name]
end
