# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.Accounts.PersonService do
  @moduledoc """
  Person API operations.
  """
  alias Stripe.Client

  @doc """
  Create a person

  Create a Person. Adds an individual to an Account's identity. You can set relationship attributes and identity information at creation.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, account_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/accounts/#{account_id}/persons",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Delete a Person

  Delete a Person associated with an Account.
  """
  @spec delete(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def delete(client, account_id, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/core/accounts/#{account_id}/persons/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Persons

  Returns a paginated list of Persons associated with an Account.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def list(client, account_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/accounts/#{account_id}/persons",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Person

  Retrieves a Person associated with an Account.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, account_id, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/accounts/#{account_id}/persons/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Update a person

  Updates a Person associated with an Account.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, account_id, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/accounts/#{account_id}/persons/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
