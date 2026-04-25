# File generated from our OpenAPI spec
defmodule Stripe.Resources.SwishHandleRedirectOrDisplayQrCode do
  @moduledoc """
  PaymentIntentNextActionSwishHandleRedirectOrDisplayQrCode
  """

  @typedoc """
  * `hosted_instructions_url` - The URL to the hosted Swish instructions page, which allows customers to view the QR code. Max length: 5000.
  * `mobile_auth_url` - The url for mobile redirect based auth (for internal use only and not typically available in standard API requests). Max length: 5000.
  * `qr_code` - Expandable.
  """
  @type t :: %__MODULE__{
          hosted_instructions_url: String.t(),
          mobile_auth_url: String.t(),
          qr_code: Stripe.Resources.SwishQrCode.t()
        }

  defstruct [:hosted_instructions_url, :mobile_auth_url, :qr_code]

  @object_name "payment_intent_next_action_swish_handle_redirect_or_display_qr_code"
  def object_name, do: @object_name

  def expandable_fields, do: ["qr_code"]

  def __nested_fields__ do
    %{
      "qr_code" => {:resource, Stripe.Resources.SwishQrCode}
    }
  end
end
