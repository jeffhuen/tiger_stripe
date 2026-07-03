# File generated from our OpenAPI spec
defmodule Stripe.Resources.Offline do
  @moduledoc """
  payment_method_details_card_present_offline
  """

  @typedoc """
  * `stored_at` - Time at which the payment was collected while offline Format: Unix timestamp. Nullable.
  * `type` - The method used to process this payment method offline. Only deferred is allowed. Possible values: `deferred`. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:stored_at, :type]

  @object_name "payment_method_details_card_present_offline"
  def object_name, do: @object_name
end
