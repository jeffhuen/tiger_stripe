# File generated from our OpenAPI spec
defmodule Stripe.Services.PaymentIntentAmountDetailsLineItemService do
  @moduledoc """
  PaymentFlowsAmountDetailsResourceLineItemsListResourceLineItem
  """
  alias Stripe.Client

  @doc """
  List all PaymentIntent LineItems

  Lists all LineItems of a given PaymentIntent.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, intent, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/payment_intents/#{intent}/amount_details_line_items",
      Keyword.merge(opts, params: params)
    )
  end
end
