# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceSearchParams do
  @moduledoc "Parameters for invoice search."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `page` - A cursor for pagination across multiple pages of results. Don't include this parameter on the first call. Use the next_page value returned in a previous response to request subsequent results. Max length: 5000.
  * `query` - The search query string. See [search query language](https://docs.stripe.com/search#search-query-language) and the list of supported [query fields for invoices](https://docs.stripe.com/search#query-fields-for-invoices). Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :limit, :page, :query]
end
