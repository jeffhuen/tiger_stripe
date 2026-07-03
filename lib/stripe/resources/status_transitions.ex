# File generated from our OpenAPI spec
defmodule Stripe.Resources.StatusTransitions do
  @moduledoc """
  TreasuryInboundTransfersResourceInboundTransferResourceStatusTransitions
  """

  @typedoc """
  * `canceled_at` - Timestamp describing when an InboundTransfer changed status to `canceled`. Format: Unix timestamp. Nullable.
  * `failed_at` - Timestamp describing when an InboundTransfer changed status to `failed`. Format: Unix timestamp. Nullable.
  * `succeeded_at` - Timestamp describing when an InboundTransfer changed status to `succeeded`. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:canceled_at, :failed_at, :succeeded_at]

  @object_name "treasury_inbound_transfers_resource_inbound_transfer_resource_status_transitions"
  def object_name, do: @object_name
end
