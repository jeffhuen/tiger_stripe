# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.CardListParams do
  @moduledoc "Parameters for card list."

  @typedoc """
  * `cardholder` - Only return cards belonging to the Cardholder with the provided ID. Max length: 5000.
  * `created` - Only return cards that were issued during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `exp_month` - Only return cards that have the given expiration month.
  * `exp_year` - Only return cards that have the given expiration year.
  * `expand` - Specifies which fields in the response should be expanded.
  * `last4` - Only return cards that have the given last four digits. Max length: 5000.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `personalization_design` - Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return cards that have the given status. One of `active`, `inactive`, or `canceled`. Possible values: `active`, `canceled`, `inactive`.
  * `type` - Only return cards that have the given type. One of `virtual` or `physical`. Possible values: `physical`, `virtual`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :cardholder,
    :created,
    :ending_before,
    :exp_month,
    :exp_year,
    :expand,
    :last4,
    :limit,
    :personalization_design,
    :starting_after,
    :status,
    :type
  ]
end
