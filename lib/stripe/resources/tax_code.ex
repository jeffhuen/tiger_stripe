# File generated from our OpenAPI spec
defmodule Stripe.Resources.TaxCode do
  @moduledoc """
  Tax Code

  [Tax codes](https://stripe.com/docs/tax/tax-categories) classify goods and services for tax purposes.
  """

  @typedoc """
  * `description` - A detailed description of which types of products the tax code represents. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `name` - A short name for the tax code. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax_code`.
  * `requirements` - An object that describes more information about the tax location required for this tax code. Some tax codes require a [performance location](https://stripe.com/tax/location-sales#required-versus-optional-performance-locations) to calculate tax correctly. Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :id, :name, :object, :requirements]

  @object_name "tax_code"
  def object_name, do: @object_name

  def expandable_fields, do: ["requirements"]

  def __nested_fields__ do
    %{
      "requirements" => %{
        fields: %{
          "performance_location" => :scalar
        }
      }
    }
  end
end
