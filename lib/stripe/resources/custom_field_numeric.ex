# File generated from our OpenAPI spec
defmodule Stripe.Resources.CustomFieldNumeric do
  @moduledoc """
  PaymentPagesCheckoutSessionCustomFieldsNumeric
  """

  @typedoc """
  * `default_value` - The value that will pre-fill the field on the payment page. Max length: 5000. Nullable.
  * `maximum_length` - The maximum character length constraint for the customer's input. Nullable.
  * `minimum_length` - The minimum character length requirement for the customer's input. Nullable.
  * `value` - The value entered by the customer, containing only digits. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          default_value: String.t(),
          maximum_length: integer(),
          minimum_length: integer(),
          value: String.t()
        }

  defstruct [:default_value, :maximum_length, :minimum_length, :value]

  @object_name "payment_pages_checkout_session_custom_fields_numeric"
  def object_name, do: @object_name
end
