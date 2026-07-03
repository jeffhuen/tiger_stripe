# File generated from our OpenAPI spec
defmodule Stripe.Params.Radar.ValueListListParams do
  @moduledoc "Parameters for value list list."

  @typedoc """
  * `alias` - The alias used to reference the value list when writing rules. Max length: 100.
  * `contains` - A value contained within a value list - returns all value lists containing this value. Max length: 800.
  * `created` - Only return value lists that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:alias, :contains, :created, :ending_before, :expand, :limit, :starting_after]
end
