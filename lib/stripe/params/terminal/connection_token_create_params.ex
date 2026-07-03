# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.ConnectionTokenCreateParams do
  @moduledoc "Parameters for connection token create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `location` - The id of the location that this connection token is scoped to. If specified the connection token will only be usable with readers assigned to that location, otherwise the connection token will be usable with all readers. Note that location scoping only applies to internet-connected readers. For more details, see [the docs on scoping connection tokens](https://docs.stripe.com/terminal/fleet/locations-and-zones?dashboard-or-api=api#connection-tokens). Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :location]
end
