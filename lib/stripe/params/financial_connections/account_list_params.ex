# File generated from our OpenAPI spec
defmodule Stripe.Params.FinancialConnections.AccountListParams do
  @moduledoc "Parameters for account list."

  @typedoc """
  * `account_holder` - If present, only return accounts that belong to the specified account holder. `account_holder[customer]` and `account_holder[account]` are mutually exclusive.
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `session` - If present, only return accounts that were collected as part of the given session. Max length: 5000.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{
          account_holder: account_holder() | nil,
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          session: String.t() | nil,
          starting_after: String.t() | nil
        }

  defstruct [:account_holder, :ending_before, :expand, :limit, :session, :starting_after]

  @typedoc """
  * `account` - The ID of the Stripe account whose accounts you will retrieve. Max length: 5000.
  * `customer` - The ID of the Stripe customer whose accounts you will retrieve. Max length: 5000.
  * `customer_account` - The ID of the Account representing a customer whose accounts you will retrieve. Max length: 5000.
  """
  @type account_holder :: %{
          optional(:account) => String.t() | nil,
          optional(:customer) => String.t() | nil,
          optional(:customer_account) => String.t() | nil,
          optional(String.t()) => term()
        }
end
