# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.MeterService do
  @moduledoc """
  BillingMeter

  Meters specify how to aggregate meter events over a billing period. Meter events represent the actions that customers take in your system. Meters attach to prices and form the basis of the bill.

  Related guide: [Usage based billing](https://docs.stripe.com/billing/subscriptions/usage-based)
  """
  alias Stripe.Client

  @doc """
  Create a billing meter

  Creates a billing meter.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Meter.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/billing/meters", Keyword.merge(opts, params: params))
  end

  @doc """
  Deactivate a billing meter

  When a meter is deactivated, no more meter events will be accepted for this meter. You can’t attach a deactivated meter to a price.
  """
  @spec deactivate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Meter.t()} | {:error, Stripe.Error.t()}
  def deactivate(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/meters/#{id}/deactivate",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List billing meters

  Retrieve a list of billing meters.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/billing/meters", Keyword.merge(opts, params: params))
  end

  @doc """
  Reactivate a billing meter

  When a meter is reactivated, events for this meter can be accepted and you can attach the meter to a price.
  """
  @spec reactivate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Meter.t()} | {:error, Stripe.Error.t()}
  def reactivate(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/meters/#{id}/reactivate",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve a billing meter

  Retrieves a billing meter given an ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Meter.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/billing/meters/#{id}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a billing meter

  Updates a billing meter.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Meter.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/billing/meters/#{id}", Keyword.merge(opts, params: params))
  end
end
