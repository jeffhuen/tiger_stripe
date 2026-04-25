# File generated from our OpenAPI spec
defmodule Stripe.Resources.Entitlements.ActiveEntitlement do
  @moduledoc """
  ActiveEntitlement

  An active entitlement describes access to a feature for a customer.
  """

  @typedoc """
  * `feature` - The [Feature](https://docs.stripe.com/api/entitlements/feature) that the customer is entitled to. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `lookup_key` - A unique key you provide as your own system identifier. This may be up to 80 characters. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `entitlements.active_entitlement`.
  """
  @type t :: %__MODULE__{
          feature: String.t() | Stripe.Resources.Entitlements.Feature.t(),
          id: String.t(),
          livemode: boolean(),
          lookup_key: String.t(),
          object: String.t()
        }

  defstruct [:feature, :id, :livemode, :lookup_key, :object]

  @object_name "entitlements.active_entitlement"
  def object_name, do: @object_name

  def expandable_fields, do: ["feature"]
end
