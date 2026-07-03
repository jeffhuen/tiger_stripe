# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentAttemptRecordListParams do
  @moduledoc "Parameters for payment attempt record list."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `payment_record` - The ID of the Payment Record. Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :limit, :payment_record, :starting_after]
end
