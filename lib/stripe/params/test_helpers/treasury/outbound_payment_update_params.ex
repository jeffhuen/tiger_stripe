# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.OutboundPaymentUpdateParams do
  @moduledoc "Parameters for outbound payment update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `tracking_details` - Details about network-specific tracking information.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :tracking_details]
end
