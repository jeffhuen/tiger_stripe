# File generated from our OpenAPI spec
defmodule Stripe.Params.TaxRateListParams do
  @moduledoc "Parameters for tax rate list."

  @typedoc """
  * `active` - Optional flag to filter by tax rates that are either active or inactive (archived).
  * `created` - Optional range for filtering created date.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `inclusive` - Optional flag to filter by tax rates that are inclusive (or those that are not inclusive).
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:active, :created, :ending_before, :expand, :inclusive, :limit, :starting_after]
end
