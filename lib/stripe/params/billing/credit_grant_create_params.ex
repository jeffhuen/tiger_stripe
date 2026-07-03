# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.CreditGrantCreateParams do
  @moduledoc "Parameters for credit grant create."

  @typedoc """
  * `amount` - Amount of this credit grant.
  * `applicability_config` - Configuration specifying what this credit grant applies to. We currently only support `metered` prices that have a [Billing Meter](https://docs.stripe.com/api/billing/meter) attached to them.
  * `category` - The category of this credit grant. It defaults to `paid` if not specified. Possible values: `paid`, `promotional`.
  * `customer` - ID of the customer receiving the billing credits. Max length: 5000.
  * `customer_account` - ID of the account representing the customer receiving the billing credits. Max length: 5000.
  * `effective_at` - The time when the billing credits become effective-when they're eligible for use. It defaults to the current timestamp if not specified. Format: Unix timestamp.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - The time when the billing credits expire. If not specified, the billing credits don't expire. Format: Unix timestamp.
  * `metadata` - Set of key-value pairs that you can attach to an object. You can use this to store additional information about the object (for example, cost basis) in a structured format.
  * `name` - A descriptive name shown in the Dashboard. Max length: 100.
  * `priority` - The desired priority for applying this credit grant. If not specified, it will be set to the default value of 50. The highest priority is 0 and the lowest is 100.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :applicability_config,
    :category,
    :customer,
    :customer_account,
    :effective_at,
    :expand,
    :expires_at,
    :metadata,
    :name,
    :priority
  ]
end
