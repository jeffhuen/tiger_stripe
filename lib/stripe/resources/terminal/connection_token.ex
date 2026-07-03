# File generated from our OpenAPI spec
defmodule Stripe.Resources.Terminal.ConnectionToken do
  @moduledoc """
  TerminalConnectionToken

  A Connection Token is used by the Stripe Terminal SDK to connect to a reader.

  Related guide: [Fleet management](https://docs.stripe.com/terminal/fleet/locations)
  """

  @typedoc """
  * `location` - The id of the location that this connection token is scoped to. Note that location scoping only applies to internet-connected readers. For more details, see [the docs on scoping connection tokens](https://docs.stripe.com/terminal/fleet/locations-and-zones?dashboard-or-api=api#connection-tokens). Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `terminal.connection_token`.
  * `secret` - Your application should pass this token to the Stripe Terminal SDK. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:location, :object, :secret]

  @object_name "terminal.connection_token"
  def object_name, do: @object_name
end
