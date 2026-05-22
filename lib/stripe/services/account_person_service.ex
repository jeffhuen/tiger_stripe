# File generated from our OpenAPI spec
defmodule Stripe.Services.AccountPersonService do
  @moduledoc """
  AccountPerson API operations.
  """
  alias Stripe.Client

  @doc """
  Create a person

  Creates a new person.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Person.t()} | {:error, Stripe.Error.t()}
  def create(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/accounts/#{account}/persons",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete a person

  Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the `account_opener`. If your integration is using the `executive` parameter, you cannot delete the only verified `executive` on file.
  """
  @spec delete(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Person.t()} | {:error, Stripe.Error.t()}
  def delete(client, account, person, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/accounts/#{account}/persons/#{person}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all persons

  Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/accounts/#{account}/persons",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a person

  Retrieves an existing person.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Person.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, account, person, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/accounts/#{account}/persons/#{person}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a person

  Updates an existing person.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Person.t()} | {:error, Stripe.Error.t()}
  def update(client, account, person, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/accounts/#{account}/persons/#{person}",
      Keyword.merge(opts, params: params)
    )
  end
end
