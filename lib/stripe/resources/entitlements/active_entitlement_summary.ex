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
          entitlements: __MODULE__.Entitlements.t(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:customer, :entitlements, :livemode, :object]

  @object_name "entitlements.active_entitlement_summary"
  def object_name, do: @object_name

  def expandable_fields, do: ["entitlements"]

  defmodule Entitlements do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data`
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.Entitlements.ActiveEntitlement.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  def __inner_types__ do
    %{
      "entitlements" => __MODULE__.Entitlements
    }
  end
end
