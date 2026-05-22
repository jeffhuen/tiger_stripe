# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.CreditGrantService do
  @moduledoc """
  CreditGrant

  A credit grant is an API resource that documents the allocation of some billing credits to a customer.

  Related guide: [Billing credits](https://docs.stripe.com/billing/subscriptions/usage-based/billing-credits)
  """
  alias Stripe.Client

  @doc """
  Create a credit grant

  Creates a credit grant.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.CreditGrant.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/credit_grants",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Expire a credit grant

  Expires a credit grant.
  """
  @spec expire(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.CreditGrant.t()} | {:error, Stripe.Error.t()}
  def expire(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/credit_grants/#{id}/expire",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List credit grants

  Retrieve a list of credit grants.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/billing/credit_grants", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a credit grant

  Retrieves a credit grant.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.CreditGrant.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/billing/credit_grants/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a credit grant

  Updates a credit grant.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.CreditGrant.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/credit_grants/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Void a credit grant

  Voids a credit grant.
  """
  @spec void_grant(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.CreditGrant.t()} | {:error, Stripe.Error.t()}
  def void_grant(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/credit_grants/#{id}/void",
      Keyword.merge(opts, params: params)
    )
  end
end
