# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.AdjustmentListParams do
  @moduledoc "Parameters for adjustment list."

  @typedoc """
  * `adjusted_flow` - Filter for Adjustments linked to a specific flow object. This filter only supports filtering by
  the flow object's ID, such as `ibt_123` for an InboundTransfer.
  * `created` - Filter for Adjustments by their creation time using `gt`, `gte`, `lt`, or `lte`.
  * `limit` - The page limit.
  """
  @type t :: %__MODULE__{}

  defstruct [:adjusted_flow, :created, :limit]
end
