# File generated from our OpenAPI spec
defmodule Stripe.Params.FinancialConnections.TransactionListParams do
  @moduledoc "Parameters for transaction list."

  @typedoc """
  * `account` - The ID of the Financial Connections Account whose transactions will be retrieved. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `transacted_at` - A filter on the list based on the object `transacted_at` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with the following options:
  * `transaction_refresh` - A filter on the list based on the object `transaction_refresh` field. The value can be a dictionary with the following options:
  """
  @type t :: %__MODULE__{
          account: String.t(),
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          starting_after: String.t() | nil,
          transacted_at: map() | nil,
          transaction_refresh: transaction_refresh() | nil
        }

  defstruct [
    :account,
    :ending_before,
    :expand,
    :limit,
    :starting_after,
    :transacted_at,
    :transaction_refresh
  ]

  @typedoc """
  * `after` - Return results where the transactions were created or updated by a refresh that took place after this refresh (non-inclusive). Max length: 5000.
  """
  @type transaction_refresh :: %{
          optional(:after) => String.t() | nil,
          optional(String.t()) => term()
        }
end
