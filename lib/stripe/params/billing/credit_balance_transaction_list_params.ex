# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.CreditBalanceTransactionListParams do
  @moduledoc "Parameters for credit balance transaction list."

  @typedoc """
  * `credit_grant` - The credit grant for which to fetch credit balance transactions. Max length: 5000.
  * `customer` - The customer whose credit balance transactions you're retrieving. Max length: 5000.
  * `customer_account` - The account representing the customer whose credit balance transactions you're retrieving. Max length: 5000.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :credit_grant,
    :customer,
    :customer_account,
    :ending_before,
    :expand,
    :limit,
    :starting_after
  ]
end
