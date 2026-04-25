# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CoreAccountCreatedEvent do
  @moduledoc """
  Occurs when an Account is created.
  """

  defstruct [:changes, :context, :created, :data, :id, :livemode, :object, :related_object, :type]

  def lookup_type, do: "v2.core.account.created"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
