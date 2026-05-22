# File generated from our OpenAPI spec
defmodule Stripe.Services.Tax.TransactionLineItemService do
  @moduledoc """
  TaxProductResourceTaxTransactionLineItem
  """
  alias Stripe.Client

  @doc """
  Retrieve a transaction's line items

  Retrieves the line items of a committed standalone transaction as a collection.
  """
  @spec list_line_items(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list_line_items(client, transaction, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/tax/transactions/#{transaction}/line_items",
      Keyword.merge(opts, params: params)
    )
  end
end
