# File generated from our OpenAPI spec
defmodule Stripe.Services.SubscriptionScheduleService do
  @moduledoc """
  SubscriptionSchedule

  A subscription schedule allows you to create and manage the lifecycle of a subscription by predefining expected changes.

  Related guide: [Subscription schedules](https://docs.stripe.com/billing/subscriptions/subscription-schedules)
  """
  alias Stripe.Client

  @doc """
  Cancel a schedule

  Cancels a subscription schedule and its associated subscription immediately (if the subscription schedule has an active subscription). A subscription schedule can only be canceled if its status is `not_started` or `active`.
  """
  @spec cancel(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionSchedule.t()} | {:error, Stripe.Error.t()}
  def cancel(client, schedule, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/subscription_schedules/#{schedule}/cancel",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a schedule

  Creates a new subscription schedule object. Each customer can have up to 500 active or scheduled subscriptions.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionSchedule.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/subscription_schedules",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all schedules

  Retrieves the list of your subscription schedules.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/subscription_schedules",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Release a schedule

  Releases the subscription schedule immediately, which will stop scheduling of its phases, but leave any existing subscription in place. A schedule can only be released if its status is `not_started` or `active`. If the subscription schedule is currently associated with a subscription, releasing it will remove its `subscription` property and set the subscription’s ID to the `released_subscription` property.
  """
  @spec release(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionSchedule.t()} | {:error, Stripe.Error.t()}
  def release(client, schedule, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/subscription_schedules/#{schedule}/release",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a schedule

  Retrieves the details of an existing subscription schedule. You only need to supply the unique subscription schedule identifier that was returned upon subscription schedule creation.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionSchedule.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, schedule, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/subscription_schedules/#{schedule}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a schedule

  Updates an existing subscription schedule.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.SubscriptionSchedule.t()} | {:error, Stripe.Error.t()}
  def update(client, schedule, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/subscription_schedules/#{schedule}",
      Keyword.merge(opts, params: params)
    )
  end
end
