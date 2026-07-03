# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportPaymentParams do
  @moduledoc "Parameters for payment record report payment."

  @typedoc """
  * `amount_requested` - The amount you initially requested for this payment.
  * `customer_details` - Customer information for this payment.
  * `customer_presence` - Indicates whether the customer was present in your checkout flow during this payment. Possible values: `off_session`, `on_session`.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `failed` - Information about the payment attempt failure.
  * `guaranteed` - Information about the payment attempt guarantee.
  * `initiated_at` - When the reported payment was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `outcome` - The outcome of the reported payment. Possible values: `failed`, `guaranteed`.
  * `payment_method_details` - Information about the Payment Method debited for this payment.
  * `processor_details` - Processor information for this payment.
  * `shipping_details` - Shipping information for this payment.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount_requested,
    :customer_details,
    :customer_presence,
    :description,
    :expand,
    :failed,
    :guaranteed,
    :initiated_at,
    :metadata,
    :outcome,
    :payment_method_details,
    :processor_details,
    :shipping_details
  ]
end
