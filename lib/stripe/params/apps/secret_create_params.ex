# File generated from our OpenAPI spec
defmodule Stripe.Params.Apps.SecretCreateParams do
  @moduledoc "Parameters for secret create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - The Unix timestamp for the expiry time of the secret, after which the secret deletes. Format: Unix timestamp.
  * `name` - A name for the secret that's unique within the scope. Max length: 5000.
  * `payload` - The plaintext secret value to be stored. Max length: 5000.
  * `scope` - Specifies the scoping of the secret. Requests originating from UI extensions can only access account-scoped secrets or secrets scoped to their own user.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :expires_at, :name, :payload, :scope]
end
