# File generated from our OpenAPI spec
defmodule Stripe.Params.PriceListParams do
  @moduledoc "Parameters for price list."

  @typedoc """
  * `active` - Only return prices that are active or inactive (e.g., pass `false` to list all inactive prices).
  * `created` - A filter on the list, based on the object `created` field. The value can be a string with an integer Unix timestamp, or it can be a dictionary with a number of different query options.
  * `currency` - Only return prices for the given currency. Format: ISO 4217 currency code.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `lookup_keys` - Only return the price with these lookup_keys, if any exist. You can specify up to 10 lookup_keys.
  * `product` - Only return prices for the given product. Max length: 5000.
  * `recurring` - Only return prices with these recurring fields.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `type` - Only return prices of type `recurring` or `one_time`. Possible values: `one_time`, `recurring`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :created,
    :currency,
    :ending_before,
    :expand,
    :limit,
    :lookup_keys,
    :product,
    :recurring,
    :starting_after,
    :type
  ]
end
