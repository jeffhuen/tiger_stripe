# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentMethodSettingsFeatures do
  @moduledoc """
  ConnectEmbeddedPaymentMethodSettingsFeatures
  """

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. This is `false` by default.
  """
  @type t :: %__MODULE__{}

  defstruct [:disable_stripe_user_authentication]

  @object_name "connect_embedded_payment_method_settings_features"
  def object_name, do: @object_name
end
