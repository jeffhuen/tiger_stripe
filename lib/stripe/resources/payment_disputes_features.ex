# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentDisputesFeatures do
  @moduledoc """
  ConnectEmbeddedPaymentDisputesFeatures
  """

  @typedoc """
  * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
  * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
  * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
  """
  @type t :: %__MODULE__{}

  defstruct [:destination_on_behalf_of_charge_management, :dispute_management, :refund_management]

  @object_name "connect_embedded_payment_disputes_features"
  def object_name, do: @object_name
end
