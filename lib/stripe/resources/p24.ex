# File generated from our OpenAPI spec
defmodule Stripe.Resources.P24 do
  @moduledoc """
  P24 resource.
  """

  @typedoc """
  * `reference` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:reference]

  @object_name "source_type_p24"
  def object_name, do: @object_name
end
