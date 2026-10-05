# File generated from our OpenAPI spec
defmodule Stripe.Events.V1ReviewClosedEvent do
  @moduledoc """
  Occurs whenever a review is closed. The review's `reason` field indicates why: `approved`, `disputed`, `refunded`, `refunded_as_fraud`, or `canceled`.
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

  def lookup_type, do: "v1.review.closed"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
