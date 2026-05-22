# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.FinancialAccountService do
  @moduledoc """
  TreasuryFinancialAccountsResourceFinancialAccount

  Stripe Treasury provides users with a container for money called a FinancialAccount that is separate from their Payments balance.
  FinancialAccounts serve as the source and destination of Treasury’s money movement APIs.
  """
  alias Stripe.Client

  @doc """
  Close a FinancialAccount

  Closes a FinancialAccount. A FinancialAccount can only be closed if it has a zero balance, has no pending InboundTransfers, and has canceled all attached Issuing cards.
  """
  @spec close(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.FinancialAccount.t()} | {:error, Stripe.Error.t()}
  def close(client, financial_account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/financial_accounts/#{financial_account}/close",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a FinancialAccount

  Creates a new FinancialAccount. Each connected account can have up to three FinancialAccounts by default.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.FinancialAccount.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/financial_accounts",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all FinancialAccounts

  Returns a list of FinancialAccounts.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/financial_accounts",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a FinancialAccount

  Retrieves the details of a FinancialAccount.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.FinancialAccount.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, financial_account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/financial_accounts/#{financial_account}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a FinancialAccount

  Updates the details of a FinancialAccount.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.FinancialAccount.t()} | {:error, Stripe.Error.t()}
  def update(client, financial_account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/treasury/financial_accounts/#{financial_account}",
      Keyword.merge(opts, params: params)
    )
  end
end
