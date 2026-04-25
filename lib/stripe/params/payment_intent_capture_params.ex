# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentCaptureParams do
  @moduledoc "Parameters for payment intent capture."

  @typedoc """
  * `amount_details` - Provides industry-specific information about the amount.
  * `amount_to_capture` - The amount to capture from the PaymentIntent, which must be less than or equal to the original amount. Defaults to the full `amount_capturable` if it's not provided.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total amount captured. For more information, see the PaymentIntents [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `expand` - Specifies which fields in the response should be expanded.
  * `final_capture` - Defaults to `true`. When capturing a PaymentIntent, setting `final_capture` to `false` notifies Stripe to not release the remaining uncaptured funds to make sure that they're captured in future requests. You can only use this setting when [multicapture](https://docs.stripe.com/payments/multicapture) is available for PaymentIntents.
  * `hooks` - Automations to be run during the PaymentIntent lifecycle
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `payment_details` - Provides industry-specific information about the charge.
  * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead. Max length: 22.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. Max length: 22.
  * `transfer_data` - The parameters that you can use to automatically create a transfer after the payment
  is captured. Learn more about the [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  """
  @type t :: %__MODULE__{
          amount_details: amount_details() | nil,
          amount_to_capture: integer() | nil,
          application_fee_amount: integer() | nil,
          expand: [String.t()] | nil,
          final_capture: boolean() | nil,
          hooks: hooks() | nil,
          metadata: map() | nil,
          payment_details: map() | nil,
          statement_descriptor: String.t() | nil,
          statement_descriptor_suffix: String.t() | nil,
          transfer_data: transfer_data() | nil
        }

  defstruct [
    :amount_details,
    :amount_to_capture,
    :application_fee_amount,
    :expand,
    :final_capture,
    :hooks,
    :metadata,
    :payment_details,
    :statement_descriptor,
    :statement_descriptor_suffix,
    :transfer_data
  ]

  @typedoc """
  * `discount_amount` - The total discount applied on the transaction represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). An integer greater than 0.

  This field is mutually exclusive with the `amount_details[line_items][#][discount_amount]` field.
  * `enforce_arithmetic_validation` - Set to `false` to return arithmetic validation errors in the response without failing the request. Use this when you want the operation to proceed regardless of arithmetic errors in the line item data.

  Omit or set to `true` to immediately return a 400 error when arithmetic validation fails. Use this for strict validation that prevents processing with line item data that has arithmetic inconsistencies.

  For card payments, Stripe doesn't send line item data if there's an arithmetic validation error to card networks.
  * `line_items` - A list of line items, each containing information about a product in the PaymentIntent. There is a maximum of 200 line items.
  * `shipping` - Contains information about the shipping portion of the amount.
  * `tax` - Contains information about the tax portion of the amount.
  """
  @type amount_details :: %{
          optional(:discount_amount) => map() | nil,
          optional(:enforce_arithmetic_validation) => boolean() | nil,
          optional(:line_items) => map() | nil,
          optional(:shipping) => map() | nil,
          optional(:tax) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `inputs` - Arguments passed in automations
  """
  @type hooks :: %{
          optional(:inputs) => hooks_inputs() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tax` - Tax arguments for automations
  """
  @type hooks_inputs :: %{
          optional(:tax) => hooks_inputs_tax() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `calculation` - The [TaxCalculation](https://docs.stripe.com/api/tax/calculations) id
  """
  @type hooks_inputs_tax :: %{
          optional(:calculation) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount that will be transferred automatically when a charge succeeds.
  """
  @type transfer_data :: %{
          optional(:amount) => integer() | nil,
          optional(String.t()) => term()
        }
end
