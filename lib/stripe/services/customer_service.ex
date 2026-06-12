# File generated from our OpenAPI spec
defmodule Stripe.Services.CustomerService do
  @moduledoc """
  Customer

  This object represents a customer of your business. Use it to [create recurring charges](https://docs.stripe.com/invoicing/customer), [save payment](https://docs.stripe.com/payments/save-during-payment) and contact information,
  and track payments that belong to the same customer.
  """
  alias Stripe.Client

  @doc """
  Create a customer

  Creates a new customer object.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Customer.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/customers", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a customer

  Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Customer.t()} | {:error, Stripe.Error.t()}
  def delete(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/customers/#{customer}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete a customer discount

  Removes the currently applied discount on a customer.
  """
  @spec delete_discount(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Discount.t()} | {:error, Stripe.Error.t()}
  def delete_discount(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/customers/#{customer}/discount",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all customers

  Returns a list of your customers. The customers are returned sorted by creation date, with the most recent customers appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/customers", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a customer

  Retrieves a Customer object.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Customer.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, customer, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/customers/#{customer}", Keyword.merge(opts, params: params))
  end

  @doc """
  Search customers

  Search for customers you’ve previously created using Stripe’s [Search Query Language](https://docs.stripe.com/docs/search#search-query-language).
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.
  """
  @spec search(Client.t(), map(), keyword()) ::
          {:ok, Stripe.SearchResult.t()} | {:error, Stripe.Error.t()}
  def search(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/customers/search", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a customer

  Updates the specified customer by setting the values of the parameters passed. Any parameters not provided are left unchanged. For example, if you pass the **source** parameter, that becomes the customer’s active source (such as a card) to be used for all charges in the future. When you update a customer to a new valid card source by passing the **source** parameter: for each of the customer’s current subscriptions, if the subscription bills automatically and is in the `past_due` state, then the latest open invoice for the subscription with automatic collection enabled is retried. This retry doesn’t count as an automatic retry, and doesn’t affect the next regularly scheduled payment for the invoice. Changing the **default_source** for a customer doesn’t trigger this behavior.

  This request accepts mostly the same arguments as the customer creation call.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Customer.t()} | {:error, Stripe.Error.t()}
  def update(client, customer, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/customers/#{customer}",
      Keyword.merge(opts, params: params)
    )
  end
end
