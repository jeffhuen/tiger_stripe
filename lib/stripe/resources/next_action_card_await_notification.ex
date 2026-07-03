# File generated from our OpenAPI spec
defmodule Stripe.Resources.NextActionCardAwaitNotification do
  @moduledoc """
  PaymentIntentNextActionCardAwaitNotification
  """

  @typedoc """
  * `charge_attempt_at` - The time that payment will be attempted. If customer approval is required, they need to provide approval before this time. Format: Unix timestamp. Nullable.
  * `customer_approval_required` - For payments greater than INR 15000, the customer must provide explicit approval of the payment with their bank. For payments of lower amount, no customer action is required. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:charge_attempt_at, :customer_approval_required]

  @object_name "payment_intent_next_action_card_await_notification"
  def object_name, do: @object_name
end
