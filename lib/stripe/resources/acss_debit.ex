# File generated from our OpenAPI spec
defmodule Stripe.Resources.AcssDebit do
  @moduledoc """
  AcssDebit resource.
  """

  @typedoc """
  * `bank_address_city` - Nullable.
  * `bank_address_line_1` - Nullable.
  * `bank_address_line_2` - Nullable.
  * `bank_address_postal_code` - Nullable.
  * `bank_name` - Nullable.
  * `category` - Nullable.
  * `country` - Nullable.
  * `fingerprint` - Nullable.
  * `last4` - Nullable.
  * `routing_number` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :bank_address_city,
    :bank_address_line_1,
    :bank_address_line_2,
    :bank_address_postal_code,
    :bank_name,
    :category,
    :country,
    :fingerprint,
    :last4,
    :routing_number
  ]

  @object_name "source_type_acss_debit"
  def object_name, do: @object_name
end
