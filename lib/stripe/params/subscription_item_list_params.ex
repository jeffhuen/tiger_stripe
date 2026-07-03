# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionItemListParams do
  @moduledoc "Parameters for subscription item list."

  @typedoc """
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
  * `subscription` - The ID of the subscription whose items will be retrieved. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:ending_before, :expand, :limit, :starting_after, :subscription]
end
