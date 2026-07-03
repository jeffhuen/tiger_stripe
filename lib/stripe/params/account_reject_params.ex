# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountRejectParams do
  @moduledoc "Parameters for account reject."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `reason` - The reason for rejecting the account. Can be `fraud`, `terms_of_service`, or `other`. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :reason]
end
