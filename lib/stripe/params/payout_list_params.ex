# File generated from our OpenAPI spec
defmodule Stripe.Params.PayoutListParams do
  @moduledoc "Parameters for payout list."

  @typedoc """
  * `arrival_date` - Only return payouts that are expected to arrive during the given date interval.
  * `created` - Only return payouts that were created during the given date interval.
  * `destination` - The ID of an external account - only return payouts sent to this external account.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return payouts that have the given status: `pending`, `paid`, `failed`, or `canceled`. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :arrival_date,
    :created,
    :destination,
    :ending_before,
    :expand,
    :limit,
    :starting_after,
    :status
  ]
end
