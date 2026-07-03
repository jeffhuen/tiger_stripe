# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentIncrementAuthorizationParams do
  @moduledoc "Parameters for payment intent increment authorization."

  @typedoc """
  * `amount` - The updated total amount that you intend to collect from the cardholder. This amount must be greater than the currently authorized amount.
  * `amount_details` - Provides industry-specific information about the amount.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total amount captured. For more information, see the PaymentIntents [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `hooks` - Automations to be run during the PaymentIntent lifecycle
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_details` - Provides industry-specific information about the charge.
  * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card or card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors). Max length: 22.
  * `transfer_data` - The parameters used to automatically create a transfer after the payment is captured.
  Learn more about the [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_details,
    :application_fee_amount,
    :description,
    :expand,
    :hooks,
    :metadata,
    :payment_details,
    :statement_descriptor,
    :transfer_data
  ]
end
