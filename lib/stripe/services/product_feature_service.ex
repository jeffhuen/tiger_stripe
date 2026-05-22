# File generated from our OpenAPI spec
defmodule Stripe.Services.ProductFeatureService do
  @moduledoc """
  ProductFeature

  A product_feature represents an attachment between a feature and a product.
  When a product is purchased that has a feature attached, Stripe will create an entitlement to the feature for the purchasing customer.
  """
  alias Stripe.Client

  @doc """
  Attach a feature to a product

  Creates a product_feature, which represents a feature attachment to a product
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ProductFeature.t()} | {:error, Stripe.Error.t()}
  def create(client, product, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/products/#{product}/features",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Remove a feature from a product

  Deletes the feature attachment to a product
  """
  @spec delete(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ProductFeature.t()} | {:error, Stripe.Error.t()}
  def delete(client, product, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/products/#{product}/features/#{id}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all features attached to a product

  Retrieve a list of features for a product
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, product, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/products/#{product}/features",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a product_feature

  Retrieves a product_feature, which represents a feature attachment to a product
  """
  @spec retrieve(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.ProductFeature.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, product, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/products/#{product}/features/#{id}",
      Keyword.merge(opts, params: params)
    )
  end
end
