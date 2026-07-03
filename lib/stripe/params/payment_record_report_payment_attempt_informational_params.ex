# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportPaymentAttemptInformationalParams do
  @moduledoc "Parameters for payment record report payment attempt informational."

  @typedoc """
  * `customer_details` - Customer information for this payment.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `shipping_details` - Shipping information for this payment.
  """
  @type t :: %__MODULE__{}

  defstruct [:customer_details, :description, :expand, :metadata, :shipping_details]
end
