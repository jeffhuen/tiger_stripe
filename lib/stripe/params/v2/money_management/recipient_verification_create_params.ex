# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.RecipientVerificationCreateParams do
  @moduledoc "Parameters for recipient verification create."

  @typedoc """
  * `payout_method` - ID of the payout method.
  * `recipient` - ID of the recipient account. Required if the recipient is different from the sender. Omit for payouts to your own account.
  """
  @type t :: %__MODULE__{}

  defstruct [:payout_method, :recipient]
end
