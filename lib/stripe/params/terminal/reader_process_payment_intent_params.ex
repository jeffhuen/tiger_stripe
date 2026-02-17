# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderProcessPaymentIntentParams do
  @moduledoc "Parameters for reader process payment intent."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_intent` - The ID of the PaymentIntent to process on the reader. Max length: 5000.
  * `process_config` - Configuration overrides for this transaction, such as tipping and customer cancellation settings.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          payment_intent: String.t(),
          process_config: __MODULE__.ProcessConfig.t() | nil
        }

  defstruct [:expand, :payment_intent, :process_config]

  defmodule ProcessConfig do
    @moduledoc "Nested parameters."

    @typedoc """
    * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. Possible values: `always`, `limited`, `unspecified`.
    * `enable_customer_cancellation` - Enables cancel button on transaction screens.
    * `return_url` - The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme.
    * `skip_tipping` - Override showing a tipping selection screen on this transaction.
    * `tipping` - Tipping configuration for this transaction.
    """
    @type t :: %__MODULE__{
            allow_redisplay: String.t() | nil,
            enable_customer_cancellation: boolean() | nil,
            return_url: String.t() | nil,
            skip_tipping: boolean() | nil,
            tipping: __MODULE__.Tipping.t() | nil
          }
    defstruct [
      :allow_redisplay,
      :enable_customer_cancellation,
      :return_url,
      :skip_tipping,
      :tipping
    ]

    defmodule Tipping do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount_eligible` - Amount used to calculate tip suggestions on tipping selection screen for this transaction. Must be a positive integer in the smallest currency unit (e.g., 100 cents to represent $1.00 or 100 to represent ¥100, a zero-decimal currency).
      """
      @type t :: %__MODULE__{
              amount_eligible: integer() | nil
            }
      defstruct [:amount_eligible]
    end
  end
end
