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
  @type t :: %__MODULE__{
          amount: amount(),
          applicability_config: applicability_config(),
          category: String.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          effective_at: integer() | nil,
          expand: [String.t()] | nil,
          expires_at: integer() | nil,
          metadata: %{String.t() => String.t()} | nil,
          name: String.t() | nil,
          priority: integer() | nil
        }

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

  @typedoc """
  * `monetary` - The monetary amount.
  * `type` - The type of this amount. We currently only support `monetary` billing credits. Possible values: `monetary`.
  """
  @type amount :: %{
          optional(:monetary) => amount_monetary() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the `value` parameter. Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount of the credit grant.
  """
  @type amount_monetary :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `scope` - Specify the scope of this applicability config.
  """
  @type applicability_config :: %{
          optional(:scope) => applicability_config_scope() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `price_type` - The price type that credit grants can apply to. We currently only support the `metered` price type. Cannot be used in combination with `prices`. Possible values: `metered`.
  * `prices` - A list of prices that the credit grant can apply to. We currently only support the `metered` prices. Cannot be used in combination with `price_type`.
  """
  @type applicability_config_scope :: %{
          optional(:price_type) => String.t() | nil,
          optional(:prices) => [applicability_config_scope_prices()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - The price ID this credit grant should apply to. Max length: 5000.
  """
  @type applicability_config_scope_prices :: %{
          optional(:id) => String.t() | nil,
          optional(String.t()) => term()
        }
end
