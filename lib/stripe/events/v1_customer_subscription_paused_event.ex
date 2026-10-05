# File generated from our OpenAPI spec
defmodule Stripe.Events.V1CustomerSubscriptionPausedEvent do
  @moduledoc """
  Occurs whenever a customer's subscription is paused. Only applies when subscriptions enter `status=paused`, not when [payment collection](https://docs.stripe.com/billing/subscriptions/pause) is paused.
  """

  defstruct [
    :changes,
    :context,
    :created,
    :data,
    :id,
    :livemode,
    :object,
    :reason,
    :related_object,
    :snapshot_event,
    :type
  ]

  def lookup_type, do: "v1.customer.subscription.paused"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
