# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderProcessSetupIntentParams do
  @moduledoc "Parameters for reader process setup intent."

  @typedoc """
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. Possible values: `always`, `limited`, `unspecified`.
  * `expand` - Specifies which fields in the response should be expanded.
  * `process_config` - Configuration overrides for this setup, such as MOTO and customer cancellation settings.
  * `setup_intent` - The ID of the SetupIntent to process on the reader. Max length: 5000.
  """
  @type t :: %__MODULE__{
          allow_redisplay: String.t(),
          expand: [String.t()] | nil,
          process_config: process_config() | nil,
          setup_intent: String.t()
        }

  defstruct [:allow_redisplay, :expand, :process_config, :setup_intent]

  @typedoc """
  * `enable_customer_cancellation` - Enables cancel button on transaction screens.
  """
  @type process_config :: %{
          optional(:enable_customer_cancellation) => boolean() | nil,
          optional(String.t()) => term()
        }
end
