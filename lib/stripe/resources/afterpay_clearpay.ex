# File generated from our OpenAPI spec
defmodule Stripe.Resources.AfterpayClearpay do
  @moduledoc """
  CheckoutAfterpayClearpayPaymentMethodOptions
  """

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type t :: %__MODULE__{}

  defstruct [:capture_method, :setup_future_usage]

  @object_name "checkout_afterpay_clearpay_payment_method_options"
  def object_name, do: @object_name
end
