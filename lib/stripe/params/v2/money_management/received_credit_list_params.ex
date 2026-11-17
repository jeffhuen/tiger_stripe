# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.ReceivedCreditListParams do
  @moduledoc "Parameters for received credit list."

  @typedoc """
  * `created` - Hash of options for filtering on creation time.
  * `limit` - The page limit.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :limit]
end
