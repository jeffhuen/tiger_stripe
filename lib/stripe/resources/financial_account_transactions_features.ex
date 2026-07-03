# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialAccountTransactionsFeatures do
  @moduledoc """
  ConnectEmbeddedFinancialAccountTransactionsFeatures
  """

  @typedoc """
  * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
  """
  @type t :: %__MODULE__{}

  defstruct [:card_spend_dispute_management]

  @object_name "connect_embedded_financial_account_transactions_features"
  def object_name, do: @object_name
end
