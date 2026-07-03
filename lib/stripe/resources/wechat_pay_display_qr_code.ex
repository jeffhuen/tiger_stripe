# File generated from our OpenAPI spec
defmodule Stripe.Resources.WechatPayDisplayQrCode do
  @moduledoc """
  PaymentIntentNextActionWechatPayDisplayQrCode
  """

  @typedoc """
  * `data` - The data being used to generate QR code Max length: 5000.
  * `hosted_instructions_url` - The URL to the hosted WeChat Pay instructions page, which allows customers to view the WeChat Pay QR code. Max length: 5000.
  * `image_data_url` - The base64 image data for a pre-generated QR code Max length: 5000.
  * `image_url_png` - The image_url_png string used to render QR code Max length: 5000.
  * `image_url_svg` - The image_url_svg string used to render QR code Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:data, :hosted_instructions_url, :image_data_url, :image_url_png, :image_url_svg]

  @object_name "payment_intent_next_action_wechat_pay_display_qr_code"
  def object_name, do: @object_name
end
