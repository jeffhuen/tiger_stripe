# File generated from our OpenAPI spec
defmodule Stripe.Resources.CustomFieldDropdown do
  @moduledoc """
  PaymentPagesCheckoutSessionCustomFieldsDropdown
  """

  @typedoc """
  * `default_value` - The value that will pre-fill on the payment page. Max length: 5000. Nullable.
  * `options` - The options available for the customer to select. Up to 200 options allowed. Expandable.
  * `value` - The option selected by the customer. This will be the `value` for the option. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          default_value: String.t(),
          options: [Stripe.Resources.CustomFieldDropdownOption.t()],
          value: String.t()
        }

  defstruct [:default_value, :options, :value]

  @object_name "payment_pages_checkout_session_custom_fields_dropdown"
  def object_name, do: @object_name

  def expandable_fields, do: ["options"]
end
