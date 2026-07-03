# File generated from our OpenAPI spec
defmodule Stripe.Resources.Sofort do
  @moduledoc """
  Sofort resource.
  """

  @typedoc """
  * `bank_code` - Nullable.
  * `bank_name` - Nullable.
  * `bic` - Nullable.
  * `country` - Nullable.
  * `iban_last4` - Nullable.
  * `preferred_language` - Nullable.
  * `statement_descriptor` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :bank_code,
    :bank_name,
    :bic,
    :country,
    :iban_last4,
    :preferred_language,
    :statement_descriptor
  ]

  @object_name "source_type_sofort"
  def object_name, do: @object_name
end
