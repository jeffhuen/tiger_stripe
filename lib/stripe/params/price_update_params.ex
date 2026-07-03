# File generated from our OpenAPI spec
defmodule Stripe.Params.PriceUpdateParams do
  @moduledoc "Parameters for price update."

  @typedoc """
  * `active` - Whether the price can be used for new purchases. Defaults to `true`.
  * `currency_options` - Prices defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
  * `expand` - Specifies which fields in the response should be expanded.
  * `lookup_key` - A lookup key used to retrieve prices dynamically from a static string. This may be up to 200 characters. Max length: 200.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `nickname` - A brief description of the price, hidden from customers. Max length: 5000.
  * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `transfer_lookup_key` - If set to true, will atomically remove the lookup key from the existing price, and assign it to this price.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :currency_options,
    :expand,
    :lookup_key,
    :metadata,
    :nickname,
    :tax_behavior,
    :transfer_lookup_key
  ]
end
