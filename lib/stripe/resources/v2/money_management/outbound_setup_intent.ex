# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.OutboundSetupIntent do
  @moduledoc """
  Outbound Setup Intent

  Use the OutboundSetupIntent API to create and setup usable payout methods.
  """

  @typedoc """
  * `created` - Created timestamp. Format: date-time.
  * `id` - ID of the outbound setup intent.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.outbound_setup_intent`.
  * `payout_method`
  * `status` - Closed Enum. Status of the outbound setup intent. Possible values: `canceled`, `requires_action`, `requires_payout_method`, `succeeded`.
  * `usage_intent` - The intended money movement flow this payout method should be set up for, specified in params. Possible values: `payment`, `transfer`.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :id, :livemode, :object, :payout_method, :status, :usage_intent]

  @object_name "v2.money_management.outbound_setup_intent"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "payout_method" => {:resource, Stripe.Resources.V2.MoneyManagement.PayoutMethod}
    }
  end
end
