# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.PayoutMethodListParams do
  @moduledoc "Parameters for payout method list."

  @typedoc """
  * `limit` - The page size.
  * `usage_status` - Usage status filter.
  """
  @type t :: %__MODULE__{}

  defstruct [:limit, :usage_status]
end
