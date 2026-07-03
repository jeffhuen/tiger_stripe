# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Commerce.ProductCatalog.ImportService do
  @moduledoc """
  Import API operations.
  """
  alias Stripe.Client

  @doc """
  Create a Product Catalog Import

  Creates a ProductCatalogImport.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Commerce.ProductCatalogImport.t()}
          | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/commerce/product_catalog/imports",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Product Catalog Imports

  Returns a list of ProductCatalogImport objects.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.V2.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/commerce/product_catalog/imports",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve a Product Catalog Import

  Retrieves a ProductCatalogImport by ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.V2.Commerce.ProductCatalogImport.t()}
          | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/commerce/product_catalog/imports/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
