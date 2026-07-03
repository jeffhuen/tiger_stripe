# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.MeterEventSummaryListParams do
  @moduledoc "Parameters for meter event summary list."

  @typedoc """
  * `customer` - The customer for which to fetch event summaries. Max length: 5000.
  * `end_time` - The timestamp from when to stop aggregating meter events (exclusive). Must be aligned with minute boundaries. Format: Unix timestamp.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `start_time` - The timestamp from when to start aggregating meter events (inclusive). Must be aligned with minute boundaries. Format: Unix timestamp.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `value_grouping_window` - Specifies what granularity to use when generating event summaries. If not specified, a single event summary would be returned for the specified time range. For hourly granularity, start and end times must align with hour boundaries (e.g., 00:00, 01:00, ..., 23:00). For daily granularity, start and end times must align with UTC day boundaries (00:00 UTC). Possible values: `day`, `hour`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :customer,
    :end_time,
    :ending_before,
    :expand,
    :limit,
    :start_time,
    :starting_after,
    :value_grouping_window
  ]
end
