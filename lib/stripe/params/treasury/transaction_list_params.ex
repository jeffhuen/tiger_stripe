# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.TransactionListParams do
  @moduledoc "Parameters for transaction list."

  @typedoc """
  * `created` - Only return Transactions that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - Returns objects associated with this FinancialAccount.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `order_by` - The results are in reverse chronological order by `created` or `posted_at`. The default is `created`. Possible values: `created`, `posted_at`.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return Transactions that have the given status: `open`, `posted`, or `void`. Possible values: `open`, `posted`, `void`.
  * `status_transitions` - A filter for the `status_transitions.posted_at` timestamp. When using this filter, `status=posted` and `order_by=posted_at` must also be specified.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :ending_before,
    :expand,
    :financial_account,
    :limit,
    :order_by,
    :starting_after,
    :status,
    :status_transitions
  ]
end
