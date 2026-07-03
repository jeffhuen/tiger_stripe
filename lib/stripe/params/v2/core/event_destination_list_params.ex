# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventDestinationListParams do
  @moduledoc "Parameters for event destination list."

  @typedoc """
  * `include` - Additional fields to include in the response. Currently supports `webhook_endpoint.url`.
  * `limit` - The page size.
  """
  @type t :: %__MODULE__{}

  defstruct [:include, :limit]
end
