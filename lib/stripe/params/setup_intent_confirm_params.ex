# File generated from our OpenAPI spec
defmodule Stripe.Params.SetupIntentConfirmParams do
  @moduledoc "Parameters for setup intent confirm."

  @typedoc """
  * `confirmation_token` - ID of the ConfirmationToken used to confirm this SetupIntent.

  If the provided ConfirmationToken contains properties that are also being provided in this request, such as `payment_method`, then the values in this request will take precedence. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `mandate_data`
  * `payment_method` - ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this SetupIntent. Max length: 5000.
  * `payment_method_data` - When included, this hash creates a PaymentMethod that is set as the [`payment_method`](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-payment_method)
  value in the SetupIntent.
  * `payment_method_options` - Payment method-specific configuration for this SetupIntent.
  * `return_url` - The URL to redirect your customer back to after they authenticate on the payment method's app or site.
  If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme.
  This parameter is only used for cards and other redirect-based payment methods.
  * `use_stripe_sdk` - Set to `true` when confirming server-side and using Stripe.js, iOS, or Android client-side SDKs to handle the next actions.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :confirmation_token,
    :expand,
    :mandate_data,
    :payment_method,
    :payment_method_data,
    :payment_method_options,
    :return_url,
    :use_stripe_sdk
  ]
end
