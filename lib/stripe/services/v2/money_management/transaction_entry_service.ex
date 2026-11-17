# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.TransactionEntryService do
  @moduledoc """
  Transaction Entry

  TransactionEntries model funds moving between availability states for a given Transaction.
  """
  alias Stripe.Client

  @doc """
  List Transaction Entries

  Returns a list of TransactionEntries that match the provided filters.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/transaction_entries",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Transaction Entry

  Retrieves the details of a TransactionEntry by ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.TransactionEntry.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/transaction_entries/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
