# File generated from our OpenAPI spec
defmodule Stripe.Params.Checkout.SessionCreateParams do
  @moduledoc "Parameters for session create."

  @typedoc """
  * `adaptive_pricing` - Settings for price localization with [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing).
  * `after_expiration` - Configure actions after a Checkout Session has expired. You can't set this parameter if `ui_mode` is `elements`.
  * `allow_promotion_codes` - Enables user redeemable promotion codes.
  * `automatic_tax` - Settings for automatic tax lookup for this session and resulting payments, invoices, and subscriptions.
  * `billing_address_collection` - Specify whether Checkout should collect the customer's billing address. Defaults to `auto`. Possible values: `auto`, `required`.
  * `branding_settings` - The branding settings for the Checkout Session. This parameter is not allowed if ui_mode is `elements`.
  * `cancel_url` - If set, Checkout displays a back button and customers will be directed to this URL if they decide to cancel payment and return to your website. This parameter is not allowed if ui_mode is `embedded_page` or `elements`.
  * `client_reference_id` - A unique string to reference the Checkout Session. This can be a
  customer ID, a cart ID, or similar, and can be used to reconcile the
  session with your internal systems. Max length: 200.
  * `consent_collection` - Configure fields for the Checkout Session to gather active consent from customers.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Required in `setup` mode when `payment_method_types` is not set. Format: ISO 4217 currency code.
  * `custom_fields` - Collect additional information from your customer using custom fields. Up to 3 fields are supported. You can't set this parameter if `ui_mode` is `custom`.
  * `custom_text` - Display additional text for your customers using custom text. You can't set this parameter if `ui_mode` is `custom`.
  * `customer` - ID of an existing Customer, if one exists. In `payment` mode, the customer’s most recently saved card
  payment method will be used to prefill the email, name, card details, and billing address
  on the Checkout page. In `subscription` mode, the customer’s [default payment method](https://docs.stripe.com/api/customers/update#update_customer-invoice_settings-default_payment_method)
  will be used if it’s a card, otherwise the most recently saved card will be used. A valid billing address, billing name and billing email are required on the payment method for Checkout to prefill the customer's card details.

  If the Customer already has a valid [email](https://docs.stripe.com/api/customers/object#customer_object-email) set, the email will be prefilled and not editable in Checkout.
  If the Customer does not have a valid `email`, Checkout will set the email entered during the session on the Customer.

  If blank for Checkout Sessions in `subscription` mode or with `customer_creation` set as `always` in `payment` mode, Checkout will create a new Customer object based on information provided during the payment flow.

  You can set [`payment_intent_data.setup_future_usage`](https://docs.stripe.com/api/checkout/sessions/create#create_checkout_session-payment_intent_data-setup_future_usage) to have Checkout automatically attach the payment method to the Customer you pass in for future reuse. Max length: 5000.
  * `customer_account` - ID of an existing Account, if one exists. Has the same behavior as `customer`. Max length: 5000.
  * `customer_creation` - Configure whether a Checkout Session creates a [Customer](https://docs.stripe.com/api/customers) during Session confirmation.

  When a Customer is not created, you can still retrieve email, address, and other customer data entered in Checkout
  with [customer_details](https://docs.stripe.com/api/checkout/sessions/object#checkout_session_object-customer_details).

  Sessions that don't create Customers instead are grouped by [guest customers](https://docs.stripe.com/payments/checkout/guest-customers)
  in the Dashboard. Promotion codes limited to first time customers will return invalid for these Sessions.

  Can only be set in `payment` and `setup` mode. Possible values: `always`, `if_required`.
  * `customer_email` - If provided, this value will be used when the Customer object is created.
  If not provided, customers will be asked to enter their email address.
  Use this parameter to prefill customer data if you already have an email
  on file. To access information about the customer once a session is
  complete, use the `customer` field.
  * `customer_update` - Controls what fields on Customer can be updated by the Checkout Session. Can only be provided when `customer` is provided.
  * `discounts` - The coupon or promotion code to apply to this Session. Currently, only up to one may be specified.
  * `excluded_payment_method_types` - A list of the types of payment methods (e.g., `card`) that should be excluded from this Checkout Session. This should only be used when payment methods for this Checkout Session are managed through the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods).
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - The Epoch time in seconds at which the Checkout Session will expire. It can be anywhere from 30 minutes to 24 hours after Checkout Session creation. By default, this value is 24 hours from creation. Format: Unix timestamp.
  * `integration_identifier` - The integration identifier for this Checkout Session. Multiple Checkout Sessions can have the same integration identifier. Max length: 200.
  * `invoice_creation` - Generate a post-purchase Invoice for one-time payments.
  * `line_items` - A list of items the customer is purchasing. Use this parameter to pass one-time or recurring [Prices](https://docs.stripe.com/api/prices). The parameter is required for `payment` and `subscription` mode.

  For `payment` mode, there is a maximum of 100 line items, however it is recommended to consolidate line items if there are more than a few dozen.

  For `subscription` mode, there is a maximum of 20 line items with recurring Prices and 20 line items with one-time Prices. Line items with one-time Prices will be on the initial invoice only.
  * `locale` - The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used. Possible values: `auto`, `bg`, `cs`, `da`, `de`, `el`, `en`, `en-GB`, `es`, `es-419`, `et`, `fi`, `fil`, `fr`, `fr-CA`, `hr`, `hu`, `id`, `it`, `ja`, `ko`, `lt`, `lv`, `ms`, `mt`, `nb`, `nl`, `pl`, `pt`, `pt-BR`, `ro`, `ru`, `sk`, `sl`, `sv`, `th`, `tr`, `vi`, `zh`, `zh-HK`, `zh-TW`.
  * `managed_payments` - Settings for Managed Payments for this Checkout Session and resulting [PaymentIntents](https://docs.stripe.com/api/payment_intents/object), [Invoices](https://docs.stripe.com/api/invoices/object), and [Subscriptions](https://docs.stripe.com/api/subscriptions/object).
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `mode` - The mode of the Checkout Session. Pass `subscription` if the Checkout Session includes at least one recurring item. Possible values: `payment`, `setup`, `subscription`.
  * `name_collection` - Controls name collection settings for the session.

  You can configure Checkout to collect your customers' business names, individual names, or both. Each name field can be either required or optional.

  If a [Customer](https://docs.stripe.com/api/customers) is created or provided, the names can be saved to the Customer object as well.
  * `optional_items` - A list of optional items the customer can add to their order at checkout. Use this parameter to pass one-time or recurring [Prices](https://docs.stripe.com/api/prices).

  There is a maximum of 10 optional items allowed on a Checkout Session, and the existing limits on the number of line items allowed on a Checkout Session apply to the combined number of line items and optional items.

  For `payment` mode, there is a maximum of 100 combined line items and optional items, however it is recommended to consolidate items if there are more than a few dozen.

  For `subscription` mode, there is a maximum of 20 line items and optional items with recurring Prices and 20 line items and optional items with one-time Prices.

  You can't set this parameter if `ui_mode` is `custom`.
  * `origin_context` - Where the user is coming from. This informs the optimizations that are applied to the session. You can't set this parameter if `ui_mode` is `elements`. Possible values: `mobile_app`, `web`.
  * `payment_intent_data` - A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in `payment` mode.
  * `payment_method_collection` - Specify whether Checkout should collect a payment method. When set to `if_required`, Checkout will not collect a payment method when the total due for the session is 0.
  This may occur if the Checkout Session includes a free trial or a discount.

  Can only be set in `subscription` mode. Defaults to `always`.

  If you'd like information on how to collect a payment method outside of Checkout, read the guide on configuring [subscriptions with a free trial](https://docs.stripe.com/payments/checkout/free-trials). Possible values: `always`, `if_required`.
  * `payment_method_configuration` - The ID of the payment method configuration to use with this Checkout session. Max length: 100.
  * `payment_method_data` - This parameter allows you to set some attributes on the payment method created during a Checkout session.
  * `payment_method_options` - Payment-method-specific configuration.
  * `payment_method_types` - A list of the types of payment methods (e.g., `card`) this Checkout Session can accept.

  You can omit this attribute to manage your payment methods from the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods).
  See [Dynamic Payment Methods](https://docs.stripe.com/payments/payment-methods/integration-options#using-dynamic-payment-methods) for more details.

  Read more about the supported payment methods and their requirements in our [payment
  method details guide](https://docs.stripe.com/docs/payments/checkout/payment-methods).

  If multiple payment methods are passed, Checkout will dynamically reorder them to
  prioritize the most relevant payment methods based on the customer's location and
  other characteristics.
  * `permissions` - This property is used to set up permissions for various actions (e.g., update) on the CheckoutSession object. Can only be set when creating `embedded` or `custom` sessions.

  For specific permissions, please refer to their dedicated subsections, such as `permissions.update_shipping_details`.
  * `phone_number_collection` - Controls phone number collection settings for the session.

  We recommend that you review your privacy policy and check with your legal contacts
  before using this feature. Learn more about [collecting phone numbers with Checkout](https://docs.stripe.com/payments/checkout/phone-numbers).
  * `redirect_on_completion` - This parameter applies to `ui_mode: embedded_page`. Learn more about the [redirect behavior](https://docs.stripe.com/payments/checkout/custom-success-page?payment-ui=embedded-form) of embedded sessions. Defaults to `always`. Possible values: `always`, `if_required`, `never`.
  * `return_url` - The URL to redirect your customer back to after they authenticate or cancel their payment on the
  payment method's app or site. This parameter is required if `ui_mode` is `embedded_page` or `elements`
  and redirect-based payment methods are enabled on the session.
  * `saved_payment_method_options` - Controls saved payment method settings for the session. Only available in `payment` and `subscription` mode.
  * `setup_intent_data` - A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
  * `shipping_address_collection` - When set, provides configuration for Checkout to collect a shipping address from a customer.
  * `shipping_options` - The shipping rate options to apply to this Session. Up to a maximum of 5.
  * `submit_type` - Describes the type of transaction being performed by Checkout in order
  to customize relevant text on the page, such as the submit button.
  `submit_type` can only be specified on Checkout Sessions in
  `payment` or `subscription` mode. If blank or `auto`, `pay` is used.
  You can't set this parameter if `ui_mode` is `elements`. Possible values: `auto`, `book`, `donate`, `pay`, `subscribe`.
  * `subscription_data` - A subset of parameters to be passed to subscription creation for Checkout Sessions in `subscription` mode.
  * `success_url` - The URL to which Stripe should send customers when payment or setup
  is complete.
  This parameter is not allowed if ui_mode is `embedded_page` or `elements`. If you'd like to use
  information from the successful Checkout Session on your page, read the
  guide on [customizing your success page](https://docs.stripe.com/payments/checkout/custom-success-page).
  * `tax_id_collection` - Controls tax ID collection during checkout.
  * `ui_mode` - The UI mode of the Session. Defaults to `hosted_page`. Possible values: `elements`, `embedded_page`, `form`, `hosted_page`.
  * `wallet_options` - Wallet-specific configuration.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :adaptive_pricing,
    :after_expiration,
    :allow_promotion_codes,
    :automatic_tax,
    :billing_address_collection,
    :branding_settings,
    :cancel_url,
    :client_reference_id,
    :consent_collection,
    :currency,
    :custom_fields,
    :custom_text,
    :customer,
    :customer_account,
    :customer_creation,
    :customer_email,
    :customer_update,
    :discounts,
    :excluded_payment_method_types,
    :expand,
    :expires_at,
    :integration_identifier,
    :invoice_creation,
    :line_items,
    :locale,
    :managed_payments,
    :metadata,
    :mode,
    :name_collection,
    :optional_items,
    :origin_context,
    :payment_intent_data,
    :payment_method_collection,
    :payment_method_configuration,
    :payment_method_data,
    :payment_method_options,
    :payment_method_types,
    :permissions,
    :phone_number_collection,
    :redirect_on_completion,
    :return_url,
    :saved_payment_method_options,
    :setup_intent_data,
    :shipping_address_collection,
    :shipping_options,
    :submit_type,
    :subscription_data,
    :success_url,
    :tax_id_collection,
    :ui_mode,
    :wallet_options
  ]
end
