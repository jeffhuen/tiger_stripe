# File generated from our OpenAPI spec
defmodule Stripe.Services.Billing.AlertService do
  @moduledoc """
  ThresholdsResourceAlert

  A billing alert is a resource that notifies you when a certain usage threshold on a meter is crossed. For example, you might create a billing alert to notify you when a certain user made 100 API requests.
  """
  alias Stripe.Client

  @doc """
  Activate a billing alert

  Reactivates this alert, allowing it to trigger again.
  """
  @spec activate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Alert.t()} | {:error, Stripe.Error.t()}
  def activate(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/alerts/#{id}/activate",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Archive a billing alert

  Archives this alert, removing it from the list view and APIs. This is non-reversible.
  """
  @spec archive(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Alert.t()} | {:error, Stripe.Error.t()}
  def archive(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/alerts/#{id}/archive",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create a billing alert

  Creates a billing alert
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Alert.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/billing/alerts", Keyword.merge(opts, params: params))
  end

  @doc """
  Deactivate a billing alert

  Deactivates this alert, preventing it from triggering.
  """
  @spec deactivate(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Alert.t()} | {:error, Stripe.Error.t()}
  def deactivate(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/billing/alerts/#{id}/deactivate",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List billing alerts

  Lists billing active and inactive alerts
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/billing/alerts", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a billing alert

  Retrieves a billing alert given an ID
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Billing.Alert.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/billing/alerts/#{id}", Keyword.merge(opts, params: params))
  end
end
