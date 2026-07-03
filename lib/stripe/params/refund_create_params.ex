# File generated from our OpenAPI spec
defmodule Stripe.Params.RefundCreateParams do
  @moduledoc "Parameters for refund create."

  @typedoc """
  * `amount`
  * `charge` - The identifier of the charge to refund. Max length: 5000.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - Customer whose customer balance to refund from. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `instructions_email` - For payment methods without native refund support (e.g., Konbini, PromptPay), use this email from the customer to receive refund instructions.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `origin` - Origin of the refund Possible values: `customer_balance`.
  * `payment_intent` - The identifier of the PaymentIntent to refund. Max length: 5000.
  * `reason` - String indicating the reason for the refund. If set, possible values are `duplicate`, `fraudulent`, and `requested_by_customer`. If you believe the charge to be fraudulent, specifying `fraudulent` as the reason will add the associated card and email to your [block lists](https://docs.stripe.com/radar/lists), and will also help us improve our fraud detection algorithms. Possible values: `duplicate`, `fraudulent`, `requested_by_customer`. Max length: 5000.
  * `refund_application_fee` - Boolean indicating whether the application fee should be refunded when refunding this charge. If a full charge refund is given, the full application fee will be refunded. Otherwise, the application fee will be refunded in an amount proportional to the amount of the charge refunded. An application fee can be refunded only by the application that created the charge.
  * `reverse_transfer` - Boolean indicating whether the transfer should be reversed when refunding this charge. The transfer will be reversed proportionally to the amount being refunded (either the entire or partial amount).

  A transfer can be reversed only by the application that created the charge.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :charge,
    :currency,
    :customer,
    :expand,
    :instructions_email,
    :metadata,
    :origin,
    :payment_intent,
    :reason,
    :refund_application_fee,
    :reverse_transfer
  ]
end
