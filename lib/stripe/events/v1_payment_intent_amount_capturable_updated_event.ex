# File generated from our OpenAPI spec
defmodule Stripe.Events.V1PaymentIntentAmountCapturableUpdatedEvent do
  @moduledoc """
  Occurs when a PaymentIntent has funds to be captured. Check the `amount_capturable` property on the PaymentIntent to determine the amount that can be captured. You may capture the PaymentIntent with an `amount_to_capture` value up to the specified amount. [Learn more about capturing PaymentIntents.](https://docs.stripe.com/api/payment_intents/capture).
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

  def lookup_type, do: "v1.payment_intent.amount_capturable_updated"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
