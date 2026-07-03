# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.DebitReversalListParams do
  @moduledoc "Parameters for debit reversal list."

  @typedoc """
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - Returns objects associated with this FinancialAccount.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `received_debit` - Only return DebitReversals for the ReceivedDebit ID. Max length: 5000.
  * `resolution` - Only return DebitReversals for a given resolution. Possible values: `lost`, `won`.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return DebitReversals for a given status. Possible values: `canceled`, `completed`, `processing`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :ending_before,
    :expand,
    :financial_account,
    :limit,
    :received_debit,
    :resolution,
    :starting_after,
    :status
  ]
end
