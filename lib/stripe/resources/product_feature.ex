# File generated from our OpenAPI spec
defmodule Stripe.Resources.ProductFeature do
  @moduledoc """
  ProductFeature

  A product_feature represents an attachment between a feature and a product.
  When a product is purchased that has a feature attached, Stripe will create an entitlement to the feature for the purchasing customer.
  """

  @typedoc """
  * `entitlement_feature` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `product_feature`.
  """
  @type t :: %__MODULE__{
          entitlement_feature: Stripe.Resources.Entitlements.Feature.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:entitlement_feature, :id, :livemode, :object]

  @object_name "product_feature"
  def object_name, do: @object_name

  def expandable_fields, do: ["entitlement_feature"]

  def __inner_types__ do
    %{
      "entitlement_feature" => Stripe.Resources.Entitlements.Feature
    }
  end
end
