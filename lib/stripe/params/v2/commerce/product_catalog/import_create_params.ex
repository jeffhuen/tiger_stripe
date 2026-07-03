# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Commerce.ProductCatalog.ImportCreateParams do
  @moduledoc "Parameters for import create."

  @typedoc """
  * `feed_type` - The type of catalog data to import. Possible values: `inventory`, `pricing`, `product`, `promotion`.
  * `metadata` - Additional information about the import in a structured format.
  * `mode` - The strategy for handling existing catalog data during import. Possible values: `replace`, `upsert`.
  """
  @type t :: %__MODULE__{}

  defstruct [:feed_type, :metadata, :mode]
end
