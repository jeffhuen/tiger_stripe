# File generated from our OpenAPI spec
defmodule Stripe.Params.CouponCreateParams do
  @moduledoc "Parameters for coupon create."

  @typedoc """
  * `amount_off` - A positive integer representing the amount to subtract from an invoice total (required if `percent_off` is not passed).
  * `applies_to` - A hash containing directions for what this Coupon will apply discounts to.
  * `currency` - Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the `amount_off` parameter (required if `amount_off` is passed). Format: ISO 4217 currency code.
  * `currency_options` - Coupons defined in each available currency option (only supported if `amount_off` is passed). Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
  * `duration` - Specifies how long the discount will be in effect if used on a subscription. Defaults to `once`. Possible values: `forever`, `once`, `repeating`.
  * `duration_in_months` - Required only if `duration` is `repeating`, in which case it must be a positive integer that specifies the number of months the discount will be in effect.
  * `expand` - Specifies which fields in the response should be expanded.
  * `id` - Unique string of your choice that will be used to identify this coupon when applying it to a customer. If you don't want to specify a particular code, you can leave the ID blank and we'll generate a random code for you. Max length: 5000.
  * `max_redemptions` - A positive integer specifying the number of times the coupon can be redeemed before it's no longer valid. For example, you might have a 50% off coupon that the first 20 readers of your blog can use.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - Name of the coupon displayed to customers on, for instance invoices, or receipts. By default the `id` is shown if `name` is not set. Max length: 40.
  * `percent_off` - A positive float larger than 0, and smaller or equal to 100, that represents the discount the coupon will apply (required if `amount_off` is not passed).
  * `redeem_by` - Unix timestamp specifying the last time at which the coupon can be redeemed (cannot be set to more than 5 years in the future). After the redeem_by date, the coupon can no longer be applied to new customers. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{
          amount_off: integer() | nil,
          applies_to: applies_to() | nil,
          currency: String.t() | nil,
          currency_options: %{String.t() => currency_options()} | nil,
          duration: String.t() | nil,
          duration_in_months: integer() | nil,
          expand: [String.t()] | nil,
          id: String.t() | nil,
          max_redemptions: integer() | nil,
          metadata: map() | nil,
          name: String.t() | nil,
          percent_off: float() | nil,
          redeem_by: integer() | nil
        }

  defstruct [
    :amount_off,
    :applies_to,
    :currency,
    :currency_options,
    :duration,
    :duration_in_months,
    :expand,
    :id,
    :max_redemptions,
    :metadata,
    :name,
    :percent_off,
    :redeem_by
  ]

  @typedoc """
  * `products` - An array of Product IDs that this Coupon will apply to.
  """
  @type applies_to :: %{
          optional(:products) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_off` - A positive integer representing the amount to subtract from an invoice total.
  """
  @type currency_options :: %{
          optional(:amount_off) => integer() | nil,
          optional(String.t()) => term()
        }
end
