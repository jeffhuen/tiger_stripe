# File generated from our OpenAPI spec
defmodule Stripe.Resources.Closed do
  @moduledoc """
  TreasuryFinancialAccountsResourceClosedStatusDetails
  """

  @typedoc """
  * `reasons` - The array that contains reasons for a FinancialAccount closure.
  """
  @type t :: %__MODULE__{}

  defstruct [:reasons]

  @object_name "treasury_financial_accounts_resource_closed_status_details"
  def object_name, do: @object_name
end
