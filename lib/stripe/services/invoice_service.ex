# File generated from our OpenAPI spec
defmodule Stripe.Services.InvoiceService do
  @moduledoc """
  Invoice

  Invoices are statements of amounts owed by a customer, and are either
  generated one-off, or generated periodically from a subscription.

  They contain [invoice items](https://api.stripe.com#invoiceitems), and proration adjustments
  that may be caused by subscription upgrades/downgrades (if necessary).

  If your invoice is configured to be billed through automatic charges,
  Stripe automatically finalizes your invoice and attempts payment. Note
  that finalizing the invoice,
  [when automatic](https://docs.stripe.com/invoicing/integration/automatic-advancement-collection), does
  not happen immediately as the invoice is created. Stripe waits
  until one hour after the last webhook was successfully sent (or the last
  webhook timed out after failing). If you (and the platforms you may have
  connected to) have no webhooks configured, Stripe waits one hour after
  creation to finalize the invoice.

  If your invoice is configured to be billed by sending an email, then based on your
  [email settings](https://dashboard.stripe.com/account/billing/automatic),
  Stripe will email the invoice to your customer and await payment. These
  emails can contain a link to a hosted page to pay the invoice.

  Stripe applies any customer credit on the account before determining the
  amount due for the invoice (i.e., the amount that will be actually
  charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge
  per currency](https://docs.stripe.com/docs/currencies#minimum-and-maximum-charge-amounts), the
  invoice is automatically marked paid, and we add the amount due to the
  customer's credit balance which is applied to the next invoice.

  More details on the customer's credit balance are
  [here](https://docs.stripe.com/billing/customer/balance).

  Related guide: [Send invoices to customers](https://docs.stripe.com/billing/invoices/sending)
  """
  alias Stripe.Client

  @doc """
  Bulk add invoice line items

  Adds multiple line items to an invoice. This is only possible when an invoice is still a draft.
  """
  @spec add_lines(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def add_lines(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/add_lines",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Attach a payment to an Invoice

  Attaches a PaymentIntent or an Out of Band Payment to the invoice, adding it to the list of `payments`.

  For the PaymentIntent, when the PaymentIntent’s status changes to `succeeded`, the payment is credited
  to the invoice, increasing its `amount_paid`. When the invoice is fully paid, the
  invoice’s status becomes `paid`.

  If the PaymentIntent’s status is already `succeeded` when it’s attached, it’s
  credited to the invoice immediately.

  See: [Partial payments](https://docs.stripe.com/docs/invoicing/partial-payments) to learn more.
  """
  @spec attach_payment(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def attach_payment(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/attach_payment",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Create an invoice

  This endpoint creates a draft invoice for a given customer. The invoice remains a draft until you [finalize](#finalize_invoice) the invoice, which allows you to [pay](https://docs.stripe.com/api/invoices/pay) or [send](https://docs.stripe.com/api/invoices/send) the invoice to your customers.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/invoices", Keyword.merge(opts, params: params))
  end

  @doc """
  Create a preview invoice

  At any time, you can preview the upcoming invoice for a subscription or subscription schedule. This will show you all the charges that are pending, including subscription renewal charges, invoice item charges, etc. It will also show you any discounts that are applicable to the invoice.

  You can also preview the effects of creating or updating a subscription or subscription schedule, including a preview of any prorations that will take place. To ensure that the actual proration is calculated exactly the same as the previewed proration, you should pass the `subscription_details.proration_date` parameter when doing the actual subscription update.

  The recommended way to get only the prorations being previewed on the invoice is to consider line items where `parent.subscription_item_details.proration` is `true`.

  Note that when you are viewing an upcoming invoice, you are simply viewing a preview – the invoice has not yet been created. As such, the upcoming invoice will not show up in invoice listing calls, and you cannot use the API to pay or edit the invoice. If you want to change the amount that your customer will be billed, you can add, remove, or update pending invoice items, or update the customer’s discount.

  Note: Currency conversion calculations use the latest exchange rates. Exchange rates may vary between the time of the preview and the time of the actual invoice creation. [Learn more](https://docs.stripe.com/currencies/conversions)
  """
  @spec create_preview(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def create_preview(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/create_preview",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Delete a draft invoice

  Permanently deletes a one-off invoice draft. This cannot be undone. Attempts to delete invoices that are no longer in a draft state will fail; once an invoice has been finalized or if an invoice is for a subscription, it must be [voided](#void_invoice).
  """
  @spec delete(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def delete(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :delete,
      "/v1/invoices/#{invoice}",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Finalize an invoice

  Stripe automatically finalizes drafts before sending and attempting payment on invoices. However, if you’d like to finalize a draft invoice manually, you can do so using this method.
  """
  @spec finalize_invoice(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def finalize_invoice(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/finalize",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  List all invoices

  You can list all invoices, or list the invoices for a specific customer. The invoices are returned sorted by creation date, with the most recently created invoices appearing first.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/invoices", Keyword.merge(opts, params: params))
  end

  @doc """
  Mark an invoice as uncollectible

  Marking an invoice as uncollectible is useful for keeping track of bad debts that can be written off for accounting purposes.
  """
  @spec mark_uncollectible(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def mark_uncollectible(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/mark_uncollectible",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Pay an invoice

  Stripe automatically creates and then attempts to collect payment on invoices for customers on subscriptions according to your [subscriptions settings](https://dashboard.stripe.com/account/billing/automatic). However, if you’d like to attempt payment on an invoice out of the normal collection schedule or for some other reason, you can do so.
  """
  @spec pay(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def pay(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/pay",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Bulk remove invoice line items

  Removes multiple line items from an invoice. This is only possible when an invoice is still a draft.
  """
  @spec remove_lines(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def remove_lines(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/remove_lines",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Retrieve an invoice

  Retrieves the invoice with the given ID.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def retrieve(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/invoices/#{invoice}", Keyword.merge(opts, params: params))
  end

  @doc """
  Search invoices

  Search for invoices you’ve previously created using Stripe’s [Search Query Language](https://docs.stripe.com/docs/search#search-query-language).
  Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating
  conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up
  to an hour behind during outages. Search functionality is not available to merchants in India.
  """
  @spec search(Client.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def search(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/invoices/search", Keyword.merge(opts, params: params))
  end

  @doc """
  Send an invoice for manual payment

  Stripe will automatically send invoices to customers according to your [subscriptions settings](https://dashboard.stripe.com/account/billing/automatic). However, if you’d like to manually send an invoice to your customer out of the normal schedule, you can do so. When sending invoices that have already been paid, there will be no reference to the payment in the email.

  Requests made in test-mode result in no emails being sent, despite sending an `invoice.sent` event.
  """
  @spec send_invoice(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def send_invoice(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/send",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Update an invoice

  Draft invoices are fully editable. Once an invoice is [finalized](https://docs.stripe.com/docs/billing/invoices/workflow#finalized),
  monetary values, as well as `collection_method`, become uneditable.

  If you would like to stop the Stripe Billing engine from automatically finalizing, reattempting payments on,
  sending reminders for, or [automatically reconciling](https://docs.stripe.com/docs/billing/invoices/reconciliation) invoices, pass
  `auto_advance=false`.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/invoices/#{invoice}", Keyword.merge(opts, params: params))
  end

  @doc """
  Bulk update invoice line items

  Updates multiple line items on an invoice. This is only possible when an invoice is still a draft.
  """
  @spec update_lines(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def update_lines(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/update_lines",
      Keyword.merge(opts, params: params)
    )
  end

  @doc """
  Void an invoice

  Mark a finalized invoice as void. This cannot be undone. Voiding an invoice is similar to [deletion](#delete_invoice), however it only applies to finalized invoices and maintains a papertrail where the invoice can still be found.

  Consult with local regulations to determine whether and how an invoice might be amended, canceled, or voided in the jurisdiction you’re doing business in. You might need to [issue another invoice](#create_invoice) or [credit note](#create_credit_note) instead. Stripe recommends that you consult with your legal counsel for advice specific to your business.
  """
  @spec void_invoice(Client.t(), String.t(), map(), keyword()) ::
          {:ok, term()} | {:error, Stripe.Error.t()}
  def void_invoice(client, invoice, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/invoices/#{invoice}/void",
      Keyword.merge(opts, params: params)
    )
  end
end
