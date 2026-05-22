# File generated from our OpenAPI spec
defmodule Stripe.Services.PlanService do
  @moduledoc """
  Plan

  You can now model subscriptions more flexibly using the [Prices API](https://api.stripe.com#prices). It replaces the Plans API and is backwards compatible to simplify your migration.

  Plans define the base price, currency, and billing cycle for recurring purchases of products.
  [Products](https://api.stripe.com#products) help you track inventory or provisioning, and plans help you track pricing. Different physical goods or levels of service should be represented by products, and pricing options should be represented by plans. This approach lets you change prices without having to change your provisioning scheme.

  For example, you might have a single "gold" product that has plans for $10/month, $100/year, €9/month, and €90/year.

  Related guides: [Set up a subscription](https://docs.stripe.com/billing/subscriptions/set-up-subscription) and more about [products and prices](https://docs.stripe.com/products-prices/overview).
  """
  alias Stripe.Client

  @doc """
  Create a plan

  You can now model subscriptions more flexibly using the [Prices API](#prices). It replaces the Plans API and is backwards compatible to simplify your migration.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Plan.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/plans", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a plan

  Deleting plans means new subscribers can’t be added. Existing subscribers aren’t affected.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Plan.t()} | {:error, Stripe.Error.t()}
  def delete(client, plan, params \\ %{}, opts \\ []) do
    Client.request(client, :delete, "/v1/plans/#{plan}", Keyword.merge(opts, params: params))
  end

  @doc """
  List all plans

  Returns a list of your plans.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/plans", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a plan

  Retrieves the plan with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Plan.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, plan, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/plans/#{plan}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a plan

  Updates the specified plan by setting the values of the parameters passed. Any parameters not provided are left unchanged. By design, you cannot change a plan’s ID, amount, currency, or billing cycle.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Plan.t()} | {:error, Stripe.Error.t()}
  def update(client, plan, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/plans/#{plan}", Keyword.merge(opts, params: params))
  end
end
