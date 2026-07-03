# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.CalculationCreateParams do
  @moduledoc "Parameters for calculation create."

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - The ID of an existing customer to use for this calculation. If provided, the customer's address and tax IDs are copied to `customer_details`. Max length: 5000.
  * `customer_details` - Details about the customer, including address and tax IDs.
  * `expand` - Specifies which fields in the response should be expanded.
  * `line_items` - A list of items the customer is purchasing.
  * `ship_from_details` - Details about the address from which the goods are being shipped.
  * `shipping_cost` - Shipping cost details to be used for the calculation.
  * `tax_date` - Timestamp of date at which the tax rules and rates in effect applies for the calculation. Measured in seconds since the Unix epoch. Can be up to 48 hours in the past, and up to 48 hours in the future.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :currency,
    :customer,
    :customer_details,
    :expand,
    :line_items,
    :ship_from_details,
    :shipping_cost,
    :tax_date
  ]
end
