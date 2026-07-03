# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.TestClockCreateParams do
  @moduledoc "Parameters for test clock create."

  @typedoc """
  * `customer` - Existing customer this test clock will be attached to. Once attached, customers can't be removed from a test clock. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `frozen_time` - The initial frozen time for this test clock. Format: Unix timestamp.
  * `name` - The name for this test clock. Max length: 300.
  """
  @type t :: %__MODULE__{}

  defstruct [:customer, :expand, :frozen_time, :name]
end
