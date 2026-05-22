# File generated from our OpenAPI spec
defmodule Stripe.Services.Tax.TransactionService do
  @moduledoc """
  TaxProductResourceTaxTransaction

  A Tax Transaction records the tax collected from or refunded to your customer.

  Related guide: [Calculate tax in your custom payment flow](https://docs.stripe.com/tax/custom#tax-transaction)
  """
  alias Stripe.Client

  @doc """
  Create a transaction from a calculation

  Creates a Tax Transaction from a calculation, if that calculation hasn’t expired. Calculations expire after 90 days.
  """
  @spec create_from_calculation(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Transaction.t()} | {:error, Stripe.Error.t()}
  def create_from_calculation(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/tax/transactions/create_from_calculation",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a reversal transaction

  Partially or fully reverses a previously created `Transaction`.
  """
  @spec create_reversal(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Transaction.t()} | {:error, Stripe.Error.t()}
  def create_reversal(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/tax/transactions/create_reversal",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a transaction

  Retrieves a Tax `Transaction` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Tax.Transaction.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/tax/transactions/#{transaction}",
      Keyword.merge(opts, params: params)
    )
  end
end
