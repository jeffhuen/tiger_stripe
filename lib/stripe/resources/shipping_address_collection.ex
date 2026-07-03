# File generated from our OpenAPI spec
defmodule Stripe.Resources.ShippingAddressCollection do
  @moduledoc """
  PaymentPagesCheckoutSessionShippingAddressCollection
  """

  @typedoc """
  * `allowed_countries` - An array of two-letter ISO country codes representing which countries Checkout should provide as options for
  shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SY, UM, VI`.
  """
  @type t :: %__MODULE__{}

  defstruct [:allowed_countries]

  @object_name "payment_pages_checkout_session_shipping_address_collection"
  def object_name, do: @object_name
end
