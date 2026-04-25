# File generated from our OpenAPI spec
defmodule Stripe.Events.V2CoreAccountPersonDeletedEvent do
  @moduledoc """
  Occurs when a Person is deleted.
  """

  @typedoc """
  * `account_id` - The ID of the v2 account.
  """
  @type data :: %{
          optional(:account_id) => term() | nil,
          optional(String.t()) => term()
        }

  defstruct [:context, :created, :data, :id, :livemode, :object, :related_object, :type]

  def lookup_type, do: "v2.core.account_person.deleted"

  def __nested_fields__ do
    %{
      "data" => %{
        fields: %{
          "account_id" => :scalar
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
