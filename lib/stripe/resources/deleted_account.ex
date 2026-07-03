# File generated from our OpenAPI spec
defmodule Stripe.Resources.DeletedAccount do
  @moduledoc """
  DeletedAccount
  """

  @typedoc """
  * `deleted` - Always true for a deleted object Possible values: `true`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `account`.
  """
  @type t :: %__MODULE__{}

  defstruct [:deleted, :id, :object]

  @object_name "deleted_account"
  def object_name, do: @object_name
end
