# File generated from our OpenAPI spec
defmodule Stripe.Resources.Coupon do
  @moduledoc """
  Coupon

  A coupon contains information about a percent-off or amount-off discount you
  might want to apply to a customer. Coupons may be applied to [subscriptions](https://api.stripe.com#subscriptions), [invoices](https://api.stripe.com#invoices),
  [checkout sessions](https://docs.stripe.com/api/checkout/sessions), [quotes](https://api.stripe.com#quotes), and more. Coupons do not work with conventional one-off [charges](https://docs.stripe.com/api/charges/create) or [payment intents](https://docs.stripe.com/api/payment_intents).
  """

  @typedoc """
  * `amount_off` - Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for this customer. Nullable.
  * `applies_to` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - If `amount_off` has been set, the three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the amount to take off. Format: ISO 4217 currency code. Nullable.
  * `currency_options` - Coupons defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies). Expandable.
  * `duration` - One of `forever`, `once`, or `repeating`. Describes how long a customer who applies this coupon will get the discount. Possible values: `forever`, `once`, `repeating`.
  * `duration_in_months` - If `duration` is `repeating`, the number of months the coupon applies. Null if coupon `duration` is `forever` or `once`. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `max_redemptions` - Maximum number of times this coupon can be redeemed, in total, across all customers, before it is no longer valid. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `name` - Name of the coupon displayed to customers on for instance invoices or receipts. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `coupon`.
  * `percent_off` - Percent that will be taken off the subtotal of any invoices for this customer for the duration of the coupon. For example, a coupon with percent_off of 50 will make a $ (or local equivalent)100 invoice $ (or local equivalent)50 instead. Nullable.
  * `redeem_by` - Date after which the coupon can no longer be redeemed. Format: Unix timestamp. Nullable.
  * `times_redeemed` - Number of times this coupon has been applied to a customer.
  * `valid` - Taking account of the above properties, whether this coupon can still be applied to a customer.
  """
  @type t :: %__MODULE__{
          amount_off: integer(),
          applies_to: __MODULE__.AppliesTo.t() | nil,
          created: integer(),
          currency: String.t(),
          currency_options: %{String.t() => __MODULE__.CurrencyOptions.t()} | nil,
          duration: String.t(),
          duration_in_months: integer(),
          id: String.t(),
          livemode: boolean(),
          max_redemptions: integer(),
          metadata: %{String.t() => String.t()},
          name: String.t(),
          object: String.t(),
          percent_off: float(),
          redeem_by: integer(),
          times_redeemed: integer(),
          valid: boolean()
        }

  defstruct [
    :amount_off,
    :applies_to,
    :created,
    :currency,
    :currency_options,
    :duration,
    :duration_in_months,
    :id,
    :livemode,
    :max_redemptions,
    :metadata,
    :name,
    :object,
    :percent_off,
    :redeem_by,
    :times_redeemed,
    :valid
  ]

  @object_name "coupon"
  def object_name, do: @object_name

  def expandable_fields, do: ["applies_to", "currency_options"]

  defmodule AppliesTo do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `products` - A list of product IDs this coupon applies to
    """
    @type t :: %__MODULE__{
            products: [String.t()] | nil
          }
    defstruct [:products]
  end

  defmodule CurrencyOptions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount_off` - Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for this customer.
    """
    @type t :: %__MODULE__{
            amount_off: integer() | nil
          }
    defstruct [:amount_off]
  end

  def __inner_types__ do
    %{
      "applies_to" => __MODULE__.AppliesTo,
      "currency_options" => __MODULE__.CurrencyOptions
    }
  end
end
