# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardholderListParams do
  @moduledoc "Parameters for cardholder list."

  @typedoc """
  * `created` - Only return cardholders that were created during the given date interval.
  * `email` - Only return cardholders that have the given email address.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `phone_number` - Only return cardholders that have the given phone number.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return cardholders that have the given status. One of `active`, `inactive`, or `blocked`. Possible values: `active`, `blocked`, `inactive`.
  * `type` - Only return cardholders that have the given type. One of `individual` or `company`. Possible values: `company`, `individual`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :email,
    :ending_before,
    :expand,
    :limit,
    :phone_number,
    :starting_after,
    :status,
    :type
  ]
end
