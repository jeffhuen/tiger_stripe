# File generated from our OpenAPI spec
defmodule Stripe.Services.InvoicePaymentService do
  @moduledoc """
  InvoicesInvoicePayment

  Invoice Payments represent payments made against invoices. Invoice Payments can
  be accessed in two ways:
  1. By expanding the `payments` field on the [Invoice](https://api.stripe.com#invoice) resource.
  2. By using the Invoice Payment retrieve and list endpoints.

  Invoice Payments include the mapping between payment objects, such as Payment Intent, and Invoices.
  This resource and its endpoints allows you to easily track if a payment is associated with a specific invoice and
  monitor the allocation details of the payments.
  """
  alias Stripe.Client

  @doc """
  List all payments for an invoice

  When retrieving an invoice, there is an includable payments property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of payments.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/invoice_payments", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve an InvoicePayment

  Retrieves the invoice payment with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.InvoicePayment.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, invoice_payment, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/invoice_payments/#{invoice_payment}",
      Keyword.merge(opts, params: params)
    )
  end
end
