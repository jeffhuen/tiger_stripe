# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceItemListParams do
  @moduledoc "Parameters for invoice item list."

  @typedoc """
  * `created` - Only return invoice items that were created during the given date interval.
  * `customer` - The identifier of the customer whose invoice items to return. If none is provided, returns all invoice items. Max length: 5000.
  * `customer_account` - The identifier of the account representing the customer whose invoice items to return. If none is provided, returns all invoice items. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice` - Only return invoice items belonging to this invoice. If none is provided, all invoice items will be returned. If specifying an invoice, no customer identifier is needed. Max length: 5000.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `pending` - Set to `true` to only show pending invoice items, which are not yet attached to any invoices. Set to `false` to only show invoice items already attached to invoices. If unspecified, no filter is applied.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :customer,
    :customer_account,
    :ending_before,
    :expand,
    :invoice,
    :limit,
    :pending,
    :starting_after
  ]
end
