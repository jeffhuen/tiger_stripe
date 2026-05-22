# File generated from our OpenAPI spec
defmodule Stripe.Services.InvoiceItemService do
  @moduledoc """
  InvoiceItem

  Invoice Items represent the component lines of an [invoice](https://docs.stripe.com/api/invoices). When you create an invoice item with an `invoice` field, it is attached to the specified invoice and included as [an invoice line item](https://docs.stripe.com/api/invoices/line_item) within [invoice.lines](https://docs.stripe.com/api/invoices/object#invoice_object-lines).

  Invoice Items can be created before you are ready to actually send the invoice. This can be particularly useful when combined
  with a [subscription](https://docs.stripe.com/api/subscriptions). Sometimes you want to add a charge or credit to a customer, but actually charge
  or credit the customer's card only at the end of a regular billing cycle. This is useful for combining several charges
  (to minimize per-transaction fees), or for having Stripe tabulate your usage-based billing totals.

  Related guides: [Integrate with the Invoicing API](https://docs.stripe.com/invoicing/integration), [Subscription Invoices](https://docs.stripe.com/billing/invoices/subscription#adding-upcoming-invoice-items).
  """
  alias Stripe.Client

  @doc """
  Create an invoice item

  Creates an item to be added to a draft invoice (up to 250 items per invoice). If no invoice is specified, the item will be on the next invoice created for the customer specified.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.InvoiceItem.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/invoiceitems", Keyword.merge(opts, params: params))
  end

  @doc """
  Delete an invoice item

  Deletes an invoice item, removing it from an invoice. Deleting invoice items is only possible when they’re not attached to invoices, or if it’s attached to a draft invoice.
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.InvoiceItem.t()} | {:error, Stripe.Error.t()}
  def delete(client, invoiceitem, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/invoiceitems/#{invoiceitem}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all invoice items

  Returns a list of your invoice items. Invoice items are returned sorted by creation date, with the most recently created invoice items appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/invoiceitems", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve an invoice item

  Retrieves the invoice item with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.InvoiceItem.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, invoiceitem, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/invoiceitems/#{invoiceitem}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an invoice item

  Updates the amount or description of an invoice item on an upcoming invoice. Updating an invoice item is only possible before the invoice it’s attached to is closed.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.InvoiceItem.t()} | {:error, Stripe.Error.t()}
  def update(client, invoiceitem, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoiceitems/#{invoiceitem}",
      Keyword.merge(opts, params: params)
    )
  end
end
