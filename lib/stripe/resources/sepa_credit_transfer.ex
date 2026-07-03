# File generated from our OpenAPI spec
defmodule Stripe.Resources.SepaCreditTransfer do
  @moduledoc """
  SepaCreditTransfer resource.
  """

  @typedoc """
  * `bank_name` - Nullable.
  * `bic` - Nullable.
  * `iban` - Nullable.
  * `refund_account_holder_address_city` - Nullable.
  * `refund_account_holder_address_country` - Nullable.
  * `refund_account_holder_address_line1` - Nullable.
  * `refund_account_holder_address_line2` - Nullable.
  * `refund_account_holder_address_postal_code` - Nullable.
  * `refund_account_holder_address_state` - Nullable.
  * `refund_account_holder_name` - Nullable.
  * `refund_iban` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :bank_name,
    :bic,
    :iban,
    :refund_account_holder_address_city,
    :refund_account_holder_address_country,
    :refund_account_holder_address_line1,
    :refund_account_holder_address_line2,
    :refund_account_holder_address_postal_code,
    :refund_account_holder_address_state,
    :refund_account_holder_name,
    :refund_iban
  ]

  @object_name "source_type_sepa_credit_transfer"
  def object_name, do: @object_name
end
