# File generated from our OpenAPI spec
defmodule Stripe.Resources.Scalapay do
  @moduledoc """
  payment_method_details_scalapay
  """

  @typedoc """
  * `transaction_id` - The Scalapay transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:transaction_id]

  @object_name "payment_method_details_scalapay"
  def object_name, do: @object_name
end
