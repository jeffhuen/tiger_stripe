# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.OutboundPaymentCreateParams do
  @moduledoc "Parameters for outbound payment create."

  @typedoc """
  * `amount` - Amount (in cents) to be transferred.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - ID of the customer to whom the OutboundPayment is sent. Must match the Customer attached to the `destination_payment_method` passed in. Max length: 5000.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `destination_payment_method` - The PaymentMethod to use as the payment instrument for the OutboundPayment. Exclusive with `destination_payment_method_data`. Max length: 5000.
  * `destination_payment_method_data` - Hash used to generate the PaymentMethod to be used for this OutboundPayment. Exclusive with `destination_payment_method`.
  * `destination_payment_method_options` - Payment method-specific configuration for this OutboundPayment.
  * `end_user_details` - End user details.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - The FinancialAccount to pull funds from.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `statement_descriptor` - The description that appears on the receiving end for this OutboundPayment (for example, bank statement for external bank transfer). Maximum 10 characters for `ach` payments, 140 characters for `us_domestic_wire` payments, or 500 characters for `stripe` network transfers. Can only include -#.$&*, spaces, and alphanumeric characters. The default value is "payment". Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :currency,
    :customer,
    :description,
    :destination_payment_method,
    :destination_payment_method_data,
    :destination_payment_method_options,
    :end_user_details,
    :expand,
    :financial_account,
    :metadata,
    :statement_descriptor
  ]
end
