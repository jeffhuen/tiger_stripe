# File generated from our OpenAPI spec
defmodule Stripe.Params.TaxIdListParams do
  @moduledoc "Parameters for tax id list."

  @typedoc """
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `owner` - The account or customer the tax ID belongs to. Defaults to `owner[type]=self`.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          owner: owner() | nil,
          starting_after: String.t() | nil
        }

  defstruct [:ending_before, :expand, :limit, :owner, :starting_after]

  @typedoc """
  * `account` - Connected Account the tax ID belongs to. Required when `type=account`
  * `customer` - Customer the tax ID belongs to. Required when `type=customer` Max length: 5000.
  * `customer_account` - ID of the Account representing the customer that the tax ID belongs to. Can be used in place of `customer` when `type=customer` Max length: 5000.
  * `type` - Type of owner referenced. Possible values: `account`, `application`, `customer`, `self`.
  """
  @type owner :: %{
          optional(:account) => String.t() | nil,
          optional(:customer) => String.t() | nil,
          optional(:customer_account) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }
end
