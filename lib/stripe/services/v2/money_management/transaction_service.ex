# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.MoneyManagement.TransactionService do
  @moduledoc """
  Transaction

  A Transaction records how a money movement flow affects your FinancialAccount balance.
  A flow can create one or more Transactions.
  """
  alias Stripe.Client

  @doc """
  List Transactions

  Returns a list of Transactions that match the provided filters.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/transactions",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Refresh regulatory receipt a Transaction

  Creates a fresh hosted URL for a Transaction's regulatory receipt.
  """
  @spec refresh_regulatory_receipt(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.Transaction.t()} | {:error, Stripe.Error.t()}
  def refresh_regulatory_receipt(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/transactions/#{id}/refresh_regulatory_receipt",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Transaction

  Retrieves the details of a Transaction by ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.Transaction.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/money_management/transactions/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Update a Transaction

  Updates an existing Transaction. You can update its description and metadata.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.MoneyManagement.Transaction.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/money_management/transactions/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
