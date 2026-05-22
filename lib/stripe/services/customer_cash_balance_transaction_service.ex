# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerCashBalanceTransactionService do
  @moduledoc """
  CustomerCashBalanceTransaction

  Customers with certain payments enabled have a cash balance, representing funds that were paid
  by the customer to a merchant, but have not yet been allocated to a payment. Cash Balance Transactions
  represent when funds are moved into or out of this balance. This includes funding by the customer, allocation
  to payments, and refunds to the customer.
  """
  alias Stripe.Client

  @doc """
  List cash balance transactions

  Returns a list of transactions that modified the customer’s [cash balance](https://docs.stripe.com/docs/payments/customer-balance).
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/cash_balance_transactions",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a cash balance transaction

  Retrieves a specific cash balance transaction, which updated the customer’s [cash balance](https://docs.stripe.com/docs/payments/customer-balance).
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CustomerCashBalanceTransaction.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, customer, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/cash_balance_transactions/#{transaction}",
      Keyword.merge(opts, params: params)
    )
  end
end
