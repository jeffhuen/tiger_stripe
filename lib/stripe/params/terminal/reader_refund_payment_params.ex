# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ReaderRefundPaymentParams do
  @moduledoc "Parameters for reader refund payment."

  @typedoc """
  * `amount` - A positive integer in __cents__ representing how much of this charge to refund.
  * `charge` - ID of the Charge to refund. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_intent` - ID of the PaymentIntent to refund. Max length: 5000.
  * `refund_application_fee` - Boolean indicating whether the application fee should be refunded when refunding this charge. If a full charge refund is given, the full application fee will be refunded. Otherwise, the application fee will be refunded in an amount proportional to the amount of the charge refunded. An application fee can be refunded only by the application that created the charge.
  * `refund_payment_config` - Configuration overrides for this refund, such as customer cancellation settings.
  * `reverse_transfer` - Boolean indicating whether the transfer should be reversed when refunding this charge. The transfer will be reversed proportionally to the amount being refunded (either the entire or partial amount). A transfer can be reversed only by the application that created the charge.
  """
  @type t :: %__MODULE__{
          amount: integer() | nil,
          charge: String.t() | nil,
          expand: [String.t()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          payment_intent: String.t() | nil,
          refund_application_fee: boolean() | nil,
          refund_payment_config: refund_payment_config() | nil,
          reverse_transfer: boolean() | nil
        }

  defstruct [
    :amount,
    :charge,
    :expand,
    :metadata,
    :payment_intent,
    :refund_application_fee,
    :refund_payment_config,
    :reverse_transfer
  ]

  @typedoc """
  * `enable_customer_cancellation` - Enables cancel button on transaction screens.
  """
  @type refund_payment_config :: %{
          optional(:enable_customer_cancellation) => boolean() | nil,
          optional(String.t()) => term()
        }
end
