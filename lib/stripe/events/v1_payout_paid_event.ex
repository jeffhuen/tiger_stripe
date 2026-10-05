# File generated from our OpenAPI spec
defmodule Stripe.Events.V1PayoutPaidEvent do
  @moduledoc """
  Occurs whenever a payout is *expected* to be available in the destination account. If the payout fails, a `payout.failed` notification is also sent, at a later time.
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

  def lookup_type, do: "v1.payout.paid"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
