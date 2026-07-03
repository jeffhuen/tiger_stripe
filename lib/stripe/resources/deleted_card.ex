# File generated from our OpenAPI spec
defmodule Stripe.Resources.DeletedCard do
  @moduledoc """
  DeletedCard
  """

  @typedoc """
  * `currency` - Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account. Max length: 5000. Nullable.
  * `deleted` - Always true for a deleted object Possible values: `true`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `card`.
  """
  @type t :: %__MODULE__{}

  defstruct [:currency, :deleted, :id, :object]

  @object_name "deleted_card"
  def object_name, do: @object_name
end
