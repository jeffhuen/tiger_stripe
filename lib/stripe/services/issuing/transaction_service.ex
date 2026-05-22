# File generated from our OpenAPI spec
defmodule Stripe.Services.Issuing.TransactionService do
  @moduledoc """
  IssuingTransaction

  Any use of an [issued card](https://docs.stripe.com/issuing) that results in funds entering or leaving
  your Stripe account, such as a completed purchase or refund, is represented by an Issuing
  `Transaction` object.

  Related guide: [Issued card transactions](https://docs.stripe.com/issuing/purchases/transactions)
  """
  alias Stripe.Client

  @doc """
  List all transactions

  Returns a list of Issuing `Transaction` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/issuing/transactions", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a transaction

  Retrieves an Issuing `Transaction` object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Transaction.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/issuing/transactions/#{transaction}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a transaction

  Updates the specified Issuing `Transaction` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Issuing.Transaction.t()} | {:error, Stripe.Error.t()}
  def update(client, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/issuing/transactions/#{transaction}",
      Keyword.merge(opts, params: params)
    )
  end
end
