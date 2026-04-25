# File generated from our OpenAPI spec
defmodule Stripe.Params.Forwarding.RequestListParams do
  @moduledoc "Parameters for request list."

  @typedoc """
  * `created` - Similar to other List endpoints, filters results based on created timestamp. You can pass gt, gte, lt, and lte timestamp values.
  * `ending_before` - A pagination cursor to fetch the previous page of the list. The value must be a ForwardingRequest ID. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `limit` - A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 10.
  * `starting_after` - A pagination cursor to fetch the next page of the list. The value must be a ForwardingRequest ID. Max length: 5000.
  """
  @type t :: %__MODULE__{
          created: created() | nil,
          ending_before: String.t() | nil,
          expand: [String.t()] | nil,
          limit: integer() | nil,
          starting_after: String.t() | nil
        }

  defstruct [:created, :ending_before, :expand, :limit, :starting_after]

  @typedoc """
  * `gt` - Return results where the `created` field is greater than this value.
  * `gte` - Return results where the `created` field is greater than or equal to this value.
  * `lt` - Return results where the `created` field is less than this value.
  * `lte` - Return results where the `created` field is less than or equal to this value.
  """
  @type created :: %{
          optional(:gt) => integer() | nil,
          optional(:gte) => integer() | nil,
          optional(:lt) => integer() | nil,
          optional(:lte) => integer() | nil,
          optional(String.t()) => term()
        }
end
