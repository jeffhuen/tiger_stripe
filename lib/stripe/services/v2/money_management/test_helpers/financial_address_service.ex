# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.TestHelpers.FinancialAddressService do
  @moduledoc """
  FinancialAddress API operations.
  """
  alias Stripe.Client

  @doc """
  Credit a Financial Address

  Simulate crediting a FinancialAddress in a Sandbox environment. This can be used to add virtual funds and increase your balance for testing.
  """
  @spec credit(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.FinancialAddressCreditSimulation.t()}
          | {:error, Stripe.Error.t()}
  def credit(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/test_helpers/financial_addresses/#{id}/credit",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
