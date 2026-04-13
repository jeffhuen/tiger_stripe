# File generated from our OpenAPI spec
defmodule Stripe.Resources.UPIHandleRedirectOrDisplayQrCode do
  @moduledoc """
  PaymentIntentNextActionUpiHandleRedirectOrDisplayQrCode
  """

  @typedoc """
  * `hosted_instructions_url` - The URL to the hosted UPI instructions page, which allows customers to view the QR code. Max length: 5000.
  * `qr_code` - Expandable.
  """
  @type t :: %__MODULE__{
          hosted_instructions_url: String.t(),
          qr_code: Stripe.Resources.UPIQRCode.t()
        }

  defstruct [:hosted_instructions_url, :qr_code]

  @object_name "payment_intent_next_action_upi_handle_redirect_or_display_qr_code"
  def object_name, do: @object_name

  def expandable_fields, do: ["qr_code"]

  def __inner_types__ do
    %{
      "qr_code" => Stripe.Resources.UPIQRCode
    }
  end
end
