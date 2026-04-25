# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CoreAccountIncludingConfigurationRecipientUpdatedEvent do
  @moduledoc """
  Occurs when a Recipient's configuration is updated.
  """

  defstruct [:context, :created, :data, :id, :livemode, :object, :related_object, :type]

  def lookup_type, do: "v2.core.account[configuration.recipient].updated"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
