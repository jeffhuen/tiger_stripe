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
  @type t :: %__MODULE__{}

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
end
