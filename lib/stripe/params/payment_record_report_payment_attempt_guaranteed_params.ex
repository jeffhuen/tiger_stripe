# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentRecordReportPaymentAttemptGuaranteedParams do
  @moduledoc "Parameters for payment record report payment attempt guaranteed."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `guaranteed_at` - When the reported payment was guaranteed. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `metadata`
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          guaranteed_at: integer(),
          metadata: map() | nil
        }

  defstruct [:expand, :guaranteed_at, :metadata]
end
