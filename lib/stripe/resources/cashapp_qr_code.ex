# File generated from our OpenAPI spec
defmodule Stripe.Resources.CashappQrCode do
  @moduledoc """
  PaymentIntentNextActionCashappQRCode
  """

  @typedoc """
  * `expires_at` - The date (unix timestamp) when the QR code expires. Format: Unix timestamp.
  * `image_url_png` - The image_url_png string used to render QR code Max length: 5000.
  * `image_url_svg` - The image_url_svg string used to render QR code Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expires_at, :image_url_png, :image_url_svg]

  @object_name "payment_intent_next_action_cashapp_qr_code"
  def object_name, do: @object_name
end
