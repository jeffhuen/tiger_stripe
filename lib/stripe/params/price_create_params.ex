# File generated from our OpenAPI spec
defmodule Stripe.Params.PriceCreateParams do
  @moduledoc "Parameters for price create."

  @typedoc """
  * `active` - Whether the price can be used for new purchases. Defaults to `true`.
  * `billing_scheme` - Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes. Possible values: `per_unit`, `tiered`.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `currency_options` - Prices defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
  * `custom_unit_amount` - When set, provides configuration for the amount to be adjusted by the customer during Checkout Sessions and Payment Links.
  * `expand` - Specifies which fields in the response should be expanded.
  * `lookup_key` - A lookup key used to retrieve prices dynamically from a static string. This may be up to 200 characters. Max length: 200.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `nickname` - A brief description of the price, hidden from customers. Max length: 5000.
  * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. Max length: 5000.
  * `product_data` - These fields can be used to create a new product that this price will belong to.
  * `recurring` - The recurring components of a price such as `interval` and `usage_type`.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `tiers` - Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
  * `tiers_mode` - Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price, in `graduated` tiering pricing can successively change as the quantity grows. Possible values: `graduated`, `volume`.
  * `transfer_lookup_key` - If set to true, will atomically remove the lookup key from the existing price, and assign it to this price.
  * `transform_quantity` - Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
  * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge. One of `unit_amount`, `unit_amount_decimal`, or `custom_unit_amount` is required, unless `billing_scheme=tiered`.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type t :: %__MODULE__{
          active: boolean() | nil,
          billing_scheme: String.t() | nil,
          currency: String.t(),
          currency_options: %{String.t() => __MODULE__.CurrencyOptions.t()} | nil,
          custom_unit_amount: __MODULE__.CustomUnitAmount.t() | nil,
          expand: [String.t()] | nil,
          lookup_key: String.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          nickname: String.t() | nil,
          product: String.t() | nil,
          product_data: __MODULE__.ProductData.t() | nil,
          recurring: __MODULE__.Recurring.t() | nil,
          tax_behavior: String.t() | nil,
          tiers: [__MODULE__.Tiers.t()] | nil,
          tiers_mode: String.t() | nil,
          transfer_lookup_key: boolean() | nil,
          transform_quantity: __MODULE__.TransformQuantity.t() | nil,
          unit_amount: integer() | nil,
          unit_amount_decimal: String.t() | nil
        }

  defstruct [
    :active,
    :billing_scheme,
    :currency,
    :currency_options,
    :custom_unit_amount,
    :expand,
    :lookup_key,
    :metadata,
    :nickname,
    :product,
    :product_data,
    :recurring,
    :tax_behavior,
    :tiers,
    :tiers_mode,
    :transfer_lookup_key,
    :transform_quantity,
    :unit_amount,
    :unit_amount_decimal
  ]

  defmodule CurrencyOptions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `custom_unit_amount` - When set, provides configuration for the amount to be adjusted by the customer during Checkout Sessions and Payment Links.
    * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
    * `tiers` - Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
    * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge.
    * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
    """
    @type t :: %__MODULE__{
            custom_unit_amount: __MODULE__.CustomUnitAmount.t() | nil,
            tax_behavior: String.t() | nil,
            tiers: [__MODULE__.Tiers.t()] | nil,
            unit_amount: integer() | nil,
            unit_amount_decimal: String.t() | nil
          }
    defstruct [:custom_unit_amount, :tax_behavior, :tiers, :unit_amount, :unit_amount_decimal]

    defmodule CustomUnitAmount do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Pass in `true` to enable `custom_unit_amount`, otherwise omit `custom_unit_amount`.
      * `maximum` - The maximum unit amount the customer can specify for this item.
      * `minimum` - The minimum unit amount the customer can specify for this item. Must be at least the minimum charge amount.
      * `preset` - The starting unit amount which can be updated by the customer.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              maximum: integer() | nil,
              minimum: integer() | nil,
              preset: integer() | nil
            }
      defstruct [:enabled, :maximum, :minimum, :preset]
    end

    defmodule Tiers do
      @moduledoc "Nested parameters."

      @typedoc """
      * `flat_amount` - The flat billing amount for an entire tier, regardless of the number of units in the tier.
      * `flat_amount_decimal` - Same as `flat_amount`, but accepts a decimal value representing an integer in the minor units of the currency. Only one of `flat_amount` and `flat_amount_decimal` can be set. Format: decimal string.
      * `unit_amount` - The per unit billing amount for each individual unit for which this tier applies.
      * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
      * `up_to` - Specifies the upper bound of this tier. The lower bound of a tier is the upper bound of the previous tier adding one. Use `inf` to define a fallback tier.
      """
      @type t :: %__MODULE__{
              flat_amount: integer() | nil,
              flat_amount_decimal: String.t() | nil,
              unit_amount: integer() | nil,
              unit_amount_decimal: String.t() | nil,
              up_to: map() | nil
            }
      defstruct [:flat_amount, :flat_amount_decimal, :unit_amount, :unit_amount_decimal, :up_to]
    end
  end

  defmodule CustomUnitAmount do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Pass in `true` to enable `custom_unit_amount`, otherwise omit `custom_unit_amount`.
    * `maximum` - The maximum unit amount the customer can specify for this item.
    * `minimum` - The minimum unit amount the customer can specify for this item. Must be at least the minimum charge amount.
    * `preset` - The starting unit amount which can be updated by the customer.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            maximum: integer() | nil,
            minimum: integer() | nil,
            preset: integer() | nil
          }
    defstruct [:enabled, :maximum, :minimum, :preset]
  end

  defmodule ProductData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `active` - Whether the product is currently available for purchase. Defaults to `true`.
    * `id` - The identifier for the product. Must be unique. If not provided, an identifier will be randomly generated. Max length: 5000.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    * `name` - The product's name, meant to be displayable to the customer. Max length: 5000.
    * `statement_descriptor` - An arbitrary string to be displayed on your customer's credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all.

    This may be up to 22 characters. The statement description may not include `, `\\`, `"`, `'` characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped. Max length: 22.
    * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. Max length: 5000.
    * `unit_label` - A label that represents units of this product. When set, this will be included in customers' receipts, invoices, Checkout, and the customer portal. Max length: 12.
    """
    @type t :: %__MODULE__{
            active: boolean() | nil,
            id: String.t() | nil,
            metadata: %{String.t() => String.t()} | nil,
            name: String.t() | nil,
            statement_descriptor: String.t() | nil,
            tax_code: String.t() | nil,
            unit_label: String.t() | nil
          }
    defstruct [:active, :id, :metadata, :name, :statement_descriptor, :tax_code, :unit_label]
  end

  defmodule Recurring do
    @moduledoc "Nested parameters."

    @typedoc """
    * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
    * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
    * `meter` - The meter tracking the usage of a metered price Max length: 5000.
    * `trial_period_days` - Default number of trial days when subscribing a customer to this price using [`trial_from_plan=true`](https://docs.stripe.com/api#create_subscription-trial_from_plan).
    * `usage_type` - Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`. Possible values: `licensed`, `metered`.
    """
    @type t :: %__MODULE__{
            interval: String.t() | nil,
            interval_count: integer() | nil,
            meter: String.t() | nil,
            trial_period_days: integer() | nil,
            usage_type: String.t() | nil
          }
    defstruct [:interval, :interval_count, :meter, :trial_period_days, :usage_type]
  end

  defmodule Tiers do
    @moduledoc "Nested parameters."

    @typedoc """
    * `flat_amount` - The flat billing amount for an entire tier, regardless of the number of units in the tier.
    * `flat_amount_decimal` - Same as `flat_amount`, but accepts a decimal value representing an integer in the minor units of the currency. Only one of `flat_amount` and `flat_amount_decimal` can be set. Format: decimal string.
    * `unit_amount` - The per unit billing amount for each individual unit for which this tier applies.
    * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
    * `up_to` - Specifies the upper bound of this tier. The lower bound of a tier is the upper bound of the previous tier adding one. Use `inf` to define a fallback tier.
    """
    @type t :: %__MODULE__{
            flat_amount: integer() | nil,
            flat_amount_decimal: String.t() | nil,
            unit_amount: integer() | nil,
            unit_amount_decimal: String.t() | nil,
            up_to: map() | nil
          }
    defstruct [:flat_amount, :flat_amount_decimal, :unit_amount, :unit_amount_decimal, :up_to]
  end

  defmodule TransformQuantity do
    @moduledoc "Nested parameters."

    @typedoc """
    * `divide_by` - Divide usage by this number.
    * `round` - After division, either round the result `up` or `down`. Possible values: `down`, `up`.
    """
    @type t :: %__MODULE__{
            divide_by: integer() | nil,
            round: String.t() | nil
          }
    defstruct [:divide_by, :round]
  end
end
