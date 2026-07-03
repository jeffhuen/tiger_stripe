# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CommerceProductCatalogImportsProcessingEvent do
  @moduledoc """
  Occurs when a product catalog import file has been uploaded and has started processing.
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
    :type
  ]

  def lookup_type, do: "v2.commerce.product_catalog.imports.processing"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
