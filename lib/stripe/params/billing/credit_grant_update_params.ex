# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.CreditGrantUpdateParams do
  @moduledoc "Parameters for credit grant update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - The time when the billing credits created by this credit grant expire. If set to empty, the billing credits never expire.
  * `metadata` - Set of key-value pairs you can attach to an object. You can use this to store additional information about the object (for example, cost basis) in a structured format.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :expires_at, :metadata]
end
