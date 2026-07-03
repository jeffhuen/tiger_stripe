# File generated from our OpenAPI spec
defmodule Stripe.Resources.SepaDebit do
  @moduledoc """
  SepaDebit resource.
  """

  @typedoc """
  * `bank_code` - Nullable.
  * `branch_code` - Nullable.
  * `country` - Nullable.
  * `fingerprint` - Nullable.
  * `last4` - Nullable.
  * `mandate_reference` - Nullable.
  * `mandate_url` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :bank_code,
    :branch_code,
    :country,
    :fingerprint,
    :last4,
    :mandate_reference,
    :mandate_url
  ]

  @object_name "source_type_sepa_debit"
  def object_name, do: @object_name
end
