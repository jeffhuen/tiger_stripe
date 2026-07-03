# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.TestClockAdvanceParams do
  @moduledoc "Parameters for test clock advance."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `frozen_time` - The time to advance the test clock. Must be after the test clock's current frozen time. Cannot be more than two intervals in the future from the shortest subscription in this test clock. If there are no subscriptions in this test clock, it cannot be more than two years in the future. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :frozen_time]
end
