# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.TransactionService do
  @moduledoc """
  Transaction

  Legacy Transactions are part of the v1 version of Treasury for platforms and do not support many of the features introduced in [Treasury for platforms v2](https://docs.stripe.com/treasury/connect). Use [Transactions](https://docs.stripe.com/api/v2/money-management/transactions) instead of building a new v1 integration.

  Transactions represent changes to a [FinancialAccount's](https://docs.stripe.com/api#financial_accounts) balance.
  """
  alias Stripe.Client

  @doc """
  List all Transactions

  Retrieves a list of Transaction objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/treasury/transactions", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a Transaction

  Retrieves the details of an existing Transaction.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.Transaction.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/transactions/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
