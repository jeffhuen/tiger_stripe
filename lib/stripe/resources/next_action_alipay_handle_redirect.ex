# File generated from our OpenAPI spec
defmodule Stripe.Resources.NextActionAlipayHandleRedirect do
  @moduledoc """
  PaymentIntentNextActionAlipayHandleRedirect
  """

  @typedoc """
  * `native_data` - The native data to be used with Alipay SDK you must redirect your customer to in order to authenticate the payment in an Android App. Max length: 5000. Nullable.
  * `native_url` - The native URL you must redirect your customer to in order to authenticate the payment in an iOS App. Max length: 5000. Nullable.
  * `return_url` - If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion. Max length: 5000. Nullable.
  * `url` - The URL you must redirect your customer to in order to authenticate the payment. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:native_data, :native_url, :return_url, :url]

  @object_name "payment_intent_next_action_alipay_handle_redirect"
  def object_name, do: @object_name
end
