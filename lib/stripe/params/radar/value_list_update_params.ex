# File generated from our OpenAPI spec
defmodule Stripe.Params.Radar.ValueListUpdateParams do
  @moduledoc "Parameters for value list update."

  @typedoc """
  * `alias` - The name of the value list for use in rules. Max length: 100.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The human-readable name of the value list. Max length: 100.
  """
  @type t :: %__MODULE__{}

  defstruct [:alias, :expand, :metadata, :name]
end
