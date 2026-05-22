# File generated from our OpenAPI spec
defmodule Stripe.Services.FinancialConnections.AccountService do
  @moduledoc """
  BankConnectionsResourceLinkedAccount

  A Financial Connections Account represents an account that exists outside of Stripe, to which you have been granted some degree of access.
  """
  alias Stripe.Client

  @doc """
  Disconnect an Account

  Disables your access to a Financial Connections `Account`. You will no longer be able to access data associated with the account (e.g. balances, transactions).
  """
  @spec disconnect(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FinancialConnections.Account.t()} | {:error, Stripe.Error.t()}
  def disconnect(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/financial_connections/accounts/#{account}/disconnect",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List Accounts

  Returns a list of Financial Connections `Account` objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/financial_connections/accounts",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Refresh Account data

  Refreshes the data associated with a Financial Connections `Account`.
  """
  @spec refresh(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FinancialConnections.Account.t()} | {:error, Stripe.Error.t()}
  def refresh(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/financial_connections/accounts/#{account}/refresh",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an Account

  Retrieves the details of an Financial Connections `Account`.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FinancialConnections.Account.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/financial_connections/accounts/#{account}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Subscribe to data refreshes for an Account

  Subscribes to periodic refreshes of data associated with a Financial Connections `Account`. When the account status is active, data is typically refreshed once a day.
  """
  @spec subscribe(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FinancialConnections.Account.t()} | {:error, Stripe.Error.t()}
  def subscribe(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/financial_connections/accounts/#{account}/subscribe",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Unsubscribe from data refreshes for an Account

  Unsubscribes from periodic refreshes of data associated with a Financial Connections `Account`.
  """
  @spec unsubscribe(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FinancialConnections.Account.t()} | {:error, Stripe.Error.t()}
  def unsubscribe(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/financial_connections/accounts/#{account}/unsubscribe",
      Keyword.merge(opts, params: params)
    )
  end
end
