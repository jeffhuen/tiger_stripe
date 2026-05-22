# File generated from our OpenAPI spec
defmodule Stripe.Services.CreditNotePreviewLinesService do
  @moduledoc """
  CreditNotePreviewLines API operations.
  """
  alias Stripe.Client

  @doc """
  Retrieve a credit note preview's line items

  When retrieving a credit note preview, you’ll get a **lines** property containing the first handful of those items. This URL you can retrieve the full (paginated) list of line items.
  """
  @spec preview_lines(Client.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def preview_lines(client, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/credit_notes/preview/lines",
      Keyword.merge(opts, params: params)
    )
  end
end
