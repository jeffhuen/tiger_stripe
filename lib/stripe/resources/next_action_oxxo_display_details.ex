# File generated from our OpenAPI spec
defmodule Stripe.Resources.NextActionOxxoDisplayDetails do
  @moduledoc """
  PaymentIntentNextActionDisplayOxxoDetails
  """

  @typedoc """
  * `expires_after` - The timestamp after which the OXXO voucher expires. Format: Unix timestamp. Nullable.
  * `hosted_voucher_url` - The URL for the hosted OXXO voucher page, which allows customers to view and print an OXXO voucher. Max length: 5000. Nullable.
  * `number` - OXXO reference number. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:expires_after, :hosted_voucher_url, :number]

  @object_name "payment_intent_next_action_display_oxxo_details"
  def object_name, do: @object_name
end
