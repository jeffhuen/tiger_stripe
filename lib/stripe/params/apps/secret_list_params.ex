# File generated from our OpenAPI spec
defmodule Stripe.Params.Apps.SecretListParams do
  @moduledoc "Parameters for secret list."

  @typedoc """
  * `ending_before` - A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `scope` - Specifies the scoping of the secret. Requests originating from UI extensions can only access account-scoped secrets or secrets scoped to their own user.
  * `starting_after` - A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list. Max length: 5000.
  """
  @type t :: %__MODULE__{
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          scope: scope(),
          starting_after: String.t() | nil
        }

  defstruct [:ending_before, :expand, :limit, :scope, :starting_after]

  @typedoc """
  * `type` - The secret scope type. Possible values: `account`, `user`.
  * `user` - The user ID. This field is required if `type` is set to `user`, and should not be provided if `type` is set to `account`. Max length: 5000.
  """
  @type scope :: %{
          optional(:type) => String.t() | nil,
          optional(:user) => String.t() | nil,
          optional(String.t()) => term()
        }
end
