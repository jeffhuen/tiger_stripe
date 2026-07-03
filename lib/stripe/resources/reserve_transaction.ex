# File generated from our OpenAPI spec
defmodule Stripe.Resources.ReserveTransaction do
  @moduledoc """
  ReserveTransaction
  """

  @typedoc """
  * `amount`
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `reserve_transaction`.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :currency, :description, :id, :object]

  @object_name "reserve_transaction"
  def object_name, do: @object_name
end
