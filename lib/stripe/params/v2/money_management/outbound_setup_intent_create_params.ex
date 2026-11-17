# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.OutboundSetupIntentCreateParams do
  @moduledoc "Parameters for outbound setup intent create."

  @typedoc """
  * `payout_method` - If provided, the existing payout method resource to link to this setup intent.
  Any payout_method_data provided is used to update information on this linked payout method resource.
  * `payout_method_data` - If no payout_method provided, used to create the underlying credential that is set up for outbound money movement.
  If a payout_method provided, used to update data on the credential linked to this setup intent.
  * `usage_intent` - Specify which type of outbound money movement this credential should be set up for (payment | transfer).
  If not provided, defaults to payment. Possible values: `payment`, `transfer`.
  """
  @type t :: %__MODULE__{}

  defstruct [:payout_method, :payout_method_data, :usage_intent]
end
