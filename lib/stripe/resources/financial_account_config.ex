# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialAccountConfig do
  @moduledoc """
  ConnectEmbeddedFinancialAccountConfigClaim
  """

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:enabled, :features]

  @object_name "connect_embedded_financial_account_config_claim"
  def object_name, do: @object_name

  def expandable_fields, do: ["features"]

  def __nested_fields__ do
    %{
      "features" => {:resource, Stripe.Resources.FinancialAccountFeatures}
    }
  end
end
