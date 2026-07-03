# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportPaymentAttemptFailedParams do
  @moduledoc "Parameters for payment record report payment attempt failed."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `failed_at` - When the reported payment failed. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :failed_at, :metadata]
end
