# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.PersonalizationDesignListParams do
  @moduledoc "Parameters for personalization design list."

  @typedoc """
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `lookup_keys` - Only return personalization designs with the given lookup keys.
  * `preferences` - Only return personalization designs with the given preferences.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  * `status` - Only return personalization designs with the given status. Possible values: `active`, `inactive`, `rejected`, `review`.
  """
  @type t :: %__MODULE__{
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          lookup_keys: [String.t()] | nil,
          preferences: preferences() | nil,
          starting_after: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [
    :ending_before,
    :expand,
    :limit,
    :lookup_keys,
    :preferences,
    :starting_after,
    :status
  ]

  @typedoc """
  * `is_default` - Only return the personalization design that's set as the default. A connected account uses the Connect platform's default design if no personalization design is set as the default.
  * `is_platform_default` - Only return the personalization design that is set as the Connect platform's default. This parameter is only applicable to connected accounts.
  """
  @type preferences :: %{
          optional(:is_default) => boolean() | nil,
          optional(:is_platform_default) => boolean() | nil,
          optional(String.t()) => term()
        }
end
