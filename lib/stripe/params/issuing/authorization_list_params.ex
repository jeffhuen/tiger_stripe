# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.AuthorizationListParams do
  @moduledoc "Parameters for authorization list."

  @typedoc """
  * `card` - Only return authorizations that belong to the given card. Max length: 5000.
  * `cardholder` - Only return authorizations that belong to the given cardholder. Max length: 5000.
  * `created` - Only return authorizations that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return authorizations with the given status. One of `pending`, `closed`, or `reversed`. Possible values: `closed`, `expired`, `pending`, `reversed`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :card,
    :cardholder,
    :created,
    :ending_before,
    :expand,
    :limit,
    :starting_after,
    :status
  ]
end
