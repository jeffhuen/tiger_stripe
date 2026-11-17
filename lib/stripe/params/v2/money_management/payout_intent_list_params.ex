# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.PayoutIntentListParams do
  @moduledoc "Parameters for payout intent list."

  @typedoc """
  * `limit` - Maximum number of objects to return. Defaults to 10. Maximum is 100.
  """
  @type t :: %__MODULE__{}

  defstruct [:limit]
end
