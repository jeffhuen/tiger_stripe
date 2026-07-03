# File generated from our OpenAPI spec
defmodule Stripe.Params.ExchangeRateListParams do
  @moduledoc "Parameters for exchange rate list."

  @typedoc """
  * `ending_before` - A cursor for use in pagination. `ending_before` is the currency that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with the exchange rate for currency X your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and total number of supported payout currencies, and the default is the max.
  * `starting_after` - A cursor for use in pagination. `starting_after` is the currency that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with the exchange rate for currency X, your subsequent call can include `starting_after=X` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:ending_before, :expand, :limit, :starting_after]
end
