# File generated from our OpenAPI spec
defmodule Stripe.Resources.DeletedBankAccount do
  @moduledoc """
  DeletedBankAccount
  """

  @typedoc """
  * `currency` - Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account. Max length: 5000. Nullable.
  * `deleted` - Always true for a deleted object Possible values: `true`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `bank_account`.
  """
  @type t :: %__MODULE__{}

  defstruct [:currency, :deleted, :id, :object]

  @object_name "deleted_bank_account"
  def object_name, do: @object_name
end
