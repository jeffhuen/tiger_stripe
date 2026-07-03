# File generated from our OpenAPI spec
defmodule Stripe.Params.ChargeListParams do
  @moduledoc "Parameters for charge list."

  @typedoc """
  * `created` - Only return charges that were created during the given date interval.
  * `customer` - Only return charges for the customer specified by this customer ID. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `payment_intent` - Only return charges that were created by the PaymentIntent specified by this PaymentIntent ID. Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
  * `transfer_group` - Only return charges for this transfer group, limited to 100. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :customer,
    :ending_before,
    :expand,
    :limit,
    :payment_intent,
    :starting_after,
    :transfer_group
  ]
end
