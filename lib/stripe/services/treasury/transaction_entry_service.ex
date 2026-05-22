# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.TransactionEntryService do
  @moduledoc """
  TreasuryTransactionsResourceTransactionEntry

  TransactionEntries represent individual units of money movements within a single [Transaction](https://api.stripe.com#transactions).
  """
  alias Stripe.Client

  @doc """
  List all TransactionEntries

  Retrieves a list of TransactionEntry objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/transaction_entries",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a TransactionEntry

  Retrieves a TransactionEntry object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Treasury.TransactionEntry.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/treasury/transaction_entries/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
