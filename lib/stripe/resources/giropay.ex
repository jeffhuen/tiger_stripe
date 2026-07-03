# File generated from our OpenAPI spec
defmodule Stripe.Resources.Giropay do
  @moduledoc """
  Giropay resource.
  """

  @typedoc """
  * `bank_code` - Nullable.
  * `bank_name` - Nullable.
  * `bic` - Nullable.
  * `statement_descriptor` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:bank_code, :bank_name, :bic, :statement_descriptor]

  @object_name "source_type_giropay"
  def object_name, do: @object_name
end
