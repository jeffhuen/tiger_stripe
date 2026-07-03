# File generated from our OpenAPI spec
defmodule Stripe.Params.PromotionCodeListParams do
  @moduledoc "Parameters for promotion code list."

  @typedoc """
  * `active` - Filter promotion codes by whether they are active.
  * `code` - Only return promotion codes that have this case-insensitive code. Max length: 5000.
  * `coupon` - Only return promotion codes for this coupon. Max length: 5000.
  * `created` - A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options.
  * `customer` - Only return promotion codes that are restricted to this customer. Max length: 5000.
  * `customer_account` - Only return promotion codes that are restricted to this account representing the customer. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :code,
    :coupon,
    :created,
    :customer,
    :customer_account,
    :ending_before,
    :expand,
    :limit,
    :starting_after
  ]
end
