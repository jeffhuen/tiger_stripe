# File generated from our OpenAPI spec
defmodule Stripe.Events.V1FinancialConnectionsAccountExpectedDeactivationDateUpdatedEvent do
  @moduledoc """
  Occurs when a Financial Connections account’s `expected_deactivation_date` changes.
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

  def lookup_type, do: "v1.financial_connections.account.expected_deactivation_date_updated"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
