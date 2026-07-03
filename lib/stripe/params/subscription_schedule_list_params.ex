# File generated from our OpenAPI spec
defmodule Stripe.Params.SubscriptionScheduleListParams do
  @moduledoc "Parameters for subscription schedule list."

  @typedoc """
  * `canceled_at` - Only return subscription schedules that were created canceled the given date interval.
  * `completed_at` - Only return subscription schedules that completed during the given date interval.
  * `created` - Only return subscription schedules that were created during the given date interval.
  * `customer` - Only return subscription schedules for the given customer. Max length: 5000.
  * `customer_account` - Only return subscription schedules for the given account. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `released_at` - Only return subscription schedules that were released during the given date interval.
  * `scheduled` - Only return subscription schedules that have not started yet.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :canceled_at,
    :completed_at,
    :created,
    :customer,
    :customer_account,
    :ending_before,
    :expand,
    :limit,
    :released_at,
    :scheduled,
    :starting_after
  ]
end
