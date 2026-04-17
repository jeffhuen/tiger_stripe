# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.AccountService do
  @moduledoc """
  Account

  An Account v2 object represents a company, individual, or other entity that interacts with a platform on Stripe. It contains both identifying information and properties that control its behavior and functionality. An Account can have one or more configurations that enable sets of related features, such as allowing it to act as a merchant or customer.
  The Accounts v2 API supports both the Global Payouts preview feature and the Connect-Billing integration preview feature. However, a particular Account can only access one of them.
  The Connect-Billing integration preview feature allows an Account v2 to pay subscription fees to a platform. An Account v1 required a separate Customer object to pay subscription fees.
  """
  alias Stripe.Client

  @doc """
  Close an account

  Removes access to the Account and its associated resources. Closed Accounts can no longer be operated on, but limited information can still be retrieved through the API in order to be able to track their history.
  """
  @spec close(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
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

  An Account is a representation of a company, individual or other entity that a user interacts with. Accounts contain identifying information about the entity, and configurations that store the features an account has access to. An account can be configured as any or all of the following configurations: Customer, Merchant and/or Recipient.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
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
          {:ok, term()} | {:error, Stripe.Error.t()}
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
          {:ok, term()} | {:error, Stripe.Error.t()}
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
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/accounts/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
