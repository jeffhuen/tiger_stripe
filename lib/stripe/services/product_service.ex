# File generated from our OpenAPI spec
defmodule Stripe.Services.ProductService do
  @moduledoc """
  Product

  Products describe the specific goods or services you offer to your customers.
  For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product.
  They can be used in conjunction with [Prices](https://api.stripe.com#prices) to configure pricing in Payment Links, Checkout, and Subscriptions.

  Related guides: [Set up a subscription](https://docs.stripe.com/billing/subscriptions/set-up-subscription),
  [share a Payment Link](https://docs.stripe.com/payment-links),
  [accept payments with Checkout](https://docs.stripe.com/payments/accept-a-payment#create-product-prices-upfront),
  and more about [Products and Prices](https://docs.stripe.com/products-prices/overview)
  """
  alias Stripe.Client

  @doc """
  Create a product

  Creates a new product object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Product.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/products", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a product

  Delete a product. Deleting a product is only possible if it has no prices associated with it. Additionally, deleting a product with `type=good` is only possible if it has no SKUs associated with it.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Product.t()} | {:error, Stripe.Error.t()}
  def delete(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :delete, "/v1/products/#{id}", Keyword.merge(opts, params: params))
  end

  @doc """
  List all products

  Returns a list of your products. The products are returned sorted by creation date, with the most recently created products appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/products", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a product

  Retrieves the details of an existing product. Supply the unique product ID from either a product creation request or the product list, and Stripe will return the corresponding product information.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Product.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/products/#{id}", Keyword.merge(opts, params: params))
  end

  @doc """
  Search products

  Search for products you’ve previously created using Stripe’s [Search Query Language](https://docs.stripe.com/docs/search#search-query-language).
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.
  """
  @spec search(Client.t(), map(), keyword()) ::
          {:ok, Stripe.SearchResult.t()} | {:error, Stripe.Error.t()}
  def search(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/products/search", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a product

  Updates the specific product by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Product.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/products/#{id}", Keyword.merge(opts, params: params))
  end
end
