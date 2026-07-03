# File generated from our OpenAPI spec
defmodule Stripe.Resources.NextActionMultibancoDisplayDetails do
  @moduledoc """
  PaymentIntentNextActionDisplayMultibancoDetails
  """

  @typedoc """
  * `entity` - Entity number associated with this Multibanco payment. Max length: 5000. Nullable.
  * `expires_at` - The timestamp at which the Multibanco voucher expires. Format: Unix timestamp. Nullable.
  * `hosted_voucher_url` - The URL for the hosted Multibanco voucher page, which allows customers to view a Multibanco voucher. Max length: 5000. Nullable.
  * `reference` - Reference number associated with this Multibanco payment. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:entity, :expires_at, :hosted_voucher_url, :reference]

  @object_name "payment_intent_next_action_display_multibanco_details"
  def object_name, do: @object_name
end
