# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.Vault.UsBankAccountListParams do
  @moduledoc "Parameters for us bank account list."

  @typedoc """
  * `limit` - Optionally set the maximum number of results per page. Defaults to 10.
  * `verification_status` - Closed Enum. Optionally filter by verification status. Possible values: `awaiting_verification`, `unverified`, `verification_failed`, `verified`.
  """
  @type t :: %__MODULE__{}

  defstruct [:limit, :verification_status]
end
