# File generated from our OpenAPI spec
defmodule Stripe.Resources.ReturnedDetails do
  @moduledoc """
  TreasuryOutboundTransfersResourceReturnedDetails
  """

  @typedoc """
  * `code` - Reason for the return. Possible values: `account_closed`, `account_frozen`, `bank_account_restricted`, `bank_ownership_changed`, `declined`, `incorrect_account_holder_name`, `invalid_account_number`, `invalid_currency`, `no_account`, `other`.
  * `transaction` - The Transaction associated with this object. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:code, :transaction]

  @object_name "treasury_outbound_transfers_resource_returned_details"
  def object_name, do: @object_name

  def expandable_fields, do: ["transaction"]
end
