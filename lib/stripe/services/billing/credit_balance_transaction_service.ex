# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.CreditBalanceTransactionService do
  @moduledoc """
  CreditBalanceTransaction

  A credit balance transaction is a resource representing a transaction (either a credit or a debit) against an existing credit grant.
  """
  alias Stripe.Client

  @doc """
  List credit balance transactions

  Retrieve a list of credit balance transactions.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing/credit_balance_transactions",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a credit balance transaction

  Retrieves a credit balance transaction.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.CreditBalanceTransaction.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing/credit_balance_transactions/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
