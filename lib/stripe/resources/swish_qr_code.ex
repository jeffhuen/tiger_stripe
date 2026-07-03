# File generated from our OpenAPI spec
defmodule Stripe.Resources.SwishQrCode do
  @moduledoc """
  PaymentIntentNextActionSwishQRCode
  """

  @typedoc """
  * `data` - The raw data string used to generate QR code, it should be used together with QR code library. Max length: 5000.
  * `image_url_png` - The image_url_png string used to render QR code Max length: 5000.
  * `image_url_svg` - The image_url_svg string used to render QR code Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:data, :image_url_png, :image_url_svg]

  @object_name "payment_intent_next_action_swish_qr_code"
  def object_name, do: @object_name
end
