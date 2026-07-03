# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.AccountPersonToken do
  @moduledoc """
  Person Token

  Person Tokens are single-use tokens which tokenize person information, and are used for creating or updating a Person.
  """

  @typedoc """
  * `created` - Time at which the token was created. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `expires_at` - Time at which the token will expire. Format: date-time.
  * `id` - Unique identifier for the token.
  * `livemode` - Has the value `true` if the token exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.account_person_token`.
  * `used` - Determines if the token has already been used (tokens can only be used once).
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :expires_at, :id, :livemode, :object, :used]

  @object_name "v2.core.account_person_token"
  def object_name, do: @object_name
end
