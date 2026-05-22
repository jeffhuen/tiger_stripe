# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.TransactionService do
  @moduledoc """
  TreasuryTransactionsResourceTransaction

  Transactions represent changes to a [FinancialAccount's](https://api.stripe.com#financial_accounts) balance.
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
