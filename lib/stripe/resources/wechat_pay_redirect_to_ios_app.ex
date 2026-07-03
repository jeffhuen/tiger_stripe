# File generated from our OpenAPI spec
defmodule Stripe.Resources.WechatPayRedirectToIosApp do
  @moduledoc """
  PaymentIntentNextActionWechatPayRedirectToIOSApp
  """

  @typedoc """
  * `native_url` - An universal link that redirect to WeChat Pay app Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:native_url]

  @object_name "payment_intent_next_action_wechat_pay_redirect_to_ios_app"
  def object_name, do: @object_name
end
