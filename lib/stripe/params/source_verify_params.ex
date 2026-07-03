# File generated from our OpenAPI spec
defmodule Stripe.Params.SourceVerifyParams do
  @moduledoc "Parameters for source verify."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `values` - The values needed to verify the source.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :values]
end
