# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.OutboundSetupIntentUpdateParams do
  @moduledoc "Parameters for outbound setup intent update."

  @typedoc """
  * `payout_method` - If provided, the existing payout method resource to link to this outbound setup intent.
  * `payout_method_data` - If no payout_method provided, used to create the underlying credential that is set up for outbound money movement.
  If a payout_method provided, used to update data on the credential linked to this setup intent.
  Only card expiry (exp_month, exp_year) can be updated in the case where payout_method is provided.
  """
  @type t :: %__MODULE__{}

  defstruct [:payout_method, :payout_method_data]
end
