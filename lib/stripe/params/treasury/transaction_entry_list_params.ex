# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.TransactionEntryListParams do
  @moduledoc "Parameters for transaction entry list."

  @typedoc """
  * `created` - Only return TransactionEntries that were created during the given date interval.
  * `effective_at`
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - Returns objects associated with this FinancialAccount.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `order_by` - The results are in reverse chronological order by `created` or `effective_at`. The default is `created`. Possible values: `created`, `effective_at`.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `transaction` - Only return TransactionEntries associated with this Transaction. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :effective_at,
    :ending_before,
    :expand,
    :financial_account,
    :limit,
    :order_by,
    :starting_after,
    :transaction
  ]
end
