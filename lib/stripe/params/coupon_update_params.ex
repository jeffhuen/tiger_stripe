# File generated from our OpenAPI spec
defmodule Stripe.Params.CouponUpdateParams do
  @moduledoc "Parameters for coupon update."

  @typedoc """
  * `currency_options` - Coupons defined in each available currency option (only supported if the coupon is amount-based). Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - Name of the coupon displayed to customers on, for instance invoices, or receipts. By default the `id` is shown if `name` is not set. Max length: 40.
  """
  @type t :: %__MODULE__{}

  defstruct [:currency_options, :expand, :metadata, :name]
end
