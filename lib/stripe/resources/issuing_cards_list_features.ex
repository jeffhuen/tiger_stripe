# File generated from our OpenAPI spec
defmodule Stripe.Resources.IssuingCardsListFeatures do
  @moduledoc """
  ConnectEmbeddedIssuingCardsListFeatures
  """

  @typedoc """
  * `card_management` - Whether to allow card management features.
  * `card_spend_dispute_management` - Whether to allow card spend dispute management features.
  * `cardholder_management` - Whether to allow cardholder management features.
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `spend_control_management` - Whether to allow spend control management features.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :card_management,
    :card_spend_dispute_management,
    :cardholder_management,
    :disable_stripe_user_authentication,
    :spend_control_management
  ]

  @object_name "connect_embedded_issuing_cards_list_features"
  def object_name, do: @object_name
end
