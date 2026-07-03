# File generated from our OpenAPI spec
defmodule Stripe.Resources.DeletedApplication do
  @moduledoc """
  DeletedApplication
  """

  @typedoc """
  * `deleted` - Always true for a deleted object Possible values: `true`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `name` - The name of the application. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `application`.
  """
  @type t :: %__MODULE__{}

  defstruct [:deleted, :id, :name, :object]

  @object_name "deleted_application"
  def object_name, do: @object_name
end
