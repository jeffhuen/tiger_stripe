# File generated from our OpenAPI spec
defmodule Stripe.Resources.CheckoutCardRestrictions do
  @moduledoc """
  PaymentPagesPrivateCardPaymentMethodOptionsResourceRestrictions
  """

  @typedoc """
  * `brands_blocked` - The card brands to block. If a customer enters or selects a card belonging to a blocked brand, they can't complete the payment.
  """
  @type t :: %__MODULE__{}

  defstruct [:brands_blocked]

  @object_name "payment_pages_private_card_payment_method_options_resource_restrictions"
  def object_name, do: @object_name
end
