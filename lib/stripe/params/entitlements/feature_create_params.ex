# File generated from our OpenAPI spec
defmodule Stripe.Params.Entitlements.FeatureCreateParams do
  @moduledoc "Parameters for feature create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `lookup_key` - A unique key you provide as your own system identifier. This may be up to 80 characters. Max length: 80.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - The feature's name, for your own purpose, not meant to be displayable to the customer. Max length: 80.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :lookup_key, :metadata, :name]
end
