# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportRefundParams do
  @moduledoc "Parameters for payment record report refund."

  @typedoc """
  * `amount` - A positive integer in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) representing how much of this payment to refund. Can refund only up to the remaining, unrefunded amount of the payment.
  * `expand` - Specifies which fields in the response should be expanded.
  * `initiated_at` - When the reported refund was initiated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `outcome` - The outcome of the reported refund. Possible values: `refunded`.
  * `processor_details` - Processor information for this refund.
  * `refunded` - Information about the payment attempt refund.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :expand, :initiated_at, :metadata, :outcome, :processor_details, :refunded]
end
