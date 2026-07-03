# File generated from our OpenAPI spec
defmodule Stripe.Params.Checkout.SessionListParams do
  @moduledoc "Parameters for session list."

  @typedoc """
  * `created` - Only return Checkout Sessions that were created during the given date interval.
  * `customer` - Only return the Checkout Sessions for the Customer specified. Max length: 5000.
  * `customer_account` - Only return the Checkout Sessions for the Account specified. Max length: 5000.
  * `customer_details` - Only return the Checkout Sessions for the Customer details specified.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `payment_intent` - Only return the Checkout Session for the PaymentIntent specified. Max length: 5000.
  * `payment_link` - Only return the Checkout Sessions for the Payment Link specified. Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return the Checkout Sessions matching the given status. Possible values: `complete`, `expired`, `open`.
  * `subscription` - Only return the Checkout Session for the subscription specified. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :customer,
    :customer_account,
    :customer_details,
    :ending_before,
    :expand,
    :limit,
    :payment_intent,
    :payment_link,
    :starting_after,
    :status,
    :subscription
  ]
end
