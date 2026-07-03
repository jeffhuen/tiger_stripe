# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceAttachPaymentParams do
  @moduledoc "Parameters for invoice attach payment."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_intent` - The ID of the PaymentIntent to attach to the invoice. Max length: 5000.
  * `payment_record` - The ID of the PaymentRecord to attach to the invoice. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :payment_intent, :payment_record]
end
