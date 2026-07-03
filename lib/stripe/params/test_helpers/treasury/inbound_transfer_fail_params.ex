# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.InboundTransferFailParams do
  @moduledoc "Parameters for inbound transfer fail."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `failure_details` - Details about a failed InboundTransfer.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :failure_details]
end
