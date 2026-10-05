# File generated from our OpenAPI spec
defmodule Stripe.Events.V1ChargeDisputeFundsReinstatedEvent do
  @moduledoc """
  Occurs when funds are reinstated to your account after a dispute is closed. This includes [partially refunded payments](https://docs.stripe.com/disputes#disputes-on-partially-refunded-payments).
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

  def lookup_type, do: "v1.charge.dispute.funds_reinstated"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
