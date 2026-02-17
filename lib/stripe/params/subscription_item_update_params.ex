# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionItemUpdateParams do
  @moduledoc "Parameters for subscription item update."

  @typedoc """
  * `billing_thresholds` - Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
  * `discounts` - The coupons to redeem into discounts for the subscription item.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `off_session` - Indicates if a customer is on or off-session while an invoice payment is attempted. Defaults to `false` (on-session).
  * `payment_behavior` - Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://docs.stripe.com/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.

  Use `default_incomplete` to transition the subscription to `status=past_due` when payment is required and await explicit confirmation of the invoice's payment intent. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://docs.stripe.com/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method.

  Use `pending_if_incomplete` to update the subscription using [pending updates](https://docs.stripe.com/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://docs.stripe.com/billing/pending-updates-reference#supported-attributes).

  Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://docs.stripe.com/changelog/2019-03-14) to learn more. Possible values: `allow_incomplete`, `default_incomplete`, `error_if_incomplete`, `pending_if_incomplete`.
  * `plan` - The identifier of the new plan for this subscription item. Max length: 5000.
  * `price` - The ID of the price object. One of `price` or `price_data` is required. When changing a subscription item's price, `quantity` is set to 1 unless a `quantity` parameter is provided. Max length: 5000.
  * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required.
  * `proration_behavior` - Determines how to handle [prorations](https://docs.stripe.com/billing/subscriptions/prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. The default value is `create_prorations`. Possible values: `always_invoice`, `create_prorations`, `none`.
  * `proration_date` - If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply the same proration that was previewed with the [upcoming invoice](https://api.stripe.com#retrieve_customer_invoice) endpoint. Format: Unix timestamp.
  * `quantity` - The quantity you'd like to apply to the subscription item you're creating.
  * `tax_rates` - A list of [Tax Rate](https://docs.stripe.com/api/tax_rates) ids. These Tax Rates will override the [`default_tax_rates`](https://docs.stripe.com/api/subscriptions/create#create_subscription-default_tax_rates) on the Subscription. When updating, pass an empty string to remove previously-defined tax rates.
  """
  @type t :: %__MODULE__{
          billing_thresholds: map() | nil,
          discounts: map() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          off_session: boolean() | nil,
          payment_behavior: String.t() | nil,
          plan: String.t() | nil,
          price: String.t() | nil,
          price_data: __MODULE__.PriceData.t() | nil,
          proration_behavior: String.t() | nil,
          proration_date: integer() | nil,
          quantity: integer() | nil,
          tax_rates: map() | nil
        }

  defstruct [
    :billing_thresholds,
    :discounts,
    :expand,
    :metadata,
    :off_session,
    :payment_behavior,
    :plan,
    :price,
    :price_data,
    :proration_behavior,
    :proration_date,
    :quantity,
    :tax_rates
  ]

  defmodule PriceData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. Max length: 5000.
    * `recurring` - The recurring components of a price such as `interval` and `interval_count`.
    * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
    * `unit_amount` - A positive integer in cents (or local equivalent) (or 0 for a free price) representing how much to charge.
    * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
    """
    @type t :: %__MODULE__{
            currency: String.t() | nil,
            product: String.t() | nil,
            recurring: __MODULE__.Recurring.t() | nil,
            tax_behavior: String.t() | nil,
            unit_amount: integer() | nil,
            unit_amount_decimal: String.t() | nil
          }
    defstruct [:currency, :product, :recurring, :tax_behavior, :unit_amount, :unit_amount_decimal]

    defmodule Recurring do
      @moduledoc "Nested parameters."

      @typedoc """
      * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
      * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
      """
      @type t :: %__MODULE__{
              interval: String.t() | nil,
              interval_count: integer() | nil
            }
      defstruct [:interval, :interval_count]
    end
  end
end
