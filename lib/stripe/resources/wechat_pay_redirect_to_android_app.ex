# File generated from our OpenAPI spec
defmodule Stripe.Resources.WechatPayRedirectToAndroidApp do
  @moduledoc """
  PaymentIntentNextActionWechatPayRedirectToAndroidApp
  """

  @typedoc """
  * `app_id` - app_id is the APP ID registered on WeChat open platform Max length: 5000.
  * `nonce_str` - nonce_str is a random string Max length: 5000.
  * `package` - package is static value Max length: 5000.
  * `partner_id` - an unique merchant ID assigned by WeChat Pay Max length: 5000.
  * `prepay_id` - an unique trading ID assigned by WeChat Pay Max length: 5000.
  * `sign` - A signature Max length: 5000.
  * `timestamp` - Specifies the current time in epoch format Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:app_id, :nonce_str, :package, :partner_id, :prepay_id, :sign, :timestamp]

  @object_name "payment_intent_next_action_wechat_pay_redirect_to_android_app"
  def object_name, do: @object_name
end
