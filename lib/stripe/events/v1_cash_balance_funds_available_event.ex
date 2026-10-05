# File generated from our OpenAPI spec
defmodule Stripe.Events.V1CashBalanceFundsAvailableEvent do
  @moduledoc """
  Occurs whenever there is a positive remaining cash balance after Stripe automatically reconciles new funds into the cash balance. If you enabled manual reconciliation, this webhook will fire whenever there are new funds into the cash balance.
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

  def lookup_type, do: "v1.cash_balance.funds_available"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
