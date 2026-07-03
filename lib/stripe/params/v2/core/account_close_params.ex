# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.AccountCloseParams do
  @moduledoc "Parameters for account close."

  @typedoc """
  * `applied_configurations` - Configurations on the Account to be closed. All configurations on the Account must be passed in for this request to succeed.
  """
  @type t :: %__MODULE__{}

  defstruct [:applied_configurations]
end
