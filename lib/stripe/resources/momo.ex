# File generated from our OpenAPI spec
defmodule Stripe.Resources.Momo do
  @moduledoc """
  payment_method_details_payment_record_momo
  """

  @typedoc """
  * `fingerprint` - Uniquely identifies this particular MoMo account. You can use this attribute to check whether two MoMo accounts are the same. Max length: 5000. Nullable.
  * `mandate` - ID of the multi-use Mandate created by, or used to make, this MoMo payment. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:fingerprint, :mandate]

  @object_name "payment_method_details_payment_record_momo"
  def object_name, do: @object_name
end
