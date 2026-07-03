# File generated from our OpenAPI spec
defmodule Stripe.Resources.DeletedProductFeature do
  @moduledoc """
  DeletedProductFeature
  """

  @typedoc """
  * `deleted` - Always true for a deleted object Possible values: `true`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `product_feature`.
  """
  @type t :: %__MODULE__{}

  defstruct [:deleted, :id, :object]

  @object_name "deleted_product_feature"
  def object_name, do: @object_name
end
