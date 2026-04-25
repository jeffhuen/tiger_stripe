# File generated from our OpenAPI spec
defmodule Stripe.Resources.CashappHandleRedirectOrDisplayQrCode do
  @moduledoc """
  PaymentIntentNextActionCashappHandleRedirectOrDisplayQrCode
  """

  @typedoc """
  * `hosted_instructions_url` - The URL to the hosted Cash App Pay instructions page, which allows customers to view the QR code, and supports QR code refreshing on expiration. Max length: 5000.
  * `mobile_auth_url` - The url for mobile redirect based auth Max length: 5000.
  * `qr_code` - Expandable.
  """
  @type t :: %__MODULE__{
          hosted_instructions_url: String.t(),
          mobile_auth_url: String.t(),
          qr_code: Stripe.Resources.CashappQrCode.t()
        }

  defstruct [:hosted_instructions_url, :mobile_auth_url, :qr_code]

  @object_name "payment_intent_next_action_cashapp_handle_redirect_or_display_qr_code"
  def object_name, do: @object_name

  def expandable_fields, do: ["qr_code"]

  def __nested_fields__ do
    %{
      "qr_code" => {:resource, Stripe.Resources.CashappQrCode}
    }
  end
end
