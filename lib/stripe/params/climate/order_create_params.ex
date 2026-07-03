# File generated from our OpenAPI spec
defmodule Stripe.Params.Climate.OrderCreateParams do
  @moduledoc "Parameters for order create."

  @typedoc """
  * `amount` - Requested amount of carbon removal units. Either this or `metric_tons` must be specified.
  * `beneficiary` - Publicly sharable reference for the end beneficiary of carbon removal. Assumed to be the Stripe account if not set.
  * `currency` - Request currency for the order as a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a supported [settlement currency for your account](https://stripe.com/docs/currencies). If omitted, the account's default currency will be used. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `metric_tons` - Requested number of tons for the order. Either this or `amount` must be specified. Format: decimal string.
  * `product` - Unique identifier of the Climate product. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :beneficiary, :currency, :expand, :metadata, :metric_tons, :product]
end
