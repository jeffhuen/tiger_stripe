# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentCaptureParams do
  @moduledoc "Parameters for payment intent capture."

  @typedoc """
  * `amount_details` - Provides industry-specific information about the amount.
  * `amount_to_capture` - The amount to capture from the PaymentIntent, which must be less than or equal to the original amount. Defaults to the full `amount_capturable` if it's not provided.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total amount captured. For more information, see the PaymentIntents [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `expand` - Specifies which fields in the response should be expanded.
  * `final_capture` - Defaults to `true`. When capturing a PaymentIntent, setting `final_capture` to `false` notifies Stripe to not release the remaining uncaptured funds to make sure that they're captured in future requests. You can only use this setting when [multicapture](https://docs.stripe.com/payments/multicapture) is available for PaymentIntents.
  * `hooks` - Automations to be run during the PaymentIntent lifecycle
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_details` - Provides industry-specific information about the charge.
  * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead. Max length: 22.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. Max length: 22.
  * `transfer_data` - The parameters that you can use to automatically create a transfer after the payment
  is captured. Learn more about the [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount_details,
    :amount_to_capture,
    :application_fee_amount,
    :expand,
    :final_capture,
    :hooks,
    :metadata,
    :payment_details,
    :statement_descriptor,
    :statement_descriptor_suffix,
    :transfer_data
  ]
end
