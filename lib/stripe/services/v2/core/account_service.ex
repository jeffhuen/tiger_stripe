# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.AccountService do
  @moduledoc """
  Account

  An Account v2 object represents a company, individual, or other entity that your Stripe integration interacts with. It contains both identifying information and properties that control its behavior and functionality. An Account can have one or more configurations that enable sets of related features, such as allowing it to act as a merchant or customer.
  The Accounts v2 API is broadly available to Connect platforms, and to other users in preview. The Accounts v2 API also supports the Global Payouts preview feature.
  """
  alias Stripe.Client

  @doc """
  Close an account

  Removes access to the Account and its associated resources. Closed Accounts can no longer be operated on, but limited information can still be retrieved through the API in order to be able to track their history.
  """
  @spec close(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Account.t()} | {:error, Stripe.Error.t()}
  def close(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/accounts/#{id}/close",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Create an account

  Create an Account that represents a company, individual, or other entity that your business interacts with. Accounts contain identifying information about the entity, and configurations that store the features an account has access to. An account can be configured as any or all of the following configurations: Customer, Merchant and/or Recipient.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Account.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/accounts",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List accounts

  Returns a list of Accounts.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/accounts",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve an account

  Retrieves the details of an Account.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Account.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/accounts/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Update an account

  Updates the details of an Account.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Core.Account.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/accounts/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
