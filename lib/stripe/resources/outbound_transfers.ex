# File generated from our OpenAPI spec
defmodule Stripe.Resources.OutboundTransfers do
  @moduledoc """
  TreasuryFinancialAccountsResourceOutboundTransfers

  OutboundTransfers contains outbound transfers features for a FinancialAccount.
  """

  @typedoc """
  * `ach` - Expandable.
  * `us_domestic_wire` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:ach, :us_domestic_wire]

  @object_name "treasury_financial_accounts_resource_outbound_transfers"
  def object_name, do: @object_name

  def expandable_fields, do: ["ach", "us_domestic_wire"]

  def __nested_fields__ do
    %{
      "ach" => {:resource, Stripe.Resources.OutboundAchToggleSettings},
      "us_domestic_wire" => {:resource, Stripe.Resources.ToggleSettings}
    }
  end
end
