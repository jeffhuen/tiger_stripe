# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentConfirmParams do
  @moduledoc "Parameters for payment intent confirm."

  @typedoc """
  * `amount_details` - Provides industry-specific information about the amount.
  * `amount_to_confirm` - Amount to confirm on the PaymentIntent. Defaults to `amount` if not provided.
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `automatic`, `automatic_async`, `manual`.
  * `confirmation_token` - ID of the ConfirmationToken used to confirm this PaymentIntent.

  If the provided ConfirmationToken contains properties that are also being provided in this request, such as `payment_method`, then the values in this request will take precedence. Max length: 5000.
  * `error_on_requires_action` - Set to `true` to fail the payment attempt if the PaymentIntent transitions into `requires_action`. This parameter is intended for simpler integrations that do not handle customer actions, like [saving cards without authentication](https://docs.stripe.com/payments/save-card-without-authentication).
  * `excluded_payment_method_types` - The list of payment method types to exclude from use with this payment.
  * `expand` - Specifies which fields in the response should be expanded.
  * `hooks` - Automations to be run during the PaymentIntent lifecycle
  * `mandate` - ID of the mandate that's used for this payment. Max length: 5000.
  * `mandate_data`
  * `off_session` - Set to `true` to indicate that the customer isn't in your checkout flow during this payment attempt and can't authenticate. Use this parameter in scenarios where you collect payment method details and [charge them later](https://docs.stripe.com/payments/save-during-payment).
  * `payment_details` - Provides industry-specific information about the charge.
  * `payment_method` - ID of the payment method (a PaymentMethod, Card, or [compatible Source](https://docs.stripe.com/payments/payment-methods/transitioning#compatibility) object) to attach to this PaymentIntent.
  If the payment method is attached to a Customer, it must match the [customer](https://api.stripe.com#create_payment_intent-customer) that is set on this PaymentIntent. Max length: 5000.
  * `payment_method_data` - If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear
  in the [payment_method](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-payment_method)
  property on the PaymentIntent.
  * `payment_method_options` - Payment method-specific configuration for this PaymentIntent.
  * `payment_method_types` - The list of payment method types (for example, a card) that this PaymentIntent can use. Use `automatic_payment_methods` to manage payment methods from the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods). A list of valid payment method types can be found [here](https://docs.stripe.com/api/payment_methods/object#payment_method_object-type).
  * `radar_options` - Options to configure Radar. Learn more about [Radar Sessions](https://docs.stripe.com/radar/radar-session).
  * `receipt_email` - Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
  * `return_url` - The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site.
  If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme.
  This parameter is only used for cards and other redirect-based payment methods.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication).

  If you've already set `setup_future_usage` and you're performing a request using a publishable key, you can only update the value from `on_session` to `off_session`. Possible values: `off_session`, `on_session`.
  * `shipping` - Shipping information for this PaymentIntent.
  * `use_stripe_sdk` - Set to `true` when confirming server-side and using Stripe.js, iOS, or Android client-side SDKs to handle the next actions.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount_details,
    :amount_to_confirm,
    :capture_method,
    :confirmation_token,
    :error_on_requires_action,
    :excluded_payment_method_types,
    :expand,
    :hooks,
    :mandate,
    :mandate_data,
    :off_session,
    :payment_details,
    :payment_method,
    :payment_method_data,
    :payment_method_options,
    :payment_method_types,
    :radar_options,
    :receipt_email,
    :return_url,
    :setup_future_usage,
    :shipping,
    :use_stripe_sdk
  ]
end
