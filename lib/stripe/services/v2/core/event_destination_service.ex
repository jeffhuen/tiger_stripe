# File generated from our OpenAPI spec
defmodule Stripe.Services.V2.Core.EventDestinationService do
  @moduledoc """
  Event Destination

  Set up an event destination to receive events from Stripe across multiple destination types, including [webhook endpoints](https://docs.stripe.com/webhooks) and [Amazon EventBridge](https://docs.stripe.com/event-destinations/eventbridge). Event destinations support receiving [thin events](https://docs.stripe.com/api/v2/events) and [snapshot events](https://docs.stripe.com/api/events).
  """
  alias Stripe.Client

  @doc """
  Create an Event Destination

  Create a new event destination.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/event_destinations",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Delete an Event Destination

  Delete an event destination.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def delete(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v2/core/event_destinations/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Disable an Event Destination

  Disable an event destination.
  """
  @spec disable(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def disable(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/event_destinations/#{id}/disable",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Enable an Event Destination

  Enable an event destination.
  """
  @spec enable(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def enable(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/event_destinations/#{id}/enable",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  List Event Destinations

  Lists all event destinations.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/event_destinations",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Ping an event destination

  Send a `ping` event to an event destination.
  """
  @spec ping(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def ping(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/event_destinations/#{id}/ping",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Retrieve an Event Destination

  Retrieves the details of an event destination.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v2/core/event_destinations/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end

  @doc """
  Update an Event Destination

  Update the details of an event destination.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v2/core/event_destinations/#{id}",
      Keyword.merge(opts, params: params, api_mode: :v2)
    )
  end
end
