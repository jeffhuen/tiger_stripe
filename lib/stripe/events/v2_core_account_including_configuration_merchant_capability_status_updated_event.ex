# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CoreAccountIncludingConfigurationMerchantCapabilityStatusUpdatedEvent do
  @moduledoc """
  Occurs when the status of an Account's merchant configuration capability is updated.
  """

  @typedoc """
  * `updated_capability` - Open Enum. The capability which had its status updated.
  """
  @type data :: %{
          optional(:updated_capability) => term() | nil,
          optional(String.t()) => term()
        }

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

  def lookup_type, do: "v2.core.account[configuration.merchant].capability_status_updated"

  def __nested_fields__ do
    %{
      "data" => %{
        fields: %{
          "updated_capability" => :scalar
        }
      }
    }
  end

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
