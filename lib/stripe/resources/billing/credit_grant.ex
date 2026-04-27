# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.CreditGrant do
  @moduledoc """
  CreditGrant

  A credit grant is an API resource that documents the allocation of some billing credits to a customer.

  Related guide: [Billing credits](https://docs.stripe.com/billing/subscriptions/usage-based/billing-credits)
  """

  @typedoc """
  * `amount` - Expandable.
  * `applicability_config` - Expandable.
  * `category` - The category of this credit grant. This is for tracking purposes and isn't displayed to the customer. Possible values: `paid`, `promotional`.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - ID of the customer receiving the billing credits. Expandable.
  * `customer_account` - ID of the account representing the customer receiving the billing credits Max length: 5000. Nullable.
  * `effective_at` - The time when the billing credits become effective-when they're eligible for use. Format: Unix timestamp. Nullable.
  * `expires_at` - The time when the billing credits expire. If not present, the billing credits don't expire. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - A descriptive name shown in dashboard. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `billing.credit_grant`.
  * `priority` - The priority for applying this credit grant. The highest priority is 0 and the lowest is 100. Nullable.
  * `test_clock` - ID of the test clock this credit grant belongs to. Nullable. Expandable.
  * `updated` - Time at which the object was last updated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `voided_at` - The time when this credit grant was voided. If not present, the credit grant hasn't been voided. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{
          amount: amount(),
          applicability_config: applicability_config(),
          category: String.t(),
          created: integer(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          effective_at: integer(),
          expires_at: integer(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          name: String.t(),
          object: String.t(),
          priority: integer() | nil,
          test_clock: String.t() | Stripe.Resources.TestHelpers.TestClock.t(),
          updated: integer(),
          voided_at: integer()
        }

  defstruct [
    :amount,
    :applicability_config,
    :category,
    :created,
    :customer,
    :customer_account,
    :effective_at,
    :expires_at,
    :id,
    :livemode,
    :metadata,
    :name,
    :object,
    :priority,
    :test_clock,
    :updated,
    :voided_at
  ]

  @object_name "billing.credit_grant"
  def object_name, do: @object_name

  def expandable_fields, do: ["amount", "applicability_config", "customer", "test_clock"]

  @typedoc """
  * `monetary` - The monetary amount. Nullable.
  * `type` - The type of this amount. We currently only support `monetary` billing credits. Possible values: `monetary`.
  """
  @type amount :: %{
          optional(:monetary) => amount_monetary() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `value` - A positive integer representing the amount.
  """
  @type amount_monetary :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `scope`
  """
  @type applicability_config :: %{
          optional(:scope) => applicability_config_scope() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `price_type` - The price type that credit grants can apply to. We currently only support the `metered` price type. This refers to prices that have a [Billing Meter](https://docs.stripe.com/api/billing/meter) attached to them. Cannot be used in combination with `prices`. Possible values: `metered`.
  * `prices` - The prices that credit grants can apply to. We currently only support `metered` prices. This refers to prices that have a [Billing Meter](https://docs.stripe.com/api/billing/meter) attached to them. Cannot be used in combination with `price_type`.
  """
  @type applicability_config_scope :: %{
          optional(:price_type) => String.t() | nil,
          optional(:prices) => [applicability_config_scope_prices()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - Unique identifier for the object. Max length: 5000. Nullable.
  """
  @type applicability_config_scope_prices :: %{
          optional(:id) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "amount" => %{
        fields: %{
          "monetary" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "applicability_config" => %{
        fields: %{
          "scope" => %{
            fields: %{
              "price_type" => :scalar,
              "prices" =>
                {:list,
                 %{
                   fields: %{
                     "id" => :scalar
                   }
                 }}
            }
          }
        }
      }
    }
  end
end
