# File generated from our OpenAPI spec
defmodule Stripe.Services.EventService do
  @moduledoc """
  NotificationEvent

  Snapshot events allow you to track and react to activity in your Stripe integration. When
  the state of another API resource changes, Stripe creates an `Event` object that contains
  all the relevant information associated with that action, including the affected API
  resource. For example, a successful payment triggers a `charge.succeeded` event, which
  contains the `Charge` in the event's data property. Some actions trigger multiple events.
  For example, if you create a new subscription for a customer, it triggers both a
  `customer.subscription.created` event and a `charge.succeeded` event.

  Configure an event destination in your account to listen for events that represent actions
  your integration needs to respond to. Additionally, you can retrieve an individual event or
  a list of events from the API.

  [Connect](https://docs.stripe.com/connect) platforms can also receive event notifications
  that occur in their connected accounts. These events include an account attribute that
  identifies the relevant connected account.

  You can access events through the [Retrieve Event API](https://docs.stripe.com/api/events#retrieve_event)
  for 30 days.
  """
  alias Stripe.Client

  @doc """
  List all events

  List events, going back up to 30 days. Each event data is rendered according to Stripe API version at its creation time, specified in [event object](https://docs.stripe.com/api/events/object) `api_version` attribute (not according to your current Stripe API version or `Stripe-Version` header).
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/events", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve an event

  Retrieves the details of an event if it was created in the last 30 days. Supply the unique identifier of the event, which you might have received in a webhook.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.Event.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/events/#{id}", Keyword.merge(opts, params: params))
  end
end
