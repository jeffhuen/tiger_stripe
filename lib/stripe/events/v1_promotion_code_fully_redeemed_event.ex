# File generated from our OpenAPI spec
defmodule Stripe.Events.V1PromotionCodeFullyRedeemedEvent do
  @moduledoc """
  Occurs whenever a promotion code is fully redeemed.
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

  def lookup_type, do: "v1.promotion_code.fully_redeemed"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
