# File generated from our OpenAPI spec
defmodule Stripe.Events.V1FinancialConnectionsAccountSupportedPaymentMethodTypesUpdatedEvent do
  @moduledoc """
  Occurs when the supported_payment_method_types array on a Financial Connections account changes.
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

  def lookup_type, do: "v1.financial_connections.account.supported_payment_method_types_updated"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
