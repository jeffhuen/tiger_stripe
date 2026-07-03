# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialConnections.AccountOwner do
  @moduledoc """
  BankConnectionsResourceOwner

  Describes an owner of an account.
  """

  @typedoc """
  * `email` - The email address of the owner. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `name` - The full name of the owner. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `financial_connections.account_owner`.
  * `ownership` - The ownership object that this owner belongs to. Max length: 5000.
  * `phone` - The raw phone number of the owner. Max length: 5000. Nullable.
  * `raw_address` - The raw physical address of the owner. Max length: 5000. Nullable.
  * `refreshed_at` - The timestamp of the refresh that updated this owner. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:email, :id, :name, :object, :ownership, :phone, :raw_address, :refreshed_at]

  @object_name "financial_connections.account_owner"
  def object_name, do: @object_name
end
