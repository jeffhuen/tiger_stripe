# File generated from our OpenAPI spec
defmodule Stripe.Services.SubscriptionItemService do
  @moduledoc """
  SubscriptionItem

  Subscription items allow you to create customer subscriptions with more than
  one plan, making it easy to represent complex billing relationships.
  """
  alias Stripe.Client

  @doc """
  Create a subscription item

  Adds a new item to an existing subscription. No existing items will be changed or replaced.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionItem.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/subscription_items", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a subscription item

  Deletes an item from the subscription. Removing a subscription item from a subscription will not cancel the subscription.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionItem.t()} | {:error, Stripe.Error.t()}
  def delete(client, item, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/subscription_items/#{item}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all subscription items

  Returns a list of your subscription items for a given subscription.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/subscription_items", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a subscription item

  Retrieves the subscription item with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionItem.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, item, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/subscription_items/#{item}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a subscription item

  Updates the plan or quantity of an item on a current subscription.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionItem.t()} | {:error, Stripe.Error.t()}
  def update(client, item, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/subscription_items/#{item}",
      Keyword.merge(opts, params: params)
    )
  end
end
