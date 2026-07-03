# File generated from our OpenAPI spec
defmodule Stripe.Resources.TaxCode do
  @moduledoc """
  TaxProductResourceTaxCode

  [Tax codes](https://stripe.com/docs/tax/tax-categories) classify goods and services for tax purposes.
  """

  @typedoc """
  * `description` - A detailed description of which types of products the tax code represents. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `name` - A short name for the tax code. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax_code`.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :id, :name, :object]

  @object_name "tax_code"
  def object_name, do: @object_name
end
