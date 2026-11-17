# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.Adjustment do
  @moduledoc """
  Adjustment

  An Adjustment records a credit or debit that Stripe makes to your Financial Account balance,
  for example to correct technical or operational errors.
  """

  @typedoc """
  * `adjusted_flow` - Details about the original flow object linked to this Adjustment, if applicable.
  `adjusted_flow.type` identifies the kind of object. The corresponding field contains its ID:
  for an InboundTransfer, `adjusted_flow.inbound_transfer` contains the InboundTransfer's ID.
  Pass that ID to the `adjusted_flow` parameter on List Adjustments.
  * `amount` - The amount of the Adjustment.
  * `created` - Time at which the object was created. Represented as an RFC 3339 timestamp in UTC with millisecond precision,
  for example `2022-09-18T13:22:18.123Z`. Format: date-time.
  * `description` - A description of the Adjustment and its purpose.
  * `financial_account` - The ID of the FinancialAccount whose balance this Adjustment affects.
  * `id` - Unique identifier for the object.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.adjustment`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :adjusted_flow,
    :amount,
    :created,
    :description,
    :financial_account,
    :id,
    :livemode,
    :object
  ]

  @object_name "v2.money_management.adjustment"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "adjusted_flow" => %{
        fields: %{
          "adjustment" => :scalar,
          "inbound_transfer" => :scalar,
          "outbound_payment" => :scalar,
          "outbound_transfer" => :scalar,
          "received_credit" => :scalar,
          "received_debit" => :scalar,
          "type" => :scalar
        }
      },
      "amount" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      }
    }
  end
end
