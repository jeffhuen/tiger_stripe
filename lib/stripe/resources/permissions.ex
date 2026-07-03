# File generated from our OpenAPI spec
defmodule Stripe.Resources.Permissions do
  @moduledoc """
  PaymentPagesCheckoutSessionPermissions
  """

  @typedoc """
  * `update_shipping_details` - Determines which entity is allowed to update the shipping details.

  Default is `client_only`. Stripe Checkout client will automatically update the shipping details. If set to `server_only`, only your server is allowed to update the shipping details.

  When set to `server_only`, you must add the onShippingDetailsChange event handler when initializing the Stripe Checkout client and manually update the shipping details from your server using the Stripe API. Possible values: `client_only`, `server_only`. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:update_shipping_details]

  @object_name "payment_pages_checkout_session_permissions"
  def object_name, do: @object_name
end
