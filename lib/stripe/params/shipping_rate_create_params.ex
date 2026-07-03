# File generated from our OpenAPI spec
defmodule Stripe.Params.ShippingRateCreateParams do
  @moduledoc "Parameters for shipping rate create."

  @typedoc """
  * `delivery_estimate` - The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions.
  * `display_name` - The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions. Max length: 100.
  * `expand` - Specifies which fields in the response should be expanded.
  * `fixed_amount` - Describes a fixed amount to charge for shipping. Must be present if type is `fixed_amount`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. The Shipping tax code is `txcd_92010001`.
  * `type` - The type of calculation to use on the shipping rate. Possible values: `fixed_amount`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :delivery_estimate,
    :display_name,
    :expand,
    :fixed_amount,
    :metadata,
    :tax_behavior,
    :tax_code,
    :type
  ]
end
