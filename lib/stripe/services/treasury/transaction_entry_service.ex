# File generated from our OpenAPI spec
defmodule Stripe.Services.Treasury.TransactionEntryService do
  @moduledoc """
  TransactionEntry

  Legacy TransactionEntries are part of the v1 version of Treasury for platforms and do not support many of the features introduced in [Treasury for platforms v2](https://docs.stripe.com/treasury/connect). Use [Transaction Entries](https://docs.stripe.com/api/v2/money-management/transaction-entries) instead of building a new v1 integration.

  TransactionEntries represent individual units of money movements within a single [Transaction](https://docs.stripe.com/api#transactions).
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
