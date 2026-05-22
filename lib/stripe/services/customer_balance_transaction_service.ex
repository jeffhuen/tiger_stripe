# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerBalanceTransactionService do
  @moduledoc """
  CustomerBalanceTransaction

  Each customer has a [Balance](https://docs.stripe.com/api/customers/object#customer_object-balance) value,
  which denotes a debit or credit that's automatically applied to their next invoice upon finalization.
  You may modify the value directly by using the [update customer API](https://docs.stripe.com/api/customers/update),
  or by creating a Customer Balance Transaction, which increments or decrements the customer's `balance` by the specified `amount`.

  Related guide: [Customer balance](https://docs.stripe.com/billing/customer/balance)
  """
  alias Stripe.Client

  @doc """
  Create a customer balance transaction

  Creates an immutable transaction that updates the customer’s credit [balance](https://docs.stripe.com/docs/billing/customer/balance).
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CustomerBalanceTransaction.t()} | {:error, Stripe.Error.t()}
  def create(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}/balance_transactions",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List customer balance transactions

  Returns a list of transactions that updated the customer’s [balances](https://docs.stripe.com/docs/billing/customer/balance).
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/balance_transactions",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a customer balance transaction

  Retrieves a specific customer balance transaction that updated the customer’s [balances](https://docs.stripe.com/docs/billing/customer/balance).
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CustomerBalanceTransaction.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, customer, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/balance_transactions/#{transaction}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a customer credit balance transaction

  Most credit balance transaction fields are immutable, but you may update its `description` and `metadata`.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CustomerBalanceTransaction.t()} | {:error, Stripe.Error.t()}
  def update(client, customer, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}/balance_transactions/#{transaction}",
      Keyword.merge(opts, params: params)
    )
  end
end
