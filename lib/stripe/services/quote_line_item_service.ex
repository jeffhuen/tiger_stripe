# File generated from our OpenAPI spec
defmodule Stripe.Services.QuoteLineItemService do
  @moduledoc """
  QuoteLineItem API operations.
  """
  alias Stripe.Client

  @doc """
  Retrieve a quote's line items

  When retrieving a quote, there is an includable **line_items** property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  """
  @spec list_line_items(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list_line_items(client, quote, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/quotes/#{quote}/line_items",
      Keyword.merge(opts, params: params)
    )
  end
end
