# File generated from our OpenAPI spec
defmodule Stripe.Resources.Ideal do
  @moduledoc """
  Ideal resource.
  """

  @typedoc """
  * `bank` - Nullable.
  * `bic` - Nullable.
  * `iban_last4` - Nullable.
  * `statement_descriptor` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:bank, :bic, :iban_last4, :statement_descriptor]

  @object_name "source_type_ideal"
  def object_name, do: @object_name
end
