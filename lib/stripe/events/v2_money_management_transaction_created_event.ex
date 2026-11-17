# File generated from our OpenAPI spec
defmodule Stripe.Events.V2MoneyManagementTransactionCreatedEvent do
  @moduledoc """
  Occurs when a Transaction is created.
  """

  @typedoc """
  * `treasury_transaction` - Id of the v1 Treasury Transaction corresponding to this Transaction.
  * `v1_id` - Id of the v1 Transaction corresponding to this Transaction.
  """
  @type data :: %{
          optional(:treasury_transaction) => term() | nil,
          optional(:v1_id) => term() | nil,
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

  def lookup_type, do: "v2.money_management.transaction.created"

  def __nested_fields__ do
    %{
      "data" => %{
        fields: %{
          "treasury_transaction" => :scalar,
          "v1_id" => :scalar
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
