# File generated from our OpenAPI spec
defmodule Stripe.Params.ProductCatalog.TrialOfferUpdateParams do
  @moduledoc "Parameters for trial offer update."

  @typedoc """
  * `active` - Whether the trial offer can be used for new purchases.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:active, :expand]
end
