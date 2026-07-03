# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventListParams do
  @moduledoc "Parameters for event list."

  @typedoc """
  * `created` - Set of filters to query events within a range of `created` timestamps.
  * `limit` - The page size.
  * `object_id` - Primary object ID used to retrieve related events.
  * `types` - An array of up to 20 strings containing specific event names.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :limit, :object_id, :types]
end
