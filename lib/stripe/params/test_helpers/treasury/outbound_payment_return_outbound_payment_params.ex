# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.OutboundPaymentReturnOutboundPaymentParams do
  @moduledoc "Parameters for outbound payment return outbound payment."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `returned_details` - Optional hash to set the return code.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :returned_details]
end
