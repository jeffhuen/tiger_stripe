# File generated from our OpenAPI spec
defmodule Stripe.Services.CreditNoteService do
  @moduledoc """
  CreditNote

  Issue a credit note to adjust an invoice's amount after the invoice is finalized.

  Related guide: [Credit notes](https://docs.stripe.com/billing/invoices/credit-notes)
  """
  alias Stripe.Client

  @doc """
  Create a credit note

  Issue a credit note to adjust the amount of a finalized invoice. A credit note will first reduce the invoice’s `amount_remaining` (and `amount_due`), but not below zero.
  This amount is indicated by the credit note’s `pre_payment_amount`. The excess amount is indicated by `post_payment_amount`, and it can result in any combination of the following:

  * Refunds: create a new refund (using `refund_amount`) or link existing refunds (using `refunds`).
  * Customer balance credit: credit the customer’s balance (using `credit_amount`) which will be automatically applied to their next invoice when it’s finalized.
  * Outside of Stripe credit: record the amount that is or will be credited outside of Stripe (using `out_of_band_amount`).

  The sum of refunds, customer balance credits, and outside of Stripe credits must equal the `post_payment_amount`.

  You may issue multiple credit notes for an invoice. Each credit note may increment the invoice’s `pre_payment_credit_notes_amount`,
  `post_payment_credit_notes_amount`, or both, depending on the invoice’s `amount_remaining` at the time of credit note creation.
  """
  @spec create(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CreditNote.t()} | {:error, Stripe.Error.t()}
  def create(client, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/credit_notes", Keyword.merge(opts, params: params))
  end

  @doc """
  List all credit notes

  Returns a list of credit notes.
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/credit_notes", Keyword.merge(opts, params: params))
  end

  @doc """
  Preview a credit note

  Get a preview of a credit note without creating it.
  """
  @spec preview(Client.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CreditNote.t()} | {:error, Stripe.Error.t()}
  def preview(client, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/credit_notes/preview", Keyword.merge(opts, params: params))
  end

  @doc """
  Retrieve a credit note

  Retrieves the credit note object with the given identifier.
  """
  @spec retrieve(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CreditNote.t()} | {:error, Stripe.Error.t()}
  def retrieve(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :get, "/v1/credit_notes/#{id}", Keyword.merge(opts, params: params))
  end

  @doc """
  Update a credit note

  Updates an existing credit note.
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CreditNote.t()} | {:error, Stripe.Error.t()}
  def update(client, id, params \\ %{}, opts \\ []) do
    Client.request(client, :post, "/v1/credit_notes/#{id}", Keyword.merge(opts, params: params))
  end

  @doc """
  Void a credit note

  Marks a credit note as void. Learn more about [voiding credit notes](https://docs.stripe.com/docs/billing/invoices/credit-notes#voiding).
  """
  @spec void_credit_note(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.Resources.CreditNote.t()} | {:error, Stripe.Error.t()}
  def void_credit_note(client, id, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :post,
      "/v1/credit_notes/#{id}/void",
      Keyword.merge(opts, params: params)
    )
  end
end
