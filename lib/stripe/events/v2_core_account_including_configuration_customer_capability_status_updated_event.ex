# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CoreAccountIncludingConfigurationCustomerCapabilityStatusUpdatedEvent do
  @moduledoc """
  Occurs when the status of an Account's customer configuration capability is updated.
  """

  defmodule Data do
    @moduledoc false

    @typedoc """
    * `updated_capability` - Open Enum. The capability which had its status updated.
    """
    @type t :: %__MODULE__{
            updated_capability: term()
          }

    defstruct [:updated_capability]
  end

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

  def lookup_type, do: "v2.core.account[configuration.customer].capability_status_updated"

  def __inner_types__, do: %{"data" => Data}

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
