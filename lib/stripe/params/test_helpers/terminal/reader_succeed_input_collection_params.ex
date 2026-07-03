# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Terminal.ReaderSucceedInputCollectionParams do
  @moduledoc "Parameters for reader succeed input collection."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `skip_non_required_inputs` - This parameter defines the skip behavior for input collection. Possible values: `all`, `none`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :skip_non_required_inputs]
end
