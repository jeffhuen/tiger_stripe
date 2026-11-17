# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.MoneyManagement.OutboundPaymentListParams do
  @moduledoc "Parameters for outbound payment list."

  @typedoc """
  * `created` - Filter OutboundPayments by their creation time.
  * `limit` - The maximum number of results to return.
  * `recipient` - Only return OutboundPayments sent to this recipient.
  * `status` - Closed Enum. Only return OutboundPayments with this status.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :limit, :recipient, :status]
end
