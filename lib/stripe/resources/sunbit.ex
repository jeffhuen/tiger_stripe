# File generated from our OpenAPI spec
defmodule Stripe.Resources.Sunbit do
  @moduledoc """
  payment_method_details_payment_record_sunbit
  """

  @typedoc """
  * `transaction_id` - The Sunbit transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:transaction_id]

  @object_name "payment_method_details_payment_record_sunbit"
  def object_name, do: @object_name
end
