# File generated from our OpenAPI spec
defmodule Stripe.Events.V1ChargeUpdatedEvent do
  @moduledoc """
  Occurs whenever a charge description or metadata is updated, or upon an asynchronous capture.
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

  def lookup_type, do: "v1.charge.updated"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
