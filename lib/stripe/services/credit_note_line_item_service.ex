# File generated from our OpenAPI spec
defmodule Stripe.Services.CreditNoteLineItemService do
  @moduledoc """
  CreditNoteLineItem

  The credit note line item object
  """
  alias Stripe.Client

  @doc """
  Retrieve a credit note's line items

  When retrieving a credit note, you’ll get a **lines** property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list(client, credit_note, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/credit_notes/#{credit_note}/lines",
      Keyword.merge(opts, params: params)
    )
  end
end
