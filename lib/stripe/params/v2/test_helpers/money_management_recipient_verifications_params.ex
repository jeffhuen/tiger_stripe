# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.TestHelpers.MoneyManagementRecipientVerificationsParams do
  @moduledoc "Parameters for money management recipient verifications."

  @typedoc """
  * `match_result` - Expected match level of the RecipientVerification to be created: `match`, `close_match`, `no_match`, `unavailable`.
  For `close_match`, the simulated response appends "close_match" to the provided name in match_result_details.matched_name. Possible values: `close_match`, `match`, `no_match`, `unavailable`.
  * `payout_method` - ID of the payout method.
  * `recipient` - ID of the recipient account. Required if the recipient is different from the sender. Omit for payouts to your own account.
  """
  @type t :: %__MODULE__{}

  defstruct [:match_result, :payout_method, :recipient]
end
