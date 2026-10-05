# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.FeedbackOptionCreateParams do
  @moduledoc "Parameters for feedback option create."

  @typedoc """
  * `description` - The text of the feedback option, which customers see when canceling. Maximum 100 characters. Max length: 100.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :expand]
end
