# File generated from our OpenAPI spec
defmodule Stripe.Services.BalanceTransactionService do
  @moduledoc """
  BalanceTransaction

  Balance transactions represent funds moving through your Stripe account.
  Stripe creates them for every type of transaction that enters or leaves your Stripe account balance.

  Related guide: [Balance transaction types](https://docs.stripe.com/reports/balance-transaction-types)
  """
  alias Stripe.Client

  @doc """
  List all balance transactions

  Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.

  Note that this endpoint was previously called “Balance history” and used the path `/v1/balance/history`.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/balance_transactions", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a balance transaction

  Retrieves the balance transaction with the given ID.

  Note that this endpoint previously used the path `/v1/balance/history/:id`.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.BalanceTransaction.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/balance_transactions/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
