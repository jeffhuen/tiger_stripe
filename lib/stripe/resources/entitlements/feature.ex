# File generated from our OpenAPI spec
defmodule Stripe.Resources.Entitlements.Feature do
  @moduledoc """
  Feature

  A feature represents a monetizable ability or functionality in your system.
  Features can be assigned to products, and when those products are purchased, Stripe will create an entitlement to the feature for the purchasing customer.
  """

  @typedoc """
  * `active` - Inactive features cannot be attached to new products and will not be returned from the features list endpoint.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `lookup_key` - A unique key you provide as your own system identifier. This may be up to 80 characters. Max length: 5000.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - The feature's name, for your own purpose, not meant to be displayable to the customer. Max length: 80.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `entitlements.feature`.
  """
  @type t :: %__MODULE__{
          active: boolean(),
          id: String.t(),
          livemode: boolean(),
          lookup_key: String.t(),
          metadata: %{String.t() => String.t()},
          name: String.t(),
          object: String.t()
        }

  defstruct [:active, :id, :livemode, :lookup_key, :metadata, :name, :object]

  @object_name "entitlements.feature"
  def object_name, do: @object_name
end
