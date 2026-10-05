# File generated from our OpenAPI spec
defmodule Stripe.Events.V1ApplicationFeeRefundedEvent do
  @moduledoc """
  Occurs whenever an application fee is refunded, whether from refunding a charge or from [refunding the application fee directly](#fee_refunds). This includes partial refunds.
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

  def lookup_type, do: "v1.application_fee.refunded"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
