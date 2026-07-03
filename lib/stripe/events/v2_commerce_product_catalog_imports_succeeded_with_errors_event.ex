# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CommerceProductCatalogImportsSucceededWithErrorsEvent do
  @moduledoc """
  Occurs when a product catalog file has been successfully processed but some rows failed validation.
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

  def lookup_type, do: "v2.commerce.product_catalog.imports.succeeded_with_errors"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
