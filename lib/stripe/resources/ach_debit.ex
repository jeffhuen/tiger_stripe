# File generated from our OpenAPI spec
defmodule Stripe.Resources.AchDebit do
  @moduledoc """
  AchDebit resource.
  """

  @typedoc """
  * `bank_name` - Nullable.
  * `country` - Nullable.
  * `fingerprint` - Nullable.
  * `last4` - Nullable.
  * `routing_number` - Nullable.
  * `type` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:bank_name, :country, :fingerprint, :last4, :routing_number, :type]

  @object_name "source_type_ach_debit"
  def object_name, do: @object_name
end
