# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.ConfirmationTokenCreateParams do
  @moduledoc "Parameters for confirmation token create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_method` - ID of an existing PaymentMethod. Max length: 5000.
  * `payment_method_data` - If provided, this hash will be used to create a PaymentMethod.
  * `payment_method_options` - Payment-method-specific configuration for this ConfirmationToken.
  * `return_url` - Return URL used to confirm the Intent.
  * `setup_future_usage` - Indicates that you intend to make future payments with this ConfirmationToken's payment method.

  The presence of this property will [attach the payment method](https://docs.stripe.com/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. Possible values: `off_session`, `on_session`.
  * `shipping` - Shipping information for this ConfirmationToken.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :expand,
    :payment_method,
    :payment_method_data,
    :payment_method_options,
    :return_url,
    :setup_future_usage,
    :shipping
  ]
end
