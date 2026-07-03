# File generated from our OpenAPI spec
defmodule Stripe.Resources.Payco do
  @moduledoc """
  payment_method_details_payco
  """

  @typedoc """
  * `buyer_id` - A unique identifier for the buyer as determined by the local payment processor. Max length: 5000. Nullable.
  * `transaction_id` - The Payco transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:buyer_id, :transaction_id]

  @object_name "payment_method_details_payco"
  def object_name, do: @object_name
end
