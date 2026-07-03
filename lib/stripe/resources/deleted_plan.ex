# File generated from our OpenAPI spec
defmodule Stripe.Resources.DeletedPlan do
  @moduledoc """
  DeletedPlan
  """

  @typedoc """
  * `deleted` - Always true for a deleted object Possible values: `true`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `plan`.
  """
  @type t :: %__MODULE__{}

  defstruct [:deleted, :id, :object]

  @object_name "deleted_plan"
  def object_name, do: @object_name
end
