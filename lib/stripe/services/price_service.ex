# File generated from our OpenAPI spec
defmodule Stripe.Services.PriceService do
  @moduledoc """
  Price

  Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products.
  [Products](https://api.stripe.com#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.

  For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.

  Related guides: [Set up a subscription](https://docs.stripe.com/billing/subscriptions/set-up-subscription), [create an invoice](https://docs.stripe.com/billing/invoices/create), and more about [products and prices](https://docs.stripe.com/products-prices/overview).
  """
  alias Stripe.Client

  @doc """
  Create a price

  Creates a new [Price](https://docs.stripe.com/api/prices) for an existing [Product](https://docs.stripe.com/api/products). The Price can be recurring or one-time.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Price.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/prices", Keyword.merge(opts, params: params))
  end

  @doc """
  List all prices

  Returns a list of your active prices, excluding [inline prices](https://docs.stripe.com/docs/products-prices/pricing-models#inline-pricing). For the list of inactive prices, set `active` to false.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/prices", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a price

  Retrieves the price with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Price.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, price, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/prices/#{price}", Keyword.merge(opts, params: params))
  end

  @doc """
  Search prices

  Search for prices you’ve previously created using Stripe’s [Search Query Language](https://docs.stripe.com/docs/search#search-query-language).
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.
  """
  @spec search(Client.t(), map(), keyword()) ::
          {:ok, Stripe.SearchResult.t()} | {:error, Stripe.Error.t()}
  def search(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/prices/search", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a price

  Updates the specified price by setting the values of the parameters passed. Any parameters not provided are left unchanged.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Price.t()} | {:error, Stripe.Error.t()}
  def update(client, price, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/prices/#{price}", Keyword.merge(opts, params: params))
  end
end
