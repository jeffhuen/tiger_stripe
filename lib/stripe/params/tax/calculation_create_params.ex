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
  * `tax_date` - The calculation uses the tax rules and rates that are in effect at this timestamp. You can use a date up to 31 days in the past or up to 31 days in the future. If you use a future date, Stripe doesn't guarantee that the expected tax rules and rate being used match the actual rules and rate that will be in effect on that date. We deploy tax changes before their effective date, but not within a fixed window.
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
