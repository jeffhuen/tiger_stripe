# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentCreateParams do
  @moduledoc "Parameters for payment intent create."

  @typedoc """
  * `amount` - Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://docs.stripe.com/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
  * `amount_details` - Provides industry-specific information about the amount.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total amount captured. For more information, see the PaymentIntents [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `automatic_payment_methods` - When you enable this parameter, this PaymentIntent accepts payment methods that you enable in the Dashboard and that are compatible with this PaymentIntent's other parameters.
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `automatic`, `automatic_async`, `manual`.
  * `confirm` - Set to `true` to attempt to [confirm this PaymentIntent](https://docs.stripe.com/api/payment_intents/confirm) immediately. This parameter defaults to `false`. When creating and confirming a PaymentIntent at the same time, you can also provide the parameters available in the [Confirm API](https://docs.stripe.com/api/payment_intents/confirm).
  * `confirmation_method` - Describes whether we can confirm this PaymentIntent automatically, or if it requires customer action to confirm the payment. Possible values: `automatic`, `manual`.
  * `confirmation_token` - ID of the ConfirmationToken used to confirm this PaymentIntent.

  If the provided ConfirmationToken contains properties that are also being provided in this request, such as `payment_method`, then the values in this request will take precedence. Max length: 5000.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - ID of the Customer this PaymentIntent belongs to, if one exists.

  Payment methods attached to other Customers cannot be used with this PaymentIntent.

  If [setup_future_usage](https://api.stripe.com#payment_intent_object-setup_future_usage) is set and this PaymentIntent's payment method is not `card_present`, then the payment method attaches to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete. If the payment method is `card_present` and isn't a digital wallet, then a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card is created and attached to the Customer instead. Max length: 5000.
  * `customer_account` - ID of the Account representing the customer that this PaymentIntent belongs to, if one exists.

  Payment methods attached to other Accounts cannot be used with this PaymentIntent.

  If [setup_future_usage](https://api.stripe.com#payment_intent_object-setup_future_usage) is set and this PaymentIntent's payment method is not `card_present`, then the payment method attaches to the Account after the PaymentIntent has been confirmed and any required actions from the user are complete. If the payment method is `card_present` and isn't a digital wallet, then a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card is created and attached to the Account instead. Max length: 5000.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
  * `error_on_requires_action` - Set to `true` to fail the payment attempt if the PaymentIntent transitions into `requires_action`. Use this parameter for simpler integrations that don't handle customer actions, such as [saving cards without authentication](https://docs.stripe.com/payments/save-card-without-authentication). This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm).
  * `excluded_payment_method_types` - The list of payment method types to exclude from use with this payment.
  * `expand` - Specifies which fields in the response should be expanded.
  * `hooks` - Automations to be run during the PaymentIntent lifecycle
  * `mandate` - ID of the mandate that's used for this payment. This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm). Max length: 5000.
  * `mandate_data` - This hash contains details about the Mandate to create. This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm).
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `off_session` - Set to `true` to indicate that the customer isn't in your checkout flow during this payment attempt and can't authenticate. Use this parameter in scenarios where you collect card details and [charge them later](https://docs.stripe.com/payments/cards/charging-saved-cards). This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm).
  * `on_behalf_of` - The Stripe account ID that these funds are intended for. Learn more about the [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `payment_details` - Provides industry-specific information about the charge.
  * `payment_method` - ID of the payment method (a PaymentMethod, Card, or [compatible Source](https://docs.stripe.com/payments/payment-methods#compatibility) object) to attach to this PaymentIntent.

  If you don't provide the `payment_method` parameter or the `source` parameter with `confirm=true`, `source` automatically populates with `customer.default_source` to improve migration for users of the Charges API. We recommend that you explicitly provide the `payment_method` moving forward.
  If the payment method is attached to a Customer, you must also provide the ID of that Customer as the [customer](https://api.stripe.com#create_payment_intent-customer) parameter of this PaymentIntent.
  end Max length: 5000.
  * `payment_method_configuration` - The ID of the [payment method configuration](https://docs.stripe.com/api/payment_method_configurations) to use with this PaymentIntent. Max length: 100.
  * `payment_method_data` - If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear
  in the [payment_method](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-payment_method)
  property on the PaymentIntent.
  * `payment_method_options` - Payment method-specific configuration for this PaymentIntent.
  * `payment_method_types` - The list of payment method types (for example, a card) that this PaymentIntent can use. If you don't provide this, Stripe will dynamically show relevant payment methods from your [payment method settings](https://dashboard.stripe.com/settings/payment_methods). A list of valid payment method types can be found [here](https://docs.stripe.com/api/payment_methods/object#payment_method_object-type).
  * `radar_options` - Options to configure Radar. Learn more about [Radar Sessions](https://docs.stripe.com/radar/radar-session).
  * `receipt_email` - Email address to send the receipt to. If you specify `receipt_email` for a payment in live mode, you send a receipt regardless of your [email settings](https://dashboard.stripe.com/account/emails).
  * `return_url` - The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme. This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm).
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `off_session`, `on_session`.
  * `shipping` - Shipping information for this PaymentIntent.
  * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead. Max length: 22.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. Max length: 22.
  * `transfer_data` - The parameters that you can use to automatically create a Transfer.
  Learn more about the [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `transfer_group` - A string that identifies the resulting payment as part of a group. Learn more about the [use case for connected accounts](https://docs.stripe.com/connect/separate-charges-and-transfers).
  * `use_stripe_sdk` - Set to `true` when confirming server-side and using Stripe.js, iOS, or Android client-side SDKs to handle the next actions.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_details,
    :application_fee_amount,
    :automatic_payment_methods,
    :capture_method,
    :confirm,
    :confirmation_method,
    :confirmation_token,
    :currency,
    :customer,
    :customer_account,
    :description,
    :error_on_requires_action,
    :excluded_payment_method_types,
    :expand,
    :hooks,
    :mandate,
    :mandate_data,
    :metadata,
    :off_session,
    :on_behalf_of,
    :payment_details,
    :payment_method,
    :payment_method_configuration,
    :payment_method_data,
    :payment_method_options,
    :payment_method_types,
    :radar_options,
    :receipt_email,
    :return_url,
    :setup_future_usage,
    :shipping,
    :statement_descriptor,
    :statement_descriptor_suffix,
    :transfer_data,
    :transfer_group,
    :use_stripe_sdk
  ]
end
