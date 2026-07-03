# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionMigrateParams do
  @moduledoc "Parameters for subscription migrate."

  @typedoc """
  * `billing_mode` - Controls how prorations and invoices for subscriptions are calculated and orchestrated.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:billing_mode, :expand]
end
