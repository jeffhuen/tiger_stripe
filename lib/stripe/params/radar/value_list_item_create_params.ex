# File generated from our OpenAPI spec
defmodule Stripe.Params.Radar.ValueListItemCreateParams do
  @moduledoc "Parameters for value list item create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `value` - The value of the item (whose type must match the type of the parent value list). Max length: 800.
  * `value_list` - The identifier of the value list which the created item will be added to. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :value, :value_list]
end
