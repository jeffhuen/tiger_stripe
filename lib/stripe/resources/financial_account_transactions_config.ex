# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialAccountTransactionsConfig do
  @moduledoc """
  ConnectEmbeddedFinancialAccountTransactionsConfigClaim
  """

  @typedoc """
  * `enabled` - Whether the embedded component is enabled.
  * `features` - Expandable.
  """
  @type t :: %__MODULE__{
          enabled: boolean(),
          features: Stripe.Resources.FinancialAccountTransactionsFeatures.t()
        }

  defstruct [:enabled, :features]

  @object_name "connect_embedded_financial_account_transactions_config_claim"
  def object_name, do: @object_name

  def expandable_fields, do: ["features"]

  def __nested_fields__ do
    %{
      "features" => {:resource, Stripe.Resources.FinancialAccountTransactionsFeatures}
    }
  end
end
