# File generated from our OpenAPI spec
defmodule Stripe.Services.Entitlements.FeatureService do
  @moduledoc """
  Feature

  A feature represents a monetizable ability or functionality in your system.
  Features can be assigned to products, and when those products are purchased, Stripe will create an entitlement to the feature for the purchasing customer.
  """
  alias Stripe.Client

  @doc """
  Create a feature

  Creates a feature
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Entitlements.Feature.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/entitlements/features",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all features

  Retrieve a list of features
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/entitlements/features", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a feature

  Retrieves a feature
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Entitlements.Feature.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/entitlements/features/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Updates a feature

  Update a feature’s metadata or permanently deactivate it.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Entitlements.Feature.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/entitlements/features/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
