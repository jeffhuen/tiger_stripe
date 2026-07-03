# File generated from our OpenAPI spec
defmodule Stripe.Params.Apps.SecretDeleteWhereParams do
  @moduledoc "Parameters for secret delete where."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `name` - A name for the secret that's unique within the scope. Max length: 5000.
  * `scope` - Specifies the scoping of the secret. Requests originating from UI extensions can only access account-scoped secrets or secrets scoped to their own user.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :name, :scope]
end
