# File generated from our OpenAPI spec
defmodule Stripe.Services.FinancialConnections.TransactionService do
  @moduledoc """
  BankConnectionsResourceTransaction

  A Transaction represents a real transaction that affects a Financial Connections Account balance.
  """
  alias Stripe.Client

  @doc """
  List Transactions

  Returns a list of Financial Connections `Transaction` objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/financial_connections/transactions",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a Transaction

  Retrieves the details of a Financial Connections `Transaction`
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.FinancialConnections.Transaction.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/financial_connections/transactions/#{transaction}",
      Keyword.merge(opts, params: params)
    )
  end
end
