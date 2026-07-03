# File generated from our OpenAPI spec
defmodule Stripe.Resources.CustomFieldDropdownOption do
  @moduledoc """
  PaymentLinksResourceCustomFieldsDropdownOption
  """

  @typedoc """
  * `label` - The label for the option, displayed to the customer. Up to 100 characters. Max length: 5000.
  * `value` - The value for this option, not displayed to the customer, used by your integration to reconcile the option selected by the customer. Must be unique to this option, alphanumeric, and up to 100 characters. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:label, :value]

  @object_name "payment_links_resource_custom_fields_dropdown_option"
  def object_name, do: @object_name
end
