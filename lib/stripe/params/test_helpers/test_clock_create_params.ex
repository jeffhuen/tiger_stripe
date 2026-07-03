# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.TestClockCreateParams do
  @moduledoc "Parameters for test clock create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `frozen_time` - The initial frozen time for this test clock. Format: Unix timestamp.
  * `name` - The name for this test clock. Max length: 300.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :frozen_time, :name]
end
