# File generated from our OpenAPI spec
defmodule Stripe.Params.PromotionCodeCreateParams do
  @moduledoc "Parameters for promotion code create."

  @typedoc """
  * `active` - Whether the promotion code is currently active.
  * `code` - The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for a specific customer. Valid characters are lower case letters (a-z), upper case letters (A-Z), digits (0-9), and dashes (-).

  If left blank, we will generate one automatically. Max length: 500.
  * `customer` - The customer who can use this promotion code. If not set, all customers can use the promotion code. Max length: 5000.
  * `customer_account` - The account representing the customer who can use this promotion code. If not set, all customers can use the promotion code. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - The timestamp at which this promotion code will expire. If the coupon has specified a `redeems_by`, then this value cannot be after the coupon's `redeems_by`. Format: Unix timestamp.
  * `max_redemptions` - A positive integer specifying the number of times the promotion code can be redeemed. If the coupon has specified a `max_redemptions`, then this value cannot be greater than the coupon's `max_redemptions`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `promotion` - The promotion referenced by this promotion code.
  * `restrictions` - Settings that restrict the redemption of the promotion code.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :code,
    :customer,
    :customer_account,
    :expand,
    :expires_at,
    :max_redemptions,
    :metadata,
    :promotion,
    :restrictions
  ]
end
