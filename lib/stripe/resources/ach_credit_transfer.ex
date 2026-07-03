# File generated from our OpenAPI spec
defmodule Stripe.Resources.AchCreditTransfer do
  @moduledoc """
  AchCreditTransfer resource.
  """

  @typedoc """
  * `account_number` - Nullable.
  * `bank_name` - Nullable.
  * `fingerprint` - Nullable.
  * `refund_account_holder_name` - Nullable.
  * `refund_account_holder_type` - Nullable.
  * `refund_routing_number` - Nullable.
  * `routing_number` - Nullable.
  * `swift_code` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :account_number,
    :bank_name,
    :fingerprint,
    :refund_account_holder_name,
    :refund_account_holder_type,
    :refund_routing_number,
    :routing_number,
    :swift_code
  ]

  @object_name "source_type_ach_credit_transfer"
  def object_name, do: @object_name
end
