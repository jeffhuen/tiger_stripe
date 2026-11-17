# File generated from our OpenAPI spec
defmodule Stripe.Events.V2MoneyManagementTransactionUpdatedEvent do
  @moduledoc """
  Occurs when a Transaction is updated.
  """

  @typedoc """
  * `treasury_transaction` - Id of the v1 Treasury Transaction corresponding to this Transaction.
  """
  @type data :: %{
          optional(:treasury_transaction) => term() | nil,
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
    :snapshot_event,
    :type
  ]

  def lookup_type, do: "v2.money_management.transaction.updated"

  def __nested_fields__ do
    %{
      "data" => %{
        fields: %{
          "treasury_transaction" => :scalar
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
