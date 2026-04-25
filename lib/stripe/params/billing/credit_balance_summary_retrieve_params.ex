# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.CreditBalanceSummaryRetrieveParams do
  @moduledoc "Parameters for credit balance summary retrieve."

  @typedoc """
  * `customer` - The customer whose credit balance summary you're retrieving. Max length: 5000.
  * `customer_account` - The account representing the customer whose credit balance summary you're retrieving. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `filter` - The filter criteria for the credit balance summary.
  """
  @type t :: %__MODULE__{
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          expand: [String.t()] | nil,
          filter: filter()
        }

  defstruct [:customer, :customer_account, :expand, :filter]

  @typedoc """
  * `applicability_scope` - The billing credit applicability scope for which to fetch credit balance summary.
  * `credit_grant` - The credit grant for which to fetch credit balance summary. Max length: 5000.
  * `type` - Specify the type of this filter. Possible values: `applicability_scope`, `credit_grant`.
  """
  @type filter :: %{
          optional(:applicability_scope) => filter_applicability_scope() | nil,
          optional(:credit_grant) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `price_type` - The price type that credit grants can apply to. We currently only support the `metered` price type. Cannot be used in combination with `prices`. Possible values: `metered`.
  * `prices` - A list of prices that the credit grant can apply to. We currently only support the `metered` prices. Cannot be used in combination with `price_type`.
  """
  @type filter_applicability_scope :: %{
          optional(:price_type) => String.t() | nil,
          optional(:prices) => [filter_applicability_scope_prices()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - The price ID this credit grant should apply to. Max length: 5000.
  """
  @type filter_applicability_scope_prices :: %{
          optional(:id) => String.t() | nil,
          optional(String.t()) => term()
        }
end
