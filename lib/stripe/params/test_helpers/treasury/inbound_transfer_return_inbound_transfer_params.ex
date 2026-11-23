# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.InboundTransferReturnInboundTransferParams do
  @moduledoc "Parameters for inbound transfer return inbound transfer."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `failure_details` - Details about a returned InboundTransfer.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :failure_details]
end
