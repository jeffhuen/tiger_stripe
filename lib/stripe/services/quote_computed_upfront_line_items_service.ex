# File generated from our OpenAPI spec
defmodule Stripe.Services.QuoteComputedUpfrontLineItemsService do
  @moduledoc """
  QuoteComputedUpfrontLineItems API operations.
  """
  alias Stripe.Client

  @doc """
  Retrieve a quote's upfront line items

  When retrieving a quote, there is an includable [**computed.upfront.line_items**](https://stripe.com/docs/api/quotes/object#quote_object-computed-upfront-line_items) property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of upfront line items.
  """
  @spec list_computed_upfront_line_items(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Stripe.ListObject.t()} | {:error, Stripe.Error.t()}
  def list_computed_upfront_line_items(client, quote, params \\ %{}, opts \\ []) do
    Client.request(
      client,
      :get,
      "/v1/quotes/#{quote}/computed_upfront_line_items",
      Keyword.merge(opts, params: params)
    )
  end
end
