# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.AccountListParams do
  @moduledoc "Parameters for account list."

  @typedoc """
  * `applied_configurations` - Filter only accounts that have all of the configurations specified. If omitted, returns all accounts regardless of which configurations they have.
  * `closed` - Filter by whether the account is closed. If omitted, returns only Accounts that are not closed.
  * `limit` - The upper limit on the number of accounts returned by the List Account request.
  """
  @type t :: %__MODULE__{}

  defstruct [:applied_configurations, :closed, :limit]
end
