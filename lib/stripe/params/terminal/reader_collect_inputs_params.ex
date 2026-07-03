# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderCollectInputsParams do
  @moduledoc "Parameters for reader collect inputs."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `inputs` - List of inputs to be collected from the customer using the Reader. Maximum 5 inputs.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :inputs, :metadata]
end
