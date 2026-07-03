# File generated from our OpenAPI spec
defmodule Stripe.Resources.Application do
  @moduledoc """
  Application
  """

  @typedoc """
  * `id` - Unique identifier for the object. Max length: 5000.
  * `name` - The name of the application. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `application`.
  """
  @type t :: %__MODULE__{}

  defstruct [:id, :name, :object]

  @object_name "application"
  def object_name, do: @object_name
end
