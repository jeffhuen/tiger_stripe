# File generated from our OpenAPI spec
defmodule Stripe.Services.WebhookEndpointService do
  @moduledoc """
  NotificationWebhookEndpoint

  You can configure [webhook endpoints](https://docs.stripe.com/webhooks/) via the API to be
  notified about events that happen in your Stripe account or connected
  accounts.

  Most users configure webhooks from [the dashboard](https://dashboard.stripe.com/webhooks), which provides a user interface for registering and testing your webhook endpoints.

  Related guide: [Setting up webhooks](https://docs.stripe.com/webhooks/configure)
  """
  alias Stripe.Client

  @doc """
  Create a webhook endpoint

  A webhook endpoint must have a `url` and a list of `enabled_events`. You may optionally specify the Boolean `connect` parameter. If set to true, then a Connect webhook endpoint that notifies the specified `url` about events from all connected accounts is created; otherwise an account webhook endpoint that notifies the specified `url` only about events from your account is created. You can also create webhook endpoints in the [webhooks settings](https://dashboard.stripe.com/account/webhooks) section of the Dashboard.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.WebhookEndpoint.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/webhook_endpoints", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete a webhook endpoint

  You can also delete webhook endpoints via the [webhook endpoint management](https://dashboard.stripe.com/account/webhooks) page of the Stripe dashboard.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.WebhookEndpoint.t()} | {:error, Stripe.Error.t()}
  def delete(client, webhook_endpoint, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/webhook_endpoints/#{webhook_endpoint}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all webhook endpoints

  Returns a list of your webhook endpoints.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/webhook_endpoints", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a webhook endpoint

  Retrieves the webhook endpoint with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.WebhookEndpoint.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, webhook_endpoint, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/webhook_endpoints/#{webhook_endpoint}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update a webhook endpoint

  Updates the webhook endpoint. You may edit the `url`, the list of `enabled_events`, and the status of your endpoint.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.WebhookEndpoint.t()} | {:error, Stripe.Error.t()}
  def update(client, webhook_endpoint, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/webhook_endpoints/#{webhook_endpoint}",
      Keyword.merge(opts, params: params)
    )
  end
end
