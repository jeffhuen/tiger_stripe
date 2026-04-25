# File generated from our OpenAPI spec
defmodule Stripe.Resources.OutboundPayments do
  @moduledoc """
  TreasuryFinancialAccountsResourceOutboundPayments

  Settings related to Outbound Payments features on a Financial Account
  """

  @typedoc """
  * `ach` - Expandable.
  * `us_domestic_wire` - Expandable.
  """
  @type t :: %__MODULE__{
          ach: Stripe.Resources.OutboundAchToggleSettings.t() | nil,
          us_domestic_wire: Stripe.Resources.ToggleSettings.t() | nil
        }

  defstruct [:ach, :us_domestic_wire]

  @object_name "treasury_financial_accounts_resource_outbound_payments"
  def object_name, do: @object_name

  def expandable_fields, do: ["ach", "us_domestic_wire"]

  def __nested_fields__ do
    %{
      "ach" => {:resource, Stripe.Resources.OutboundAchToggleSettings},
      "us_domestic_wire" => {:resource, Stripe.Resources.ToggleSettings}
    }
  end
end
