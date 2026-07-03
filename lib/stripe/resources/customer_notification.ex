# File generated from our OpenAPI spec
defmodule Stripe.Resources.CustomerNotification do
  @moduledoc """
  PaymentIntentProcessingCustomerNotification
  """

  @typedoc """
  * `approval_requested` - Whether customer approval has been requested for this payment. For payments greater than INR 15000 or mandate amount, the customer must provide explicit approval of the payment with their bank. Nullable.
  * `completes_at` - If customer approval is required, they need to provide approval before this time. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:approval_requested, :completes_at]

  @object_name "payment_intent_processing_customer_notification"
  def object_name, do: @object_name
end
