# File generated from our OpenAPI spec
defmodule Stripe.Resources.IssuingCardFeatures do
  @moduledoc """
  ConnectEmbeddedIssuingCardFeatures
  """

  @typedoc """
  * `card_management` - Whether to allow card management features.
  * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
  * `cardholder_management` - Whether to allow cardholder management features.
  * `spend_control_management` - Whether to allow spend control management features.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :card_management,
    :card_spend_dispute_management,
    :cardholder_management,
    :spend_control_management
  ]

  @object_name "connect_embedded_issuing_card_features"
  def object_name, do: @object_name
end
