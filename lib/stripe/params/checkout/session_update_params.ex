# File generated from our OpenAPI spec
defmodule Stripe.Params.Checkout.SessionUpdateParams do
  @moduledoc "Parameters for session update."

  @typedoc """
  * `collected_information` - Information about the customer collected within the Checkout Session. Can only be set when updating `embedded` or `custom` sessions.
  * `expand` - Specifies which fields in the response should be expanded.
  * `line_items` - A list of items the customer is purchasing.

  When updating line items, you must retransmit the entire array of line items.

  To retain an existing line item, specify its `id`.

  To update an existing line item, specify its `id` along with the new values of the fields to update.

  To add a new line item, specify one of `price` or `price_data` and `quantity`.

  To remove an existing line item, omit the line item's ID from the retransmitted array.

  To reorder a line item, specify it at the desired position in the retransmitted array.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `shipping_options` - The shipping rate options to apply to this Session. Up to a maximum of 5.
  """
  @type t :: %__MODULE__{
          collected_information: collected_information() | nil,
          expand: [String.t()] | nil,
          line_items: [line_items()] | nil,
          metadata: map() | nil,
          shipping_options: map() | nil
        }

  defstruct [:collected_information, :expand, :line_items, :metadata, :shipping_options]

  @typedoc """
  * `shipping_details` - The shipping details to apply to this Session.
  """
  @type collected_information :: %{
          optional(:shipping_details) => collected_information_shipping_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The address of the customer
  * `name` - The name of customer Max length: 255.
  """
  @type collected_information_shipping_details :: %{
          optional(:address) => collected_information_shipping_details_address() | nil,
          optional(:name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type collected_information_shipping_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `adjustable_quantity` - When set, provides configuration for this item’s quantity to be adjusted by the customer during Checkout.
  * `id` - ID of an existing line item. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `price` - The ID of the [Price](https://docs.stripe.com/api/prices). One of `price` or `price_data` is required when creating a new line item. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required when creating a new line item.
  * `quantity` - The quantity of the line item being purchased. Quantity should not be defined when `recurring.usage_type=metered`.
  * `tax_rates` - The [tax rates](https://docs.stripe.com/api/tax_rates) which apply to this line item.
  """
  @type line_items :: %{
          optional(:adjustable_quantity) => line_items_adjustable_quantity() | nil,
          optional(:id) => String.t() | nil,
          optional(:metadata) => map() | nil,
          optional(:price) => String.t() | nil,
          optional(:price_data) => line_items_price_data() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_rates) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Set to true if the quantity can be adjusted to any positive integer. Setting to false will remove any previously specified constraints on quantity.
  * `maximum` - The maximum quantity the customer can purchase for the Checkout Session. By default this value is 99. You can specify a value up to 999999.
  * `minimum` - The minimum quantity the customer must purchase for the Checkout Session. By default this value is 0.
  """
  @type line_items_adjustable_quantity :: %{
          optional(:enabled) => boolean() | nil,
          optional(:maximum) => integer() | nil,
          optional(:minimum) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. One of `product` or `product_data` is required. Max length: 5000.
  * `product_data` - Data used to generate a new [Product](https://docs.stripe.com/api/products) object inline. One of `product` or `product_data` is required.
  * `recurring` - The recurring components of a price such as `interval` and `interval_count`.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `unit_amount` - A non-negative integer in cents (or local equivalent) representing how much to charge. One of `unit_amount` or `unit_amount_decimal` is required.
  * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
  """
  @type line_items_price_data :: %{
          optional(:currency) => String.t() | nil,
          optional(:product) => String.t() | nil,
          optional(:product_data) => line_items_price_data_product_data() | nil,
          optional(:recurring) => line_items_price_data_recurring() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:unit_amount) => integer() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `description` - The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes. Max length: 40000.
  * `images` - A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The product's name, meant to be displayable to the customer. Max length: 5000.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. Max length: 5000.
  * `unit_label` - A label that represents units of this product. When set, this will be included in customers' receipts, invoices, Checkout, and the customer portal. Max length: 12.
  """
  @type line_items_price_data_product_data :: %{
          optional(:description) => String.t() | nil,
          optional(:images) => [String.t()] | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:name) => String.t() | nil,
          optional(:tax_code) => String.t() | nil,
          optional(:unit_label) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
  * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
  """
  @type line_items_price_data_recurring :: %{
          optional(:interval) => String.t() | nil,
          optional(:interval_count) => integer() | nil,
          optional(String.t()) => term()
        }
end
