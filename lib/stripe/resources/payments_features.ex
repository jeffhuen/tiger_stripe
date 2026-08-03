# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentsFeatures do
  @moduledoc """
  ConnectEmbeddedPaymentsFeatures
  """

  @typedoc """
  * `capture_payments` - Whether to allow capturing and cancelling payment intents. This is `true` by default.
  * `destination_on_behalf_of_charge_management` - Whether connected accounts can manage destination charges that are created on behalf of them. This is `false` by default.
  * `dispute_management` - Whether responding to disputes is enabled, including submitting evidence and accepting disputes. This is `true` by default.
  * `refund_management` - Whether sending refunds is enabled. This is `true` by default.
  * `smart_disputes_management` - Whether to allow connected accounts to submit disputes using Smart Disputes. Defaults to the value of `dispute_management`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :capture_payments,
    :destination_on_behalf_of_charge_management,
    :dispute_management,
    :refund_management,
    :smart_disputes_management
  ]

  @object_name "connect_embedded_payments_features"
  def object_name, do: @object_name
end
