# File generated from our OpenAPI spec
defmodule Stripe.Params.ProductCatalog.TrialOfferCreateParams do
  @moduledoc "Parameters for trial offer create."

  @typedoc """
  * `active` - Whether the trial offer can be used for new subscriptions. Defaults to true.
  * `duration` - Duration of one service period of the trial.
  * `end_behavior` - Define behavior that occurs at the end of the trial.
  * `expand` - Specifies which fields in the response should be expanded.
  * `nickname` - A brief description of the trial offer, hidden from customers. Max length: 255.
  * `price` - Price configuration during the trial period (amount, billing scheme, etc). Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:active, :duration, :end_behavior, :expand, :nickname, :price]
end
