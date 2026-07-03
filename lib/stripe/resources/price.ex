# File generated from our OpenAPI spec
defmodule Stripe.Resources.Price do
  @moduledoc """
  Price

  Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products.
  [Products](https://api.stripe.com#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.

  For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.

  Related guides: [Set up a subscription](https://docs.stripe.com/billing/subscriptions/set-up-subscription), [create an invoice](https://docs.stripe.com/billing/invoices/create), and more about [products and prices](https://docs.stripe.com/products-prices/overview).
  """

  @typedoc """
  * `active` - Whether the price can be used for new purchases.
  * `billing_scheme` - Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes. Possible values: `per_unit`, `tiered`.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `currency_options` - Prices defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies). Expandable.
  * `custom_unit_amount` - When set, provides configuration for the amount to be adjusted by the customer during Checkout Sessions and Payment Links. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `lookup_key` - A lookup key used to retrieve prices dynamically from a static string. This may be up to 200 characters. Max length: 5000. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `nickname` - A brief description of the price, hidden from customers. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `price`.
  * `product` - The ID of the product this price is associated with. Expandable.
  * `recurring` - The recurring components of a price such as `interval` and `usage_type`. Nullable. Expandable.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`. Nullable.
  * `tiers` - Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`. Expandable.
  * `tiers_mode` - Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows. Possible values: `graduated`, `volume`. Nullable.
  * `transform_quantity` - Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`. Nullable. Expandable.
  * `type` - One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase. Possible values: `one_time`, `recurring`.
  * `unit_amount` - The unit amount in cents (or local equivalent) to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`. Nullable.
  * `unit_amount_decimal` - The unit amount in cents (or local equivalent) to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`. Format: decimal string. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :billing_scheme,
    :created,
    :currency,
    :currency_options,
    :custom_unit_amount,
    :id,
    :livemode,
    :lookup_key,
    :metadata,
    :nickname,
    :object,
    :product,
    :recurring,
    :tax_behavior,
    :tiers,
    :tiers_mode,
    :transform_quantity,
    :type,
    :unit_amount,
    :unit_amount_decimal
  ]

  @object_name "price"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "currency_options",
      "custom_unit_amount",
      "product",
      "recurring",
      "tiers",
      "transform_quantity"
    ]

  def __nested_fields__ do
    %{
      "currency_options" => %{
        fields: %{
          "custom_unit_amount" => %{
            fields: %{
              "maximum" => :scalar,
              "minimum" => :scalar,
              "preset" => :scalar
            }
          },
          "tax_behavior" => :scalar,
          "tiers" =>
            {:list,
             %{
               fields: %{
                 "flat_amount" => :scalar,
                 "flat_amount_decimal" => :scalar,
                 "unit_amount" => :scalar,
                 "unit_amount_decimal" => :scalar,
                 "up_to" => :scalar
               }
             }},
          "unit_amount" => :scalar,
          "unit_amount_decimal" => :scalar
        }
      },
      "custom_unit_amount" => %{
        fields: %{
          "maximum" => :scalar,
          "minimum" => :scalar,
          "preset" => :scalar
        }
      },
      "recurring" => %{
        fields: %{
          "interval" => :scalar,
          "interval_count" => :scalar,
          "meter" => :scalar,
          "trial_period_days" => :scalar,
          "usage_type" => :scalar
        }
      },
      "tiers" => %{
        fields: %{
          "flat_amount" => :scalar,
          "flat_amount_decimal" => :scalar,
          "unit_amount" => :scalar,
          "unit_amount_decimal" => :scalar,
          "up_to" => :scalar
        }
      },
      "transform_quantity" => %{
        fields: %{
          "divide_by" => :scalar,
          "round" => :scalar
        }
      }
    }
  end
end
