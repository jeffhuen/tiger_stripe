# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventDestinationListParams do
  @moduledoc "Parameters for event destination list."

  @typedoc """
  * `include` - Include the normally redacted `webhook_endpoint.url` in each returned destination.
  * `limit` - The page size.
  """
  @type t :: %__MODULE__{}

  defstruct [:include, :limit]
end
