# File generated from our OpenAPI spec
defmodule Stripe.Params.FileLinkListParams do
  @moduledoc "Parameters for file link list."

  @typedoc """
  * `created` - Only return links that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
  * `expand` - Specifies which fields in the response should be expanded.
  * `expired` - Filter links by their expiration status. By default, Stripe returns all links.
  * `file` - Only return links for the given file. Max length: 5000.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :ending_before, :expand, :expired, :file, :limit, :starting_after]
end
