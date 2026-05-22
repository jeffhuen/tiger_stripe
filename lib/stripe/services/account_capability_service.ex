# File generated from our OpenAPI spec
defmodule Stripe.Services.AccountCapabilityService do
  @moduledoc """
  AccountCapability API operations.
  """
  alias Stripe.Client

  @doc """
  List all account capabilities

  Returns a list of capabilities associated with the account. The capabilities are returned sorted by creation date, with the most recent capability appearing first.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, account, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/accounts/#{account}/capabilities",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an Account Capability

  Retrieves information about the specified Account Capability.
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Capability.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, account, capability, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/accounts/#{account}/capabilities/#{capability}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an Account Capability

  Updates an existing Account Capability. Request or remove a capability by updating its `requested` parameter.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Capability.t()} | {:error, Stripe.Error.t()}
  def update(client, account, capability, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/accounts/#{account}/capabilities/#{capability}",
      Keyword.merge(opts, params: params)
    )
  end
end
