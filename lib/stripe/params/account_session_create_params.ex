# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountSessionCreateParams do
  @moduledoc "Parameters for account session create."

  @typedoc """
  * `account` - The identifier of the account to create an Account Session for.
  * `components` - Each key of the dictionary represents an embedded component, and each embedded component maps to its configuration (e.g. whether it has been enabled or not).
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:account, :components, :expand]
end
