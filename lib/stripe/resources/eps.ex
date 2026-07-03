# File generated from our OpenAPI spec
defmodule Stripe.Resources.Eps do
  @moduledoc """
  Eps resource.
  """

  @typedoc """
  * `reference` - Nullable.
  * `statement_descriptor` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:reference, :statement_descriptor]

  @object_name "source_type_eps"
  def object_name, do: @object_name
end
