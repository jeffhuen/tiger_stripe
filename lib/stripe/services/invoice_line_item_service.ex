# File generated from our OpenAPI spec
defmodule Stripe.Services.InvoiceLineItemService do
  @moduledoc """
  InvoiceLineItem

  Invoice Line Items represent the individual lines within an [invoice](https://docs.stripe.com/api/invoices) and only exist within the context of an invoice.

  Each line item is backed by either an [invoice item](https://docs.stripe.com/api/invoiceitems) or a [subscription item](https://docs.stripe.com/api/subscription_items).
  """
  alias Stripe.Client

  @doc """
  Retrieve an invoice's line items

  When retrieving an invoice, you’ll get a **lines** property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/invoices/#{invoice}/lines",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an invoice's line item

  Updates an invoice’s line item. Some fields, such as `tax_amounts`, only live on the invoice line item,
  so they can only be updated through this endpoint. Other fields, such as `amount`, live on both the invoice
  item and the invoice line item, so updates on this endpoint will propagate to the invoice item as well.
  Updating an invoice’s line item is only possible before the invoice is finalized.
  """
  @spec update(Client.t(), String.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.InvoiceLineItem.t()} | {:error, Stripe.Error.t()}
  def update(client, invoice, line_item_id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/lines/#{line_item_id}",
      Keyword.merge(opts, params: params)
    )
  end
end
