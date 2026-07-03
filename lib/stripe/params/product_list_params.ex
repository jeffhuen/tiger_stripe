# File generated from our OpenAPI spec
defmodule Stripe.Params.ProductListParams do
  @moduledoc "Parameters for product list."

  @typedoc """
  * `active` - Only return products that are active or inactive (e.g., pass `false` to list all inactive products).
  * `created` - Only return products that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `ids` - Only return products with the given IDs. Cannot be used with [starting_after](https://api.stripe.com#list_products-starting_after) or [ending_before](https://api.stripe.com#list_products-ending_before).
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `shippable` - Only return products that can be shipped (i.e., physical, not digital products).
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `type` - Only return products of this type. Possible values: `good`, `service`.
  * `url` - Only return products with the given url. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :created,
    :ending_before,
    :expand,
    :ids,
    :limit,
    :shippable,
    :starting_after,
    :type,
    :url
  ]
end
