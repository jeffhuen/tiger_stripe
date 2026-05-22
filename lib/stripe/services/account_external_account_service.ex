# File generated from our OpenAPI spec
defmodule Stripe.Services.AccountExternalAccountService do
  @moduledoc """
  AccountExternalAccount API operations.
  """
  alias Stripe.Client

  @doc """
  Create an external account

  Create an external account for a given account.
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/accounts/#{account}/external_accounts",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete an external account

  Delete a specified external account for a given account.
  """
  @spec delete(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def delete(client, account, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/accounts/#{account}/external_accounts/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all external accounts

  List external accounts for an account.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/accounts/#{account}/external_accounts",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an external account

  Retrieve a specified external account for a given account.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, account, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/accounts/#{account}/external_accounts/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Updates the metadata, account holder name, account holder type of a bank account belonging to
  a connected account and optionally sets it as the default for its currency. Other bank account
  details are not editable by design.

  You can only update bank accounts when [account.controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes [Custom accounts](https://stripe.com/connect/custom-accounts).

  You can re-enable a disabled bank account by performing an update call without providing any
  arguments or changes.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, account, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/accounts/#{account}/external_accounts/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
