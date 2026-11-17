# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.FinancialAccountService do
  @moduledoc """
  Financial Account

  A FinancialAccount represents a balance and can be the source or destination of money movement.
  """
  alias Stripe.Client

  @doc """
  List Financial Accounts

  Returns a list of FinancialAccounts in your account that match the provided filters.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/financial_accounts",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Financial Account

  Retrieves the details of an existing FinancialAccount.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.FinancialAccount.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/financial_accounts/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Update a Financial Account

  Updates an existing FinancialAccount using the provided parameters.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.FinancialAccount.t()}
          | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/financial_accounts/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
