# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportPaymentAttemptFailedParams do
  @moduledoc "Parameters for payment record report payment attempt failed."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `failed_at` - When the reported payment failed. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `metadata`
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          failed_at: integer(),
          metadata: map() | nil
        }

  defstruct [:expand, :failed_at, :metadata]
end
