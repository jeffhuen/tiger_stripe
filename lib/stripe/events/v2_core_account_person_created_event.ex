# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CoreAccountPersonCreatedEvent do
  @moduledoc """
  Occurs when a Person is created.
  """

  defmodule Data do
    @moduledoc false

    @typedoc """
    * `account_id` - The ID of the v2 account.
    """
    @type t :: %__MODULE__{
            account_id: term()
          }

    defstruct [:account_id]
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

  def lookup_type, do: "v2.core.account_person.created"

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
