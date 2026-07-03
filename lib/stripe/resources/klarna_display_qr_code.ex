# File generated from our OpenAPI spec
defmodule Stripe.Resources.KlarnaDisplayQrCode do
  @moduledoc """
  PaymentIntentNextActionKlarnaDisplayQrCode
  """

  @typedoc """
  * `data` - The data being used to generate QR code Max length: 5000.
  * `expires_at` - The timestamp at which the QR code expires. Format: Unix timestamp. Nullable.
  * `image_url_png` - The image_url_png string used to render QR code Max length: 5000.
  * `image_url_svg` - The image_url_svg string used to render QR code Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:data, :expires_at, :image_url_png, :image_url_svg]

  @object_name "payment_intent_next_action_klarna_display_qr_code"
  def object_name, do: @object_name
end
