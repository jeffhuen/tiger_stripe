# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentMethodUpdateParams do
  @moduledoc "Parameters for payment method update."

  @typedoc """
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to `unspecified`. Possible values: `always`, `limited`, `unspecified`.
  * `billing_details` - Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
  * `card` - If this is a `card` PaymentMethod, this hash contains the user's card details.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payto` - If this is a `payto` PaymentMethod, this hash contains details about the PayTo payment method.
  * `us_bank_account` - If this is an `us_bank_account` PaymentMethod, this hash contains details about the US bank account payment method.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :allow_redisplay,
    :billing_details,
    :card,
    :expand,
    :metadata,
    :payto,
    :us_bank_account
  ]
end
