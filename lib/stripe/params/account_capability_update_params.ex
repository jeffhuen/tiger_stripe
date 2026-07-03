# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountCapabilityUpdateParams do
  @moduledoc "Parameters for account capability update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `requested` - To request a new capability for an account, pass true. There can be a delay before the requested capability becomes active. If the capability has any activation requirements, the response includes them in the `requirements` arrays.

  If a capability isn't permanent, you can remove it from the account by passing false. Some capabilities are permanent after they've been requested. Attempting to remove a permanent capability returns an error.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :requested]
end
