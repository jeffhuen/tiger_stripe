# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.TokenUpdateParams do
  @moduledoc "Parameters for token update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `status` - Specifies which status the token should be updated to. Possible values: `active`, `deleted`, `suspended`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :status]
end
