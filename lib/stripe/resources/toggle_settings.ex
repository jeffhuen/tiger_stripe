# File generated from our OpenAPI spec
defmodule Stripe.Resources.ToggleSettings do
  @moduledoc """
  TreasuryFinancialAccountsResourceToggleSettings

  Toggle settings for enabling/disabling a feature
  """

  @typedoc """
  * `requested` - Whether the FinancialAccount should have the Feature.
  * `status` - Whether the Feature is operational. Possible values: `active`, `pending`, `restricted`.
  * `status_details` - Additional details; includes at least one entry when the status is not `active`. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:requested, :status, :status_details]

  @object_name "treasury_financial_accounts_resource_toggle_settings"
  def object_name, do: @object_name

  def expandable_fields, do: ["status_details"]
end
