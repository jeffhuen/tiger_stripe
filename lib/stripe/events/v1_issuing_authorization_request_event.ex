# File generated from our OpenAPI spec
defmodule Stripe.Events.V1IssuingAuthorizationRequestEvent do
  @moduledoc """
  Represents a synchronous request for authorization, see [Using your integration to handle authorization requests](https://docs.stripe.com/issuing/purchases/authorizations#authorization-handling).
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

  def lookup_type, do: "v1.issuing_authorization.request"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
