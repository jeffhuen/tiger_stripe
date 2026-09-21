# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.FeedbackOptionUpdateParams do
  @moduledoc "Parameters for feedback option update."

  @typedoc """
  * `description` - Max length: 100.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :expand]
end
