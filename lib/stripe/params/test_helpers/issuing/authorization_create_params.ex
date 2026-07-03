# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.AuthorizationCreateParams do
  @moduledoc "Parameters for authorization create."

  @typedoc """
  * `amount` - The total amount to attempt to authorize. This amount is in the provided currency, or defaults to the card's currency, and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `amount_details` - Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `authorization_method` - How the card details were provided. Defaults to online. Possible values: `chip`, `contactless`, `keyed_in`, `online`, `swipe`.
  * `card` - Card associated with this authorization. Max length: 5000.
  * `currency` - The currency of the authorization. If not provided, defaults to the currency of the card. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `expand` - Specifies which fields in the response should be expanded.
  * `fleet` - Fleet-specific information for authorizations using Fleet cards.
  * `fraud_disputability_likelihood` - Probability that this transaction can be disputed in the event of fraud. Assessed by comparing the characteristics of the authorization to card network rules. Possible values: `neutral`, `unknown`, `very_likely`, `very_unlikely`.
  * `fuel` - Information about fuel that was purchased with this transaction.
  * `is_amount_controllable` - If set `true`, you may provide [amount](https://docs.stripe.com/api/issuing/authorizations/approve#approve_issuing_authorization-amount) to control how much to hold for the authorization.
  * `merchant_amount` - The total amount to attempt to authorize. This amount is in the provided merchant currency, and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `merchant_currency` - The currency of the authorization. If not provided, defaults to the currency of the card. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `merchant_data` - Details about the seller (grocery store, e-commerce website, etc.) where the card authorization happened.
  * `network_data` - Details about the authorization, such as identifiers, set by the card network.
  * `risk_assessment` - Stripe’s assessment of the fraud risk for this authorization.
  * `verification_data` - Verifications that Stripe performed on information that the cardholder provided to the merchant.
  * `wallet` - The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or `samsung_pay`. Will populate as `null` when no digital wallet was utilized. Possible values: `apple_pay`, `google_pay`, `samsung_pay`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_details,
    :authorization_method,
    :card,
    :currency,
    :expand,
    :fleet,
    :fraud_disputability_likelihood,
    :fuel,
    :is_amount_controllable,
    :merchant_amount,
    :merchant_currency,
    :merchant_data,
    :network_data,
    :risk_assessment,
    :verification_data,
    :wallet
  ]
end
