# File generated from our OpenAPI spec
defmodule Stripe.Events.V1InvoiceFinalizationFailedEvent do
  @moduledoc """
  Occurs whenever a draft invoice cannot be finalized. See the invoice’s [last finalization error](https://docs.stripe.com/api/invoices/object#invoice_object-last_finalization_error) for details.
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

  def lookup_type, do: "v1.invoice.finalization_failed"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
