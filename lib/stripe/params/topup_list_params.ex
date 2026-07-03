# File generated from our OpenAPI spec
defmodule Stripe.Params.TopupListParams do
  @moduledoc "Parameters for topup list."

  @typedoc """
  * `amount` - A positive integer representing how much to transfer.
  * `created` - A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return top-ups that have the given status. One of `canceled`, `failed`, `pending` or `succeeded`. Possible values: `canceled`, `failed`, `pending`, `succeeded`. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :created, :ending_before, :expand, :limit, :starting_after, :status]
end
