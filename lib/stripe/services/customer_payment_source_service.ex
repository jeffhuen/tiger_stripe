# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerPaymentSourceService do
  @moduledoc """
  CustomerPaymentSource API operations.
  """
  alias Stripe.Client

  @doc """
  Create a card

  When you create a new credit card, you must specify a customer or recipient on which to create it.

  If the card’s owner has no default card, then the new card will become the default.
  However, if the owner already has a default, then it will not change.
  To change the default, you should [update the customer](https://docs.stripe.com/docs/api#update_customer) to have a new `default_source`.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}/sources",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete a customer source

  Delete a specified source for a given customer.
  """
  @spec delete(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def delete(client, customer, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/customers/#{customer}/sources/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List sources for a specified customer.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def list(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/sources",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a specified source for a given customer.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, customer, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/customers/#{customer}/sources/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a specified source for a given customer.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, customer, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}/sources/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Verify a bank account

  Verify a specified bank account for a given customer.
  """
  @spec verify(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def verify(client, customer, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}/sources/#{id}/verify",
      Keyword.merge(opts, params: params)
    )
  end
end
