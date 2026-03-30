# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportPaymentAttemptCanceledParams do
  @moduledoc "Parameters for payment record report payment attempt canceled."

  @typedoc """
  * `canceled_at` - When the reported payment was canceled. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{
          canceled_at: integer(),
          expand: [String.t()] | nil,
          metadata: map() | nil
        }

  defstruct [:canceled_at, :expand, :metadata]
end
