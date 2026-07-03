# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Commerce.ProductCatalog.ImportListParams do
  @moduledoc "Parameters for import list."

  @typedoc """
  * `created` - Filter for objects created at the specified timestamp.
  Must be an RFC 3339 date & time value, for example: 2022-09-18T13:22:00Z. Format: date-time.
  * `created_gt` - Filter for objects created after the specified timestamp.
  Must be an RFC 3339 date & time value, for example: 2022-09-18T13:22:00Z. Format: date-time.
  * `created_gte` - Filter for objects created on or after the specified timestamp.
  Must be an RFC 3339 date & time value, for example: 2022-09-18T13:22:00Z. Format: date-time.
  * `created_lt` - Filter for objects created before the specified timestamp.
  Must be an RFC 3339 date & time value, for example: 2022-09-18T13:22:00Z. Format: date-time.
  * `created_lte` - Filter for objects created on or before the specified timestamp.
  Must be an RFC 3339 date & time value, for example: 2022-09-18T13:22:00Z. Format: date-time.
  * `feed_type` - Filter by the type of feed data being imported. Possible values: `inventory`, `pricing`, `product`, `promotion`.
  * `limit` - The maximum number of results per page.
  * `status` - Filter by import status. Possible values: `awaiting_upload`, `failed`, `processing`, `succeeded`, `succeeded_with_errors`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :created_gt,
    :created_gte,
    :created_lt,
    :created_lte,
    :feed_type,
    :limit,
    :status
  ]
end
