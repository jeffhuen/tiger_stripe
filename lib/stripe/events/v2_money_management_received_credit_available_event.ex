# File generated from our OpenAPI spec
defmodule Stripe.Events.V2MoneyManagementReceivedCreditAvailableEvent do
  @moduledoc """
  Occurs when a ReceivedCredit's funds are received and are available in your balance.
  """

  @typedoc """
  * `transaction_id` - The transaction ID of the received credit.
  """
  @type data :: %{
          optional(:transaction_id) => term() | nil,
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

  def lookup_type, do: "v2.money_management.received_credit.available"

  def __nested_fields__ do
    %{
      "data" => %{
        fields: %{
          "transaction_id" => :scalar
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
