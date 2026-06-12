# File generated from our OpenAPI spec
defmodule Stripe.Resources.Plan do
  @moduledoc """
  Plan

  You can now model subscriptions more flexibly using the [Prices API](https://api.stripe.com#prices). It replaces the Plans API and is backwards compatible to simplify your migration.

  Plans define the base price, currency, and billing cycle for recurring purchases of products.
  [Products](https://api.stripe.com#products) help you track inventory or provisioning, and plans help you track pricing. Different physical goods or levels of service should be represented by products, and pricing options should be represented by plans. This approach lets you change prices without having to change your provisioning scheme.

  For example, you might have a single "gold" product that has plans for $10/month, $100/year, €9/month, and €90/year.

  Related guides: [Set up a subscription](https://docs.stripe.com/billing/subscriptions/set-up-subscription) and more about [products and prices](https://docs.stripe.com/products-prices/overview).
  """

  @typedoc """
  * `active` - Whether the plan can be used for new purchases.
  * `amount` - The unit amount in cents (or local equivalent) to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`. Nullable.
  * `amount_decimal` - The unit amount in cents (or local equivalent) to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`. Format: decimal string. Nullable.
  * `billing_scheme` - Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `amount`) will be charged per unit in `quantity` (for plans with `usage_type=licensed`), or per unit of total usage (for plans with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes. Possible values: `per_unit`, `tiered`.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `interval` - The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `meter` - The meter tracking the usage of a metered price Max length: 5000. Nullable.
  * `nickname` - A brief description of the plan, hidden from customers. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `plan`.
  * `product` - The product whose pricing this plan determines. Nullable. Expandable.
  * `tiers` - Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`. Expandable.
  * `tiers_mode` - Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows. Possible values: `graduated`, `volume`. Nullable.
  * `transform_usage` - Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`. Nullable. Expandable.
  * `trial_period_days` - Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://docs.stripe.com/api#create_subscription-trial_from_plan). Nullable.
  * `usage_type` - Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`. Possible values: `licensed`, `metered`.
  """
  @type t :: %__MODULE__{
          active: boolean(),
          amount: integer(),
          amount_decimal: String.t(),
          billing_scheme: String.t(),
          created: integer(),
          currency: String.t(),
          id: String.t(),
          interval: String.t(),
          interval_count: integer(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          meter: String.t(),
          nickname: String.t(),
          object: String.t(),
          product: String.t() | Stripe.Resources.Product.t(),
          tiers: [tiers()] | nil,
          tiers_mode: String.t(),
          transform_usage: transform_usage(),
          trial_period_days: integer(),
          usage_type: String.t()
        }

  defstruct [
    :active,
    :amount,
    :amount_decimal,
    :billing_scheme,
    :created,
    :currency,
    :id,
    :interval,
    :interval_count,
    :livemode,
    :metadata,
    :meter,
    :nickname,
    :object,
    :product,
    :tiers,
    :tiers_mode,
    :transform_usage,
    :trial_period_days,
    :usage_type
  ]

  @object_name "plan"
  def object_name, do: @object_name

  def expandable_fields, do: ["product", "tiers", "transform_usage"]

  @typedoc """
  * `flat_amount` - Price for the entire tier. Nullable.
  * `flat_amount_decimal` - Same as `flat_amount`, but contains a decimal value with at most 12 decimal places. Format: decimal string. Nullable.
  * `unit_amount` - Per unit price for units relevant to the tier. Nullable.
  * `unit_amount_decimal` - Same as `unit_amount`, but contains a decimal value with at most 12 decimal places. Format: decimal string. Nullable.
  * `up_to` - Up to and including to this quantity will be contained in the tier. Nullable.
  """
  @type tiers :: %{
          optional(:flat_amount) => integer() | nil,
          optional(:flat_amount_decimal) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(:up_to) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `divide_by` - Divide usage by this number.
  * `round` - After division, either round the result `up` or `down`. Possible values: `down`, `up`.
  """
  @type transform_usage :: %{
          optional(:divide_by) => integer() | nil,
          optional(:round) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "tiers" => %{
        fields: %{
          "flat_amount" => :scalar,
          "flat_amount_decimal" => :scalar,
          "unit_amount" => :scalar,
          "unit_amount_decimal" => :scalar,
          "up_to" => :scalar
        }
      },
      "transform_usage" => %{
        fields: %{
          "divide_by" => :scalar,
          "round" => :scalar
        }
      }
    }
  end
end
