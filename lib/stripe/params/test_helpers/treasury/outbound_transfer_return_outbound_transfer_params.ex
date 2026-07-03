# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.OutboundTransferReturnOutboundTransferParams do
  @moduledoc "Parameters for outbound transfer return outbound transfer."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `returned_details` - Details about a returned OutboundTransfer.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :returned_details]
end
