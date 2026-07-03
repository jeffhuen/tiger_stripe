# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaynowDisplayQrCode do
  @moduledoc """
  PaymentIntentNextActionPaynowDisplayQrCode
  """

  @typedoc """
  * `data` - The raw data string used to generate QR code, it should be used together with QR code library. Max length: 5000.
  * `hosted_instructions_url` - The URL to the hosted PayNow instructions page, which allows customers to view the PayNow QR code. Max length: 5000. Nullable.
  * `image_url_png` - The image_url_png string used to render QR code Max length: 5000.
  * `image_url_svg` - The image_url_svg string used to render QR code Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:data, :hosted_instructions_url, :image_url_png, :image_url_svg]

  @object_name "payment_intent_next_action_paynow_display_qr_code"
  def object_name, do: @object_name
end
