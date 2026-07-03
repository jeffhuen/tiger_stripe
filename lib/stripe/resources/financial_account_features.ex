# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialAccountFeatures do
  @moduledoc """
  ConnectEmbeddedFinancialAccountFeatures
  """

  @typedoc """
  * `disable_stripe_user_authentication` - Whether Stripe user authentication is disabled. This value can only be `true` for accounts where `controller.requirement_collection` is `application` for the account. The default value is the opposite of the `external_account_collection` value. For example, if you don't set `external_account_collection`, it defaults to `true` and `disable_stripe_user_authentication` defaults to `false`.
  * `external_account_collection` - Whether external account collection is enabled. This feature can only be `false` for accounts where you’re responsible for collecting updated information when requirements are due or change, like Custom accounts. The default value for this feature is `true`.
  * `send_money` - Whether to allow sending money.
  * `transfer_balance` - Whether to allow transferring balance.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :disable_stripe_user_authentication,
    :external_account_collection,
    :send_money,
    :transfer_balance
  ]

  @object_name "connect_embedded_financial_account_features"
  def object_name, do: @object_name
end
