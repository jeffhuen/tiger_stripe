# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventListParams do
  @moduledoc "Parameters for event list."

  @typedoc """
  * `created` - Set of filters to query events within a range of `created` timestamps.
  * `limit` - The page size.
  * `object_id` - Primary object ID used to retrieve related events.
  * `types` - An array of up to 20 strings containing specific event names.
  """
  @type t :: %__MODULE__{
          created: created() | nil,
          limit: integer() | nil,
          object_id: String.t() | nil,
          types: [String.t()] | nil
        }

  defstruct [:created, :limit, :object_id, :types]

  @typedoc """
  * `gt` - Filter for events created after the specified timestamp. Format: date-time.
  * `gte` - Filter for events created at or after the specified timestamp. Format: date-time.
  * `lt` - Filter for events created before the specified timestamp. Format: date-time.
  * `lte` - Filter for events created at or before the specified timestamp. Format: date-time.
  """
  @type created :: %{
          optional(:gt) => String.t() | nil,
          optional(:gte) => String.t() | nil,
          optional(:lt) => String.t() | nil,
          optional(:lte) => String.t() | nil,
          optional(String.t()) => term()
        }
end
