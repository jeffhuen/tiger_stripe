# File generated from our OpenAPI spec
defmodule Stripe.Params.DisputeListParams do
  @moduledoc "Parameters for dispute list."

  @typedoc """
  * `charge` - Only return disputes associated to the charge specified by this charge ID. Max length: 5000.
  * `created` - Only return disputes that were created during the given date interval.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `payment_intent` - Only return disputes associated to the PaymentIntent specified by this PaymentIntent ID. Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:charge, :created, :ending_before, :expand, :limit, :payment_intent, :starting_after]
end
