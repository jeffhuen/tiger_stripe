# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceListParams do
  @moduledoc "Parameters for invoice list."

  @typedoc """
  * `collection_method` - The collection method of the invoice to retrieve. Either `charge_automatically` or `send_invoice`. Possible values: `charge_automatically`, `send_invoice`.
  * `created` - Only return invoices that were created during the given date interval.
  * `customer` - Only return invoices for the customer specified by this customer ID. Max length: 5000.
  * `customer_account` - Only return invoices for the account representing the customer specified by this account ID. Max length: 5000.
  * `due_date`
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://docs.stripe.com/billing/invoices/workflow#workflow-overview) Possible values: `draft`, `open`, `paid`, `uncollectible`, `void`.
  * `subscription` - Only return invoices for the subscription specified by this subscription ID. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :collection_method,
    :created,
    :customer,
    :customer_account,
    :due_date,
    :ending_before,
    :expand,
    :limit,
    :starting_after,
    :status,
    :subscription
  ]
end
