# File generated from our OpenAPI spec
defmodule Stripe.Resources.PixDisplayQrCode do
  @moduledoc """
  PaymentIntentNextActionPixDisplayQrCode
  """

  @typedoc """
  * `data` - The raw data string used to generate QR code, it should be used together with QR code library. Max length: 5000.
  * `expires_at` - The date (unix timestamp) when the PIX expires.
  * `hosted_instructions_url` - The URL to the hosted pix instructions page, which allows customers to view the pix QR code. Max length: 5000.
  * `image_url_png` - The image_url_png string used to render png QR code Max length: 5000.
  * `image_url_svg` - The image_url_svg string used to render svg QR code Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:data, :expires_at, :hosted_instructions_url, :image_url_png, :image_url_svg]

  @object_name "payment_intent_next_action_pix_display_qr_code"
  def object_name, do: @object_name
end
