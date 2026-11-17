# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.PayoutMethod do
  @moduledoc """
  Payout Method

  Use the PayoutMethods API to list and interact with PayoutMethod objects.
  """

  @typedoc """
  * `archived` - Whether the payout method was archived. Payout methods can be archived through the /archive API,
  and they will not be automatically archived by Stripe. Archived payout methods cannot be used
  for outbound money movement.
  * `bank_account` - The PayoutMethodBankAccount object details.
  * `card` - The PayoutMethodCard object details.
  * `created` - Created timestamp. Format: date-time.
  * `id` - ID of the PayoutMethod object.
  * `latest_outbound_setup_intent` - ID of the underlying active OutboundSetupIntent object, if any.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.payout_method`.
  * `restricted` - Whether the Payout Method is currently unusable for money movement, despite potentially being correctly set up.
  Please reach out to Stripe Support for more information.
  * `type` - Open Enum. The type of payout method. Possible values: `bank_account`, `card`.
  * `usage_status` - Indicates whether the payout method has met the necessary requirements for outbound money movement.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :archived,
    :bank_account,
    :card,
    :created,
    :id,
    :latest_outbound_setup_intent,
    :livemode,
    :object,
    :restricted,
    :type,
    :usage_status
  ]

  @object_name "v2.money_management.payout_method"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "bank_account" => %{
        fields: %{
          "bank_account_type" => :scalar,
          "bank_name" => :scalar,
          "branch_number" => :scalar,
          "country" => :scalar,
          "financial_connections_account" => :scalar,
          "last4" => :scalar,
          "routing_number" => :scalar,
          "supported_currencies" => {:list, :scalar},
          "swift_code" => :scalar
        }
      },
      "card" => %{
        fields: %{
          "exp_month" => :scalar,
          "exp_year" => :scalar,
          "fingerprint" => :scalar,
          "last4" => :scalar,
          "supported_currencies" => {:list, :scalar}
        }
      },
      "usage_status" => %{
        fields: %{
          "payments" => :scalar,
          "transfers" => :scalar
        }
      }
    }
  end
end
