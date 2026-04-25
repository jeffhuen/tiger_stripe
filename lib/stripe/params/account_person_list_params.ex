# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountPersonListParams do
  @moduledoc "Parameters for account person list."

  @typedoc """
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `relationship` - Filters on the list of people returned based on the person's relationship to the account's company.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          relationship: relationship() | nil,
          starting_after: String.t() | nil
        }

  defstruct [:ending_before, :expand, :limit, :relationship, :starting_after]

  @typedoc """
  * `authorizer` - A filter on the list of people returned based on whether these people are authorizers of the account's representative.
  * `director` - A filter on the list of people returned based on whether these people are directors of the account's company.
  * `executive` - A filter on the list of people returned based on whether these people are executives of the account's company.
  * `legal_guardian` - A filter on the list of people returned based on whether these people are legal guardians of the account's representative.
  * `owner` - A filter on the list of people returned based on whether these people are owners of the account's company.
  * `representative` - A filter on the list of people returned based on whether these people are the representative of the account's company.
  """
  @type relationship :: %{
          optional(:authorizer) => boolean() | nil,
          optional(:director) => boolean() | nil,
          optional(:executive) => boolean() | nil,
          optional(:legal_guardian) => boolean() | nil,
          optional(:owner) => boolean() | nil,
          optional(:representative) => boolean() | nil,
          optional(String.t()) => term()
        }
end
