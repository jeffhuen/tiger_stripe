# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.FinancialAddressService do
  @moduledoc """
  Financial Address

  A FinancialAddress contains information needed to transfer money to a Financial Account. A Financial Account can have more than one Financial Address.
  """
  alias Stripe.Client

  @doc """
  Create a Financial Address

  Create a new FinancialAddress for a FinancialAccount (V2 shape).
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.FinancialAddress.t()}
          | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/financial_addresses",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Financial Addresses

  List all FinancialAddresses for a FinancialAccount (V2 shape).
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/financial_addresses",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Financial Address

  Retrieve a FinancialAddress (V2 shape).
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.FinancialAddress.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/financial_addresses/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
