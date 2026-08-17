# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountRejectParams do
  @moduledoc "Parameters for account reject."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payouts_action` - Whether to pause payouts on the account as part of the rejection. Defaults to `pause`. Use `none` to leave payouts enabled. Possible values: `none`, `pause`.
  * `reason` - The reason for rejecting the account. Can be `fraud`, `terms_of_service`, or `other`. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :payouts_action, :reason]
end
