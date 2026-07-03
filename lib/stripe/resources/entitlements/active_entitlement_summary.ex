# File generated from our OpenAPI spec
defmodule Stripe.Resources.Entitlements.ActiveEntitlementSummary do
  @moduledoc """
  ActiveEntitlementSummary

  A summary of a customer's active entitlements.
  """

  @typedoc """
  * `customer` - The customer that is entitled to this feature. Max length: 5000.
  * `entitlements` - The list of entitlements this customer has. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `entitlements.active_entitlement_summary`.
  """
  @type t :: %__MODULE__{}

  defstruct [:customer, :entitlements, :livemode, :object]

  @object_name "entitlements.active_entitlement_summary"
  def object_name, do: @object_name

  def expandable_fields, do: ["entitlements"]

  def __nested_fields__ do
    %{
      "entitlements" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.Entitlements.ActiveEntitlement}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      }
    }
  end
end
