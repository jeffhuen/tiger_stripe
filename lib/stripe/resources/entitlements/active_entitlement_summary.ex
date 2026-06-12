# File generated from our OpenAPI spec
defmodule Stripe.Resources.Entitlements.ActiveEntitlementSummary do
  @moduledoc """
  ActiveEntitlementSummary

  A summary of a customer's active entitlements.
  """

  @typedoc """
  * `customer` - The customer that is entitled to this feature. Max length: 5000.
  * `entitlements` - The list of entitlements this customer has. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `entitlements.active_entitlement_summary`.
  """
  @type t :: %__MODULE__{
          customer: String.t(),
          entitlements: entitlements(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:customer, :entitlements, :livemode, :object]

  @object_name "entitlements.active_entitlement_summary"
  def object_name, do: @object_name

  def expandable_fields, do: ["entitlements"]

  @typedoc """
  * `data`
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type entitlements :: %{
          optional(:data) => [Stripe.Resources.Entitlements.ActiveEntitlement.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

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
