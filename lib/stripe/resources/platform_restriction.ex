# File generated from our OpenAPI spec
defmodule Stripe.Resources.PlatformRestriction do
  @moduledoc """
  TreasuryFinancialAccountsResourcePlatformRestrictions

  Restrictions that a Connect Platform has placed on this FinancialAccount.
  """

  @typedoc """
  * `inbound_flows` - Restricts all inbound money movement. Possible values: `restricted`, `unrestricted`. Nullable.
  * `outbound_flows` - Restricts all outbound money movement. Possible values: `restricted`, `unrestricted`. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:inbound_flows, :outbound_flows]

  @object_name "treasury_financial_accounts_resource_platform_restrictions"
  def object_name, do: @object_name
end
