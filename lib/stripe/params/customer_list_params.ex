# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerListParams do
  @moduledoc "Parameters for customer list."

  @typedoc """
  * `created` - Only return customers that were created during the given date interval.
  * `email` - A case-sensitive filter on the list based on the customer's `email` field. The value must be a string. Max length: 512.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `test_clock` - Provides a list of customers that are associated with the specified test clock. The response will not include customers with test clocks if this parameter is not set. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :email, :ending_before, :expand, :limit, :starting_after, :test_clock]
end
