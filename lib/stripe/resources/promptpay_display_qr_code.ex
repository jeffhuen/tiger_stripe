# File generated from our OpenAPI spec
defmodule Stripe.Resources.PromptpayDisplayQrCode do
  @moduledoc """
  PaymentIntentNextActionPromptpayDisplayQrCode
  """

  @typedoc """
  * `data` - The raw data string used to generate QR code, it should be used together with QR code library. Max length: 5000.
  * `hosted_instructions_url` - The URL to the hosted PromptPay instructions page, which allows customers to view the PromptPay QR code. Max length: 5000.
  * `image_url_png` - The PNG path used to render the QR code, can be used as the source in an HTML img tag Max length: 5000.
  * `image_url_svg` - The SVG path used to render the QR code, can be used as the source in an HTML img tag Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:data, :hosted_instructions_url, :image_url_png, :image_url_svg]

  @object_name "payment_intent_next_action_promptpay_display_qr_code"
  def object_name, do: @object_name
end
