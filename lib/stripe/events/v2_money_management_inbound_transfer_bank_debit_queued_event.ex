# File generated from our OpenAPI spec
defmodule Stripe.Events.V2MoneyManagementInboundTransferBankDebitQueuedEvent do
  @moduledoc """
  Occurs when an InboundTransfer is queued.
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

  def lookup_type, do: "v2.money_management.inbound_transfer.bank_debit_queued"

  def fetch_related_object(%__MODULE__{related_object: %{"url" => url}} = event, client) do
    opts =
      case Map.get(event, :context) do
        nil -> []
        ctx -> [stripe_context: ctx]
      end

    Stripe.Client.request(client, :get, url, opts)
  end
end
