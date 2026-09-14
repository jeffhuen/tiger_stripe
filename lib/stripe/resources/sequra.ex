# File generated from our OpenAPI spec
defmodule Stripe.Resources.Sequra do
  @moduledoc """
  payment_method_details_payment_record_sequra
  """

  @typedoc """
  * `transaction_id` - The SeQura transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:transaction_id]

  @object_name "payment_method_details_payment_record_sequra"
  def object_name, do: @object_name
end
