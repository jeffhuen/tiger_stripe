# File generated from our OpenAPI spec
defmodule Stripe.Params.QuoteListParams do
  @moduledoc "Parameters for quote list."

  @typedoc """
  * `customer` - The ID of the customer whose quotes you're retrieving. Max length: 5000.
  * `customer_account` - The ID of the account representing the customer whose quotes you're retrieving. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - The status of the quote. Possible values: `accepted`, `canceled`, `draft`, `open`.
  * `test_clock` - Provides a list of quotes that are associated with the specified test clock. The response will not include quotes with test clocks if this and the customer parameter is not set. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :customer,
    :customer_account,
    :ending_before,
    :expand,
    :limit,
    :starting_after,
    :status,
    :test_clock
  ]
end
