# File generated from our OpenAPI spec
defmodule Stripe.Resources.Checkout.Session do
  @moduledoc """
  Session

  A Checkout Session represents your customer's session as they pay for
  one-time purchases or subscriptions through [Checkout](https://docs.stripe.com/payments/checkout)
  or [Payment Links](https://docs.stripe.com/payments/payment-links). We recommend creating a
  new Session each time your customer attempts to pay.

  Once payment is successful, the Checkout Session will contain a reference
  to the [Customer](https://docs.stripe.com/api/customers), and either the successful
  [PaymentIntent](https://docs.stripe.com/api/payment_intents) or an active
  [Subscription](https://docs.stripe.com/api/subscriptions).

  You can create a Checkout Session on your server and redirect to its URL
  to begin Checkout.

  Related guide: [Checkout quickstart](https://docs.stripe.com/checkout/quickstart)
  """

  @typedoc """
  * `adaptive_pricing` - Settings for price localization with [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing). Nullable. Expandable.
  * `after_expiration` - When set, provides configuration for actions to take if this Checkout Session expires. Nullable. Expandable.
  * `allow_promotion_codes` - Enables user redeemable promotion codes. Nullable.
  * `amount_subtotal` - Total of all items before discounts or taxes are applied. Nullable.
  * `amount_total` - Total of all items after discounts and taxes are applied. Nullable.
  * `automatic_tax` - Expandable.
  * `billing_address_collection` - Describes whether Checkout should collect the customer's billing address. Defaults to `auto`. Possible values: `auto`, `required`. Nullable.
  * `branding_settings` - Expandable.
  * `cancel_url` - If set, Checkout displays a back button and customers will be directed to this URL if they decide to cancel payment and return to your website. Max length: 5000. Nullable.
  * `client_reference_id` - A unique string to reference the Checkout Session. This can be a
  customer ID, a cart ID, or similar, and can be used to reconcile the
  Session with your internal systems. Max length: 5000. Nullable.
  * `client_secret` - The client secret of your Checkout Session. Applies to Checkout Sessions with `ui_mode: embedded` or `ui_mode: custom`. For `ui_mode: embedded`, the client secret is to be used when initializing Stripe.js embedded checkout.
  For `ui_mode: custom`, use the client secret with [initCheckout](https://docs.stripe.com/js/custom_checkout/init) on your front end. Max length: 5000. Nullable.
  * `collected_information` - Information about the customer collected within the Checkout Session. Nullable. Expandable.
  * `consent` - Results of `consent_collection` for this session. Nullable. Expandable.
  * `consent_collection` - When set, provides configuration for the Checkout Session to gather active consent from customers. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code. Nullable.
  * `currency_conversion` - Currency conversion details for [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing) sessions created before 2025-03-31. Nullable. Expandable.
  * `custom_fields` - Collect additional information from your customer using custom fields. Up to 3 fields are supported. You can't set this parameter if `ui_mode` is `custom`. Expandable.
  * `custom_text` - Expandable.
  * `customer` - The ID of the customer for this Session.
  For Checkout Sessions in `subscription` mode or Checkout Sessions with `customer_creation` set as `always` in `payment` mode, Checkout
  will create a new customer object based on information provided
  during the payment flow unless an existing customer was provided when
  the Session was created. Nullable. Expandable.
  * `customer_account` - The ID of the account for this Session. Max length: 5000. Nullable.
  * `customer_creation` - Configure whether a Checkout Session creates a Customer when the Checkout Session completes. Possible values: `always`, `if_required`. Nullable.
  * `customer_details` - The customer details including the customer's tax exempt status and the customer's tax IDs. Customer's address details are not present on Sessions in `setup` mode. Nullable. Expandable.
  * `customer_email` - If provided, this value will be used when the Customer object is created.
  If not provided, customers will be asked to enter their email address.
  Use this parameter to prefill customer data if you already have an email
  on file. To access information about the customer once the payment flow is
  complete, use the `customer` attribute. Max length: 5000. Nullable.
  * `discounts` - List of coupons and promotion codes attached to the Checkout Session. Nullable. Expandable.
  * `excluded_payment_method_types` - A list of the types of payment methods (e.g., `card`) that should be excluded from this Checkout Session. This should only be used when payment methods for this Checkout Session are managed through the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods).
  * `expires_at` - The timestamp at which the Checkout Session will expire. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - ID of the invoice created by the Checkout Session, if it exists. Nullable. Expandable.
  * `invoice_creation` - Details on the state of invoice creation for the Checkout Session. Nullable. Expandable.
  * `line_items` - The line items purchased by the customer. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `locale` - The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used. Possible values: `auto`, `bg`, `cs`, `da`, `de`, `el`, `en`, `en-GB`, `es`, `es-419`, `et`, `fi`, `fil`, `fr`, `fr-CA`, `hr`, `hu`, `id`, `it`, `ja`, `ko`, `lt`, `lv`, `ms`, `mt`, `nb`, `nl`, `pl`, `pt`, `pt-BR`, `ro`, `ru`, `sk`, `sl`, `sv`, `th`, `tr`, `vi`, `zh`, `zh-HK`, `zh-TW`. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `mode` - The mode of the Checkout Session. Possible values: `payment`, `setup`, `subscription`.
  * `name_collection` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `checkout.session`.
  * `optional_items` - The optional items presented to the customer at checkout. Nullable. Expandable.
  * `origin_context` - Where the user is coming from. This informs the optimizations that are applied to the session. Possible values: `mobile_app`, `web`. Nullable.
  * `payment_intent` - The ID of the PaymentIntent for Checkout Sessions in `payment` mode. You can't confirm or cancel the PaymentIntent for a Checkout Session. To cancel, [expire the Checkout Session](https://docs.stripe.com/api/checkout/sessions/expire) instead. Nullable. Expandable.
  * `payment_link` - The ID of the Payment Link that created this Session. Nullable. Expandable.
  * `payment_method_collection` - Configure whether a Checkout Session should collect a payment method. Defaults to `always`. Possible values: `always`, `if_required`. Nullable.
  * `payment_method_configuration_details` - Information about the payment method configuration used for this Checkout session if using dynamic payment methods. Nullable. Expandable.
  * `payment_method_options` - Payment-method-specific configuration for the PaymentIntent or SetupIntent of this CheckoutSession. Nullable. Expandable.
  * `payment_method_types` - A list of the types of payment methods (e.g. card) this Checkout
  Session is allowed to accept.
  * `payment_status` - The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`.
  You can use this value to decide when to fulfill your customer's order. Possible values: `no_payment_required`, `paid`, `unpaid`.
  * `permissions` - This property is used to set up permissions for various actions (e.g., update) on the CheckoutSession object.

  For specific permissions, please refer to their dedicated subsections, such as `permissions.update_shipping_details`. Nullable. Expandable.
  * `phone_number_collection` - Expandable.
  * `presentment_details` - Expandable.
  * `recovered_from` - The ID of the original expired Checkout Session that triggered the recovery flow. Max length: 5000. Nullable.
  * `redirect_on_completion` - This parameter applies to `ui_mode: embedded`. Learn more about the [redirect behavior](https://docs.stripe.com/payments/checkout/custom-success-page?payment-ui=embedded-form) of embedded sessions. Defaults to `always`. Possible values: `always`, `if_required`, `never`.
  * `return_url` - Applies to Checkout Sessions with `ui_mode: embedded` or `ui_mode: custom`. The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. Max length: 5000.
  * `saved_payment_method_options` - Controls saved payment method settings for the session. Only available in `payment` and `subscription` mode. Nullable. Expandable.
  * `setup_intent` - The ID of the SetupIntent for Checkout Sessions in `setup` mode. You can't confirm or cancel the SetupIntent for a Checkout Session. To cancel, [expire the Checkout Session](https://docs.stripe.com/api/checkout/sessions/expire) instead. Nullable. Expandable.
  * `shipping_address_collection` - When set, provides configuration for Checkout to collect a shipping address from a customer. Nullable. Expandable.
  * `shipping_cost` - The details of the customer cost of shipping, including the customer chosen ShippingRate. Nullable. Expandable.
  * `shipping_options` - The shipping rate options applied to this Session. Expandable.
  * `status` - The status of the Checkout Session, one of `open`, `complete`, or `expired`. Possible values: `complete`, `expired`, `open`. Nullable.
  * `submit_type` - Describes the type of transaction being performed by Checkout in order to customize
  relevant text on the page, such as the submit button. `submit_type` can only be
  specified on Checkout Sessions in `payment` mode. If blank or `auto`, `pay` is used. Possible values: `auto`, `book`, `donate`, `pay`, `subscribe`. Nullable.
  * `subscription` - The ID of the [Subscription](https://docs.stripe.com/api/subscriptions) for Checkout Sessions in `subscription` mode. Nullable. Expandable.
  * `success_url` - The URL the customer will be directed to after the payment or
  subscription creation is successful. Max length: 5000. Nullable.
  * `tax_id_collection` - Expandable.
  * `total_details` - Tax and discount details for the computed total amount. Nullable. Expandable.
  * `ui_mode` - The UI mode of the Session. Defaults to `hosted`. Possible values: `custom`, `embedded`, `hosted`. Nullable.
  * `url` - The URL to the Checkout Session. Applies to Checkout Sessions with `ui_mode: hosted`. Redirect customers to this URL to take them to Checkout. If you’re using [Custom Domains](https://docs.stripe.com/payments/checkout/custom-domains), the URL will use your subdomain. Otherwise, it’ll use `checkout.stripe.com.`
  This value is only present when the session is active. Max length: 5000. Nullable.
  * `wallet_options` - Wallet-specific configuration for this Checkout Session. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          adaptive_pricing: adaptive_pricing(),
          after_expiration: after_expiration(),
          allow_promotion_codes: boolean(),
          amount_subtotal: integer(),
          amount_total: integer(),
          automatic_tax: automatic_tax(),
          billing_address_collection: String.t(),
          branding_settings: branding_settings() | nil,
          cancel_url: String.t(),
          client_reference_id: String.t(),
          client_secret: String.t(),
          collected_information: collected_information(),
          consent: consent(),
          consent_collection: consent_collection(),
          created: integer(),
          currency: String.t(),
          currency_conversion: currency_conversion(),
          custom_fields: [custom_fields()],
          custom_text: custom_text(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          customer_creation: String.t(),
          customer_details: customer_details(),
          customer_email: String.t(),
          discounts: [discounts()],
          excluded_payment_method_types: [String.t()] | nil,
          expires_at: integer(),
          id: String.t(),
          invoice: String.t() | Stripe.Resources.Invoice.t(),
          invoice_creation: invoice_creation(),
          line_items: line_items() | nil,
          livemode: boolean(),
          locale: String.t(),
          metadata: %{String.t() => String.t()},
          mode: String.t(),
          name_collection: name_collection() | nil,
          object: String.t(),
          optional_items: [optional_items()] | nil,
          origin_context: String.t(),
          payment_intent: String.t() | Stripe.Resources.PaymentIntent.t(),
          payment_link: String.t() | Stripe.Resources.PaymentLink.t(),
          payment_method_collection: String.t(),
          payment_method_configuration_details: payment_method_configuration_details(),
          payment_method_options: payment_method_options(),
          payment_method_types: [String.t()],
          payment_status: String.t(),
          permissions: Stripe.Resources.Permissions.t(),
          phone_number_collection: phone_number_collection() | nil,
          presentment_details: presentment_details() | nil,
          recovered_from: String.t(),
          redirect_on_completion: String.t() | nil,
          return_url: String.t() | nil,
          saved_payment_method_options: saved_payment_method_options(),
          setup_intent: String.t() | Stripe.Resources.SetupIntent.t(),
          shipping_address_collection: Stripe.Resources.ShippingAddressCollection.t(),
          shipping_cost: shipping_cost(),
          shipping_options: [shipping_options()],
          status: String.t(),
          submit_type: String.t(),
          subscription: String.t() | Stripe.Resources.Subscription.t(),
          success_url: String.t(),
          tax_id_collection: tax_id_collection() | nil,
          total_details: total_details(),
          ui_mode: String.t(),
          url: String.t(),
          wallet_options: wallet_options()
        }

  defstruct [
    :adaptive_pricing,
    :after_expiration,
    :allow_promotion_codes,
    :amount_subtotal,
    :amount_total,
    :automatic_tax,
    :billing_address_collection,
    :branding_settings,
    :cancel_url,
    :client_reference_id,
    :client_secret,
    :collected_information,
    :consent,
    :consent_collection,
    :created,
    :currency,
    :currency_conversion,
    :custom_fields,
    :custom_text,
    :customer,
    :customer_account,
    :customer_creation,
    :customer_details,
    :customer_email,
    :discounts,
    :excluded_payment_method_types,
    :expires_at,
    :id,
    :invoice,
    :invoice_creation,
    :line_items,
    :livemode,
    :locale,
    :metadata,
    :mode,
    :name_collection,
    :object,
    :optional_items,
    :origin_context,
    :payment_intent,
    :payment_link,
    :payment_method_collection,
    :payment_method_configuration_details,
    :payment_method_options,
    :payment_method_types,
    :payment_status,
    :permissions,
    :phone_number_collection,
    :presentment_details,
    :recovered_from,
    :redirect_on_completion,
    :return_url,
    :saved_payment_method_options,
    :setup_intent,
    :shipping_address_collection,
    :shipping_cost,
    :shipping_options,
    :status,
    :submit_type,
    :subscription,
    :success_url,
    :tax_id_collection,
    :total_details,
    :ui_mode,
    :url,
    :wallet_options
  ]

  @object_name "checkout.session"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "adaptive_pricing",
      "after_expiration",
      "automatic_tax",
      "branding_settings",
      "collected_information",
      "consent",
      "consent_collection",
      "currency_conversion",
      "custom_fields",
      "custom_text",
      "customer",
      "customer_details",
      "discounts",
      "invoice",
      "invoice_creation",
      "line_items",
      "name_collection",
      "optional_items",
      "payment_intent",
      "payment_link",
      "payment_method_configuration_details",
      "payment_method_options",
      "permissions",
      "phone_number_collection",
      "presentment_details",
      "saved_payment_method_options",
      "setup_intent",
      "shipping_address_collection",
      "shipping_cost",
      "shipping_options",
      "subscription",
      "tax_id_collection",
      "total_details",
      "wallet_options"
    ]

  @typedoc """
  * `enabled` - If enabled, Adaptive Pricing is available on [eligible sessions](https://docs.stripe.com/payments/currencies/localize-prices/adaptive-pricing?payment-ui=stripe-hosted#restrictions).
  """
  @type adaptive_pricing :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `recovery` - When set, configuration used to recover the Checkout Session on expiry. Nullable.
  """
  @type after_expiration :: %{
          optional(:recovery) => after_expiration_recovery() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allow_promotion_codes` - Enables user redeemable promotion codes on the recovered Checkout Sessions. Defaults to `false`
  * `enabled` - If `true`, a recovery url will be generated to recover this Checkout Session if it
  expires before a transaction is completed. It will be attached to the
  Checkout Session object upon expiration.
  * `expires_at` - The timestamp at which the recovery URL will expire. Format: Unix timestamp. Nullable.
  * `url` - URL that creates a new Checkout Session when clicked that is a copy of this expired Checkout Session Max length: 5000. Nullable.
  """
  @type after_expiration_recovery :: %{
          optional(:allow_promotion_codes) => boolean() | nil,
          optional(:enabled) => boolean() | nil,
          optional(:expires_at) => integer() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates whether automatic tax is enabled for the session
  * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account. Nullable.
  * `provider` - The tax provider powering automatic tax. Max length: 5000. Nullable.
  * `status` - The status of the most recent automated tax calculation for this session. Possible values: `complete`, `failed`, `requires_location_inputs`. Nullable.
  """
  @type automatic_tax :: %{
          optional(:enabled) => boolean() | nil,
          optional(:liability) => automatic_tax_liability() | nil,
          optional(:provider) => String.t() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type automatic_tax_liability :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `background_color` - A hex color value starting with `#` representing the background color for the Checkout Session. Max length: 5000.
  * `border_style` - The border style for the Checkout Session. Must be one of `rounded`, `rectangular`, or `pill`. Possible values: `pill`, `rectangular`, `rounded`.
  * `button_color` - A hex color value starting with `#` representing the button color for the Checkout Session. Max length: 5000.
  * `display_name` - The display name shown on the Checkout Session. Max length: 5000.
  * `font_family` - The font family for the Checkout Session. Must be one of the [supported font families](https://docs.stripe.com/payments/checkout/customization/appearance?payment-ui=stripe-hosted#font-compatibility). Max length: 5000.
  * `icon` - The icon for the Checkout Session. You cannot set both `logo` and `icon`. Nullable.
  * `logo` - The logo for the Checkout Session. You cannot set both `logo` and `icon`. Nullable.
  """
  @type branding_settings :: %{
          optional(:background_color) => String.t() | nil,
          optional(:border_style) => String.t() | nil,
          optional(:button_color) => String.t() | nil,
          optional(:display_name) => String.t() | nil,
          optional(:font_family) => String.t() | nil,
          optional(:icon) => branding_settings_icon() | nil,
          optional(:logo) => branding_settings_logo() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `file` - The ID of a [File upload](https://stripe.com/docs/api/files) representing the icon. Purpose must be `business_icon`. Required if `type` is `file` and disallowed otherwise. Max length: 5000.
  * `type` - The type of image for the icon. Must be one of `file` or `url`. Possible values: `file`, `url`.
  * `url` - The URL of the image. Present when `type` is `url`. Max length: 5000.
  """
  @type branding_settings_icon :: %{
          optional(:file) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `file` - The ID of a [File upload](https://stripe.com/docs/api/files) representing the logo. Purpose must be `business_logo`. Required if `type` is `file` and disallowed otherwise. Max length: 5000.
  * `type` - The type of image for the logo. Must be one of `file` or `url`. Possible values: `file`, `url`.
  * `url` - The URL of the image. Present when `type` is `url`. Max length: 5000.
  """
  @type branding_settings_logo :: %{
          optional(:file) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `business_name` - Customer’s business name for this Checkout Session Max length: 5000. Nullable.
  * `individual_name` - Customer’s individual name for this Checkout Session Max length: 5000. Nullable.
  * `shipping_details` - Shipping information for this Checkout Session. Nullable.
  """
  @type collected_information :: %{
          optional(:business_name) => String.t() | nil,
          optional(:individual_name) => String.t() | nil,
          optional(:shipping_details) => collected_information_shipping_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address`
  * `name` - Customer name. Max length: 5000.
  """
  @type collected_information_shipping_details :: %{
          optional(:address) => Stripe.Resources.Address.t() | nil,
          optional(:name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `promotions` - If `opt_in`, the customer consents to receiving promotional communications
  from the merchant about this Checkout Session. Possible values: `opt_in`, `opt_out`. Nullable.
  * `terms_of_service` - If `accepted`, the customer in this Checkout Session has agreed to the merchant's terms of service. Possible values: `accepted`. Nullable.
  """
  @type consent :: %{
          optional(:promotions) => String.t() | nil,
          optional(:terms_of_service) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_method_reuse_agreement` - If set to `hidden`, it will hide legal text related to the reuse of a payment method. Nullable.
  * `promotions` - If set to `auto`, enables the collection of customer consent for promotional communications. The Checkout
  Session will determine whether to display an option to opt into promotional communication
  from the merchant depending on the customer's locale. Only available to US merchants. Possible values: `auto`, `none`. Nullable.
  * `terms_of_service` - If set to `required`, it requires customers to accept the terms of service before being able to pay. Possible values: `none`, `required`. Nullable.
  """
  @type consent_collection :: %{
          optional(:payment_method_reuse_agreement) =>
            consent_collection_payment_method_reuse_agreement() | nil,
          optional(:promotions) => String.t() | nil,
          optional(:terms_of_service) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `position` - Determines the position and visibility of the payment method reuse agreement in the UI. When set to `auto`, Stripe's defaults will be used.

  When set to `hidden`, the payment method reuse agreement text will always be hidden in the UI. Possible values: `auto`, `hidden`.
  """
  @type consent_collection_payment_method_reuse_agreement :: %{
          optional(:position) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_subtotal` - Total of all items in source currency before discounts or taxes are applied.
  * `amount_total` - Total of all items in source currency after discounts and taxes are applied.
  * `fx_rate` - Exchange rate used to convert source currency amounts to customer currency amounts Format: decimal string.
  * `source_currency` - Creation currency of the CheckoutSession before localization Max length: 5000.
  """
  @type currency_conversion :: %{
          optional(:amount_subtotal) => integer() | nil,
          optional(:amount_total) => integer() | nil,
          optional(:fx_rate) => String.t() | nil,
          optional(:source_currency) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dropdown`
  * `key` - String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters. Max length: 5000.
  * `label`
  * `numeric`
  * `optional` - Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
  * `text`
  * `type` - The type of the field. Possible values: `dropdown`, `numeric`, `text`.
  """
  @type custom_fields :: %{
          optional(:dropdown) => Stripe.Resources.CustomFieldDropdown.t() | nil,
          optional(:key) => String.t() | nil,
          optional(:label) => custom_fields_label() | nil,
          optional(:numeric) => Stripe.Resources.CustomFieldNumeric.t() | nil,
          optional(:optional) => boolean() | nil,
          optional(:text) => custom_fields_text() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom` - Custom text for the label, displayed to the customer. Up to 50 characters. Max length: 5000. Nullable.
  * `type` - The type of the label. Possible values: `custom`.
  """
  @type custom_fields_label :: %{
          optional(:custom) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_value` - The value that will pre-fill the field on the payment page. Max length: 5000. Nullable.
  * `maximum_length` - The maximum character length constraint for the customer's input. Nullable.
  * `minimum_length` - The minimum character length requirement for the customer's input. Nullable.
  * `value` - The value entered by the customer. Max length: 5000. Nullable.
  """
  @type custom_fields_text :: %{
          optional(:default_value) => String.t() | nil,
          optional(:maximum_length) => integer() | nil,
          optional(:minimum_length) => integer() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `after_submit` - Custom text that should be displayed after the payment confirmation button. Nullable.
  * `shipping_address` - Custom text that should be displayed alongside shipping address collection. Nullable.
  * `submit` - Custom text that should be displayed alongside the payment confirmation button. Nullable.
  * `terms_of_service_acceptance` - Custom text that should be displayed in place of the default terms of service agreement text. Nullable.
  """
  @type custom_text :: %{
          optional(:after_submit) => custom_text_after_submit() | nil,
          optional(:shipping_address) => custom_text_shipping_address() | nil,
          optional(:submit) => custom_text_submit() | nil,
          optional(:terms_of_service_acceptance) =>
            custom_text_terms_of_service_acceptance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `message` - Text may be up to 1200 characters in length. Max length: 500.
  """
  @type custom_text_after_submit :: %{
          optional(:message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `message` - Text may be up to 1200 characters in length. Max length: 500.
  """
  @type custom_text_shipping_address :: %{
          optional(:message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `message` - Text may be up to 1200 characters in length. Max length: 500.
  """
  @type custom_text_submit :: %{
          optional(:message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `message` - Text may be up to 1200 characters in length. Max length: 500.
  """
  @type custom_text_terms_of_service_acceptance :: %{
          optional(:message) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The customer's address after a completed Checkout Session. Note: This property is populated only for sessions on or after March 30, 2022. Nullable.
  * `business_name` - The customer's business name after a completed Checkout Session. Max length: 150. Nullable.
  * `email` - The email associated with the Customer, if one exists, on the Checkout Session after a completed Checkout Session or at time of session expiry.
  Otherwise, if the customer has consented to promotional content, this value is the most recent valid email provided by the customer on the Checkout form. Max length: 5000. Nullable.
  * `individual_name` - The customer's individual name after a completed Checkout Session. Max length: 150. Nullable.
  * `name` - The customer's name after a completed Checkout Session. Note: This property is populated only for sessions on or after March 30, 2022. Max length: 5000. Nullable.
  * `phone` - The customer's phone number after a completed Checkout Session. Max length: 5000. Nullable.
  * `tax_exempt` - The customer’s tax exempt status after a completed Checkout Session. Possible values: `exempt`, `none`, `reverse`. Nullable.
  * `tax_ids` - The customer’s tax IDs after a completed Checkout Session. Nullable.
  """
  @type customer_details :: %{
          optional(:address) => Stripe.Resources.Address.t() | nil,
          optional(:business_name) => String.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:individual_name) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(:tax_exempt) => String.t() | nil,
          optional(:tax_ids) => [customer_details_tax_ids()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The type of the tax ID, one of `ad_nrt`, `ar_cuit`, `eu_vat`, `bo_tin`, `br_cnpj`, `br_cpf`, `cn_tin`, `co_nit`, `cr_tin`, `do_rcn`, `ec_ruc`, `eu_oss_vat`, `hr_oib`, `pe_ruc`, `ro_tin`, `rs_pib`, `sv_nit`, `uy_ruc`, `ve_rif`, `vn_tin`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `no_voec`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `pl_nip`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `li_uid`, `li_vat`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, `ge_vat`, `ua_vat`, `is_vat`, `bg_uic`, `hu_tin`, `si_tin`, `ke_pin`, `tr_tin`, `eg_tin`, `ph_tin`, `al_tin`, `bh_vat`, `kz_bin`, `ng_tin`, `om_vat`, `de_stn`, `ch_uid`, `tz_vat`, `uz_vat`, `uz_tin`, `md_vat`, `ma_vat`, `by_tin`, `ao_tin`, `bs_tin`, `bb_tin`, `cd_nif`, `mr_nif`, `me_pib`, `zw_tin`, `ba_tin`, `gn_nif`, `mk_vat`, `sr_fin`, `sn_ninea`, `am_tin`, `np_pan`, `tj_tin`, `ug_tin`, `zm_tin`, `kh_tin`, `aw_tin`, `az_tin`, `bd_bin`, `bj_ifu`, `et_tin`, `kg_tin`, `la_tin`, `cm_niu`, `cv_nif`, `bf_ifu`, or `unknown` Possible values: `ad_nrt`, `ae_trn`, `al_tin`, `am_tin`, `ao_tin`, `ar_cuit`, `au_abn`, `au_arn`, `aw_tin`, `az_tin`, `ba_tin`, `bb_tin`, `bd_bin`, `bf_ifu`, `bg_uic`, `bh_vat`, `bj_ifu`, `bo_tin`, `br_cnpj`, `br_cpf`, `bs_tin`, `by_tin`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `cd_nif`, `ch_uid`, `ch_vat`, `cl_tin`, `cm_niu`, `cn_tin`, `co_nit`, `cr_tin`, `cv_nif`, `de_stn`, `do_rcn`, `ec_ruc`, `eg_tin`, `es_cif`, `et_tin`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `gn_nif`, `hk_br`, `hr_oib`, `hu_tin`, `id_npwp`, `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kg_tin`, `kh_tin`, `kr_brn`, `kz_bin`, `la_tin`, `li_uid`, `li_vat`, `ma_vat`, `md_vat`, `me_pib`, `mk_vat`, `mr_nif`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `ng_tin`, `no_vat`, `no_voec`, `np_pan`, `nz_gst`, `om_vat`, `pe_ruc`, `ph_tin`, `pl_nip`, `ro_tin`, `rs_pib`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `sn_ninea`, `sr_fin`, `sv_nit`, `th_vat`, `tj_tin`, `tr_tin`, `tw_vat`, `tz_vat`, `ua_vat`, `ug_tin`, `unknown`, `us_ein`, `uy_ruc`, `uz_tin`, `uz_vat`, `ve_rif`, `vn_tin`, `za_vat`, `zm_tin`, `zw_tin`.
  * `value` - The value of the tax ID. Max length: 5000. Nullable.
  """
  @type customer_details_tax_ids :: %{
          optional(:type) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `coupon` - Coupon attached to the Checkout Session. Nullable.
  * `promotion_code` - Promotion code attached to the Checkout Session. Nullable.
  """
  @type discounts :: %{
          optional(:coupon) => String.t() | Stripe.Resources.Coupon.t() | nil,
          optional(:promotion_code) => String.t() | Stripe.Resources.PromotionCode.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates whether invoice creation is enabled for the Checkout Session.
  * `invoice_data`
  """
  @type invoice_creation :: %{
          optional(:enabled) => boolean() | nil,
          optional(:invoice_data) => invoice_creation_invoice_data() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_tax_ids` - The account tax IDs associated with the invoice. Nullable.
  * `custom_fields` - Custom fields displayed on the invoice. Nullable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `footer` - Footer displayed on the invoice. Max length: 5000. Nullable.
  * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `rendering_options` - Options for invoice PDF rendering. Nullable.
  """
  @type invoice_creation_invoice_data :: %{
          optional(:account_tax_ids) => [String.t() | Stripe.Resources.TaxId.t()] | nil,
          optional(:custom_fields) => [invoice_creation_invoice_data_custom_fields()] | nil,
          optional(:description) => String.t() | nil,
          optional(:footer) => String.t() | nil,
          optional(:issuer) => invoice_creation_invoice_data_issuer() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:rendering_options) => invoice_creation_invoice_data_rendering_options() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `name` - The name of the custom field. Max length: 5000.
  * `value` - The value of the custom field. Max length: 5000.
  """
  @type invoice_creation_invoice_data_custom_fields :: %{
          optional(:name) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The connected account being referenced when `type` is `account`.
  * `type` - Type of the account referenced. Possible values: `account`, `self`.
  """
  @type invoice_creation_invoice_data_issuer :: %{
          optional(:account) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_tax_display` - How line-item prices and amounts will be displayed with respect to tax on invoice PDFs. Max length: 5000. Nullable.
  * `template` - ID of the invoice rendering template to be used for the generated invoice. Max length: 5000. Nullable.
  """
  @type invoice_creation_invoice_data_rendering_options :: %{
          optional(:amount_tax_display) => String.t() | nil,
          optional(:template) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type line_items :: %{
          optional(:data) => [Stripe.Resources.LineItem.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `business`
  * `individual`
  """
  @type name_collection :: %{
          optional(:business) => name_collection_business() | nil,
          optional(:individual) => name_collection_individual() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates whether business name collection is enabled for the session
  * `optional` - Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
  """
  @type name_collection_business :: %{
          optional(:enabled) => boolean() | nil,
          optional(:optional) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates whether individual name collection is enabled for the session
  * `optional` - Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
  """
  @type name_collection_individual :: %{
          optional(:enabled) => boolean() | nil,
          optional(:optional) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `adjustable_quantity` - Nullable.
  * `price` - Max length: 5000.
  * `quantity`
  """
  @type optional_items :: %{
          optional(:adjustable_quantity) => optional_items_adjustable_quantity() | nil,
          optional(:price) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Set to true if the quantity can be adjusted to any non-negative integer.
  * `maximum` - The maximum quantity of this item the customer can purchase. By default this value is 99. You can specify a value up to 999999. Nullable.
  * `minimum` - The minimum quantity of this item the customer must purchase, if they choose to purchase it. Because this item is optional, the customer will always be able to remove it from their order, even if the `minimum` configured here is greater than 0. By default this value is 0. Nullable.
  """
  @type optional_items_adjustable_quantity :: %{
          optional(:enabled) => boolean() | nil,
          optional(:maximum) => integer() | nil,
          optional(:minimum) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `id` - ID of the payment method configuration used. Max length: 5000.
  * `parent` - ID of the parent payment method configuration used. Max length: 5000. Nullable.
  """
  @type payment_method_configuration_details :: %{
          optional(:id) => String.t() | nil,
          optional(:parent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `acss_debit`
  * `affirm`
  * `afterpay_clearpay`
  * `alipay`
  * `alma`
  * `amazon_pay`
  * `au_becs_debit`
  * `bacs_debit`
  * `bancontact`
  * `billie`
  * `boleto`
  * `card`
  * `cashapp`
  * `customer_balance`
  * `eps`
  * `fpx`
  * `giropay`
  * `grabpay`
  * `ideal`
  * `kakao_pay`
  * `klarna`
  * `konbini`
  * `kr_card`
  * `link`
  * `mobilepay`
  * `multibanco`
  * `naver_pay`
  * `oxxo`
  * `p24`
  * `payco`
  * `paynow`
  * `paypal`
  * `payto`
  * `pix`
  * `revolut_pay`
  * `samsung_pay`
  * `satispay`
  * `sepa_debit`
  * `sofort`
  * `swish`
  * `twint`
  * `us_bank_account`
  """
  @type payment_method_options :: %{
          optional(:acss_debit) => payment_method_options_acss_debit() | nil,
          optional(:affirm) => payment_method_options_affirm() | nil,
          optional(:afterpay_clearpay) => Stripe.Resources.AfterpayClearpay.t() | nil,
          optional(:alipay) => payment_method_options_alipay() | nil,
          optional(:alma) => payment_method_options_alma() | nil,
          optional(:amazon_pay) => payment_method_options_amazon_pay() | nil,
          optional(:au_becs_debit) => payment_method_options_au_becs_debit() | nil,
          optional(:bacs_debit) => payment_method_options_bacs_debit() | nil,
          optional(:bancontact) => payment_method_options_bancontact() | nil,
          optional(:billie) => payment_method_options_billie() | nil,
          optional(:boleto) => payment_method_options_boleto() | nil,
          optional(:card) => payment_method_options_card() | nil,
          optional(:cashapp) => payment_method_options_cashapp() | nil,
          optional(:customer_balance) => payment_method_options_customer_balance() | nil,
          optional(:eps) => payment_method_options_eps() | nil,
          optional(:fpx) => payment_method_options_fpx() | nil,
          optional(:giropay) => payment_method_options_giropay() | nil,
          optional(:grabpay) => payment_method_options_grabpay() | nil,
          optional(:ideal) => payment_method_options_ideal() | nil,
          optional(:kakao_pay) => payment_method_options_kakao_pay() | nil,
          optional(:klarna) => payment_method_options_klarna() | nil,
          optional(:konbini) => payment_method_options_konbini() | nil,
          optional(:kr_card) => payment_method_options_kr_card() | nil,
          optional(:link) => payment_method_options_link() | nil,
          optional(:mobilepay) => payment_method_options_mobilepay() | nil,
          optional(:multibanco) => payment_method_options_multibanco() | nil,
          optional(:naver_pay) => payment_method_options_naver_pay() | nil,
          optional(:oxxo) => payment_method_options_oxxo() | nil,
          optional(:p24) => payment_method_options_p24() | nil,
          optional(:payco) => payment_method_options_payco() | nil,
          optional(:paynow) => payment_method_options_paynow() | nil,
          optional(:paypal) => payment_method_options_paypal() | nil,
          optional(:payto) => payment_method_options_payto() | nil,
          optional(:pix) => payment_method_options_pix() | nil,
          optional(:revolut_pay) => payment_method_options_revolut_pay() | nil,
          optional(:samsung_pay) => payment_method_options_samsung_pay() | nil,
          optional(:satispay) => payment_method_options_satispay() | nil,
          optional(:sepa_debit) => payment_method_options_sepa_debit() | nil,
          optional(:sofort) => payment_method_options_sofort() | nil,
          optional(:swish) => payment_method_options_swish() | nil,
          optional(:twint) => payment_method_options_twint() | nil,
          optional(:us_bank_account) => payment_method_options_us_bank_account() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Currency supported by the bank account. Returned when the Session is in `setup` mode. Possible values: `cad`, `usd`.
  * `mandate_options`
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
  * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
  * `verification_method` - Bank account verification method. Possible values: `automatic`, `instant`, `microdeposits`.
  """
  @type payment_method_options_acss_debit :: %{
          optional(:currency) => String.t() | nil,
          optional(:mandate_options) => payment_method_options_acss_debit_mandate_options() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(:target_date) => String.t() | nil,
          optional(:verification_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom_mandate_url` - A URL for custom mandate text Max length: 5000.
  * `default_for` - List of Stripe products where this mandate can be selected automatically. Returned when the Session is in `setup` mode.
  * `interval_description` - Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'. Max length: 5000. Nullable.
  * `payment_schedule` - Payment schedule for the mandate. Possible values: `combined`, `interval`, `sporadic`. Nullable.
  * `transaction_type` - Transaction type of the mandate. Possible values: `business`, `personal`. Nullable.
  """
  @type payment_method_options_acss_debit_mandate_options :: %{
          optional(:custom_mandate_url) => String.t() | nil,
          optional(:default_for) => [String.t()] | nil,
          optional(:interval_description) => String.t() | nil,
          optional(:payment_schedule) => String.t() | nil,
          optional(:transaction_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_affirm :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_alipay :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  """
  @type payment_method_options_alma :: %{
          optional(:capture_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
  """
  @type payment_method_options_amazon_pay :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
  """
  @type payment_method_options_au_becs_debit :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(:target_date) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `mandate_options`
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
  * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
  """
  @type payment_method_options_bacs_debit :: %{
          optional(:mandate_options) => Stripe.Resources.BacsDebitMandateOptions.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(:target_date) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_bancontact :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  """
  @type payment_method_options_billie :: %{
          optional(:capture_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `expires_after_days` - The number of calendar days before a Boleto voucher expires. For example, if you create a Boleto voucher on Monday and you set expires_after_days to 2, the Boleto voucher will expire on Wednesday at 23:59 America/Sao_Paulo time.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
  """
  @type payment_method_options_boleto :: %{
          optional(:expires_after_days) => integer() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `installments`
  * `request_extended_authorization` - Request ability to [capture beyond the standard authorization validity window](https://stripe.com/payments/extended-authorization) for this CheckoutSession. Possible values: `if_available`, `never`.
  * `request_incremental_authorization` - Request ability to [increment the authorization](https://stripe.com/payments/incremental-authorization) for this CheckoutSession. Possible values: `if_available`, `never`.
  * `request_multicapture` - Request ability to make [multiple captures](https://stripe.com/payments/multicapture) for this CheckoutSession. Possible values: `if_available`, `never`.
  * `request_overcapture` - Request ability to [overcapture](https://stripe.com/payments/overcapture) for this CheckoutSession. Possible values: `if_available`, `never`.
  * `request_three_d_secure` - We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://docs.stripe.com/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. If not provided, this value defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://docs.stripe.com/payments/3d-secure/authentication-flow#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine. Possible values: `any`, `automatic`, `challenge`.
  * `restrictions`
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
  * `statement_descriptor_suffix_kana` - Provides information about a card payment that customers see on their statements. Concatenated with the Kana prefix (shortened Kana descriptor) or Kana statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters. On card statements, the *concatenation* of both prefix and suffix (including separators) will appear truncated to 22 characters. Max length: 5000.
  * `statement_descriptor_suffix_kanji` - Provides information about a card payment that customers see on their statements. Concatenated with the Kanji prefix (shortened Kanji descriptor) or Kanji statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 17 characters. On card statements, the *concatenation* of both prefix and suffix (including separators) will appear truncated to 17 characters. Max length: 5000.
  """
  @type payment_method_options_card :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:installments) => payment_method_options_card_installments() | nil,
          optional(:request_extended_authorization) => String.t() | nil,
          optional(:request_incremental_authorization) => String.t() | nil,
          optional(:request_multicapture) => String.t() | nil,
          optional(:request_overcapture) => String.t() | nil,
          optional(:request_three_d_secure) => String.t() | nil,
          optional(:restrictions) => Stripe.Resources.CheckoutCardRestrictions.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(:statement_descriptor_suffix_kana) => String.t() | nil,
          optional(:statement_descriptor_suffix_kanji) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates if installments are enabled
  """
  @type payment_method_options_card_installments :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_cashapp :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_transfer`
  * `funding_type` - The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`. Possible values: `bank_transfer`. Nullable.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_customer_balance :: %{
          optional(:bank_transfer) =>
            payment_method_options_customer_balance_bank_transfer() | nil,
          optional(:funding_type) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `eu_bank_transfer`
  * `requested_address_types` - List of address types that should be returned in the financial_addresses response. If not specified, all valid types will be returned.

  Permitted values include: `sort_code`, `zengin`, `iban`, or `spei`.
  * `type` - The bank transfer type that this PaymentIntent is allowed to use for funding Permitted values include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, or `us_bank_transfer`. Possible values: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, `us_bank_transfer`. Nullable.
  """
  @type payment_method_options_customer_balance_bank_transfer :: %{
          optional(:eu_bank_transfer) =>
            payment_method_options_customer_balance_bank_transfer_eu_bank_transfer() | nil,
          optional(:requested_address_types) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - The desired country code of the bank account information. Permitted values include: `BE`, `DE`, `ES`, `FR`, `IE`, or `NL`. Possible values: `BE`, `DE`, `ES`, `FR`, `IE`, `NL`.
  """
  @type payment_method_options_customer_balance_bank_transfer_eu_bank_transfer :: %{
          optional(:country) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_eps :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_fpx :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_giropay :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_grabpay :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_ideal :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
  """
  @type payment_method_options_kakao_pay :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
  """
  @type payment_method_options_klarna :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `expires_after_days` - The number of calendar days (between 1 and 60) after which Konbini payment instructions will expire. For example, if a PaymentIntent is confirmed with Konbini and `expires_after_days` set to 2 on Monday JST, the instructions will expire on Wednesday 23:59:59 JST. Nullable.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_konbini :: %{
          optional(:expires_after_days) => integer() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
  """
  @type payment_method_options_kr_card :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
  """
  @type payment_method_options_link :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_mobilepay :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_multibanco :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
  """
  @type payment_method_options_naver_pay :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `expires_after_days` - The number of calendar days before an OXXO invoice expires. For example, if you create an OXXO invoice on Monday and you set expires_after_days to 2, the OXXO invoice will expire on Wednesday at 23:59 America/Mexico_City time.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_oxxo :: %{
          optional(:expires_after_days) => integer() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_p24 :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  """
  @type payment_method_options_payco :: %{
          optional(:capture_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_paynow :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `preferred_locale` - Preferred locale of the PayPal checkout page that the customer is redirected to. Max length: 5000. Nullable.
  * `reference` - A reference of the PayPal transaction visible to customer which is mapped to PayPal's invoice ID. This must be a globally unique ID if you have configured in your PayPal settings to block multiple payments per invoice ID. Max length: 5000. Nullable.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
  """
  @type payment_method_options_paypal :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:preferred_locale) => String.t() | nil,
          optional(:reference) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `mandate_options`
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
  """
  @type payment_method_options_payto :: %{
          optional(:mandate_options) => Stripe.Resources.Payto.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_includes_iof` - Determines if the amount includes the IOF tax. Possible values: `always`, `never`.
  * `expires_after_seconds` - The number of seconds after which Pix payment will expire. Nullable.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_pix :: %{
          optional(:amount_includes_iof) => String.t() | nil,
          optional(:expires_after_seconds) => integer() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
  """
  @type payment_method_options_revolut_pay :: %{
          optional(:capture_method) => String.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  """
  @type payment_method_options_samsung_pay :: %{
          optional(:capture_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
  """
  @type payment_method_options_satispay :: %{
          optional(:capture_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `mandate_options`
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
  * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
  """
  @type payment_method_options_sepa_debit :: %{
          optional(:mandate_options) => Stripe.Resources.SepaDebitMandateOptions.t() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(:target_date) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_sofort :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `reference` - The order reference that will be displayed to customers in the Swish application. Defaults to the `id` of the Payment Intent. Max length: 5000. Nullable.
  """
  @type payment_method_options_swish :: %{
          optional(:reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
  """
  @type payment_method_options_twint :: %{
          optional(:setup_future_usage) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `financial_connections`
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
  * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
  * `verification_method` - Bank account verification method. Possible values: `automatic`, `instant`.
  """
  @type payment_method_options_us_bank_account :: %{
          optional(:financial_connections) =>
            payment_method_options_us_bank_account_financial_connections() | nil,
          optional(:setup_future_usage) => String.t() | nil,
          optional(:target_date) => String.t() | nil,
          optional(:verification_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `filters`
  * `permissions` - The list of permissions to request. The `payment_method` permission must be included.
  * `prefetch` - Data features requested to be retrieved upon account creation. Nullable.
  * `return_url` - For webview integrations only. Upon completing OAuth login in the native browser, the user will be redirected to this URL to return to your app. Max length: 5000.
  """
  @type payment_method_options_us_bank_account_financial_connections :: %{
          optional(:filters) =>
            payment_method_options_us_bank_account_financial_connections_filters() | nil,
          optional(:permissions) => [String.t()] | nil,
          optional(:prefetch) => [String.t()] | nil,
          optional(:return_url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_subcategories` - The account subcategories to use to filter for possible accounts to link. Valid subcategories are `checking` and `savings`.
  """
  @type payment_method_options_us_bank_account_financial_connections_filters :: %{
          optional(:account_subcategories) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates whether phone number collection is enabled for the session
  """
  @type phone_number_collection :: %{
          optional(:enabled) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `presentment_amount` - Amount intended to be collected by this payment, denominated in `presentment_currency`.
  * `presentment_currency` - Currency presented to the customer during payment. Max length: 5000.
  """
  @type presentment_details :: %{
          optional(:presentment_amount) => integer() | nil,
          optional(:presentment_currency) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `allow_redisplay_filters` - Uses the `allow_redisplay` value of each saved payment method to filter the set presented to a returning customer. By default, only saved payment methods with ’allow_redisplay: ‘always’ are shown in Checkout. Nullable.
  * `payment_method_remove` - Enable customers to choose if they wish to remove their saved payment methods. Disabled by default. Possible values: `disabled`, `enabled`. Nullable.
  * `payment_method_save` - Enable customers to choose if they wish to save their payment method for future use. Disabled by default. Possible values: `disabled`, `enabled`. Nullable.
  """
  @type saved_payment_method_options :: %{
          optional(:allow_redisplay_filters) => [String.t()] | nil,
          optional(:payment_method_remove) => String.t() | nil,
          optional(:payment_method_save) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_subtotal` - Total shipping cost before any discounts or taxes are applied.
  * `amount_tax` - Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
  * `amount_total` - Total shipping cost after discounts and taxes are applied.
  * `shipping_rate` - The ID of the ShippingRate for this order. Nullable.
  * `taxes` - The taxes applied to the shipping rate.
  """
  @type shipping_cost :: %{
          optional(:amount_subtotal) => integer() | nil,
          optional(:amount_tax) => integer() | nil,
          optional(:amount_total) => integer() | nil,
          optional(:shipping_rate) => String.t() | Stripe.Resources.ShippingRate.t() | nil,
          optional(:taxes) => [shipping_cost_taxes()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount of tax applied for this rate.
  * `rate`
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  """
  @type shipping_cost_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:rate) => Stripe.Resources.TaxRate.t() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `shipping_amount` - A non-negative integer in cents representing how much to charge.
  * `shipping_rate` - The shipping rate.
  """
  @type shipping_options :: %{
          optional(:shipping_amount) => integer() | nil,
          optional(:shipping_rate) => String.t() | Stripe.Resources.ShippingRate.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `enabled` - Indicates whether tax ID collection is enabled for the session
  * `required` - Indicates whether a tax ID is required on the payment page Possible values: `if_supported`, `never`.
  """
  @type tax_id_collection :: %{
          optional(:enabled) => boolean() | nil,
          optional(:required) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_discount` - This is the sum of all the discounts.
  * `amount_shipping` - This is the sum of all the shipping amounts. Nullable.
  * `amount_tax` - This is the sum of all the tax amounts.
  * `breakdown`
  """
  @type total_details :: %{
          optional(:amount_discount) => integer() | nil,
          optional(:amount_shipping) => integer() | nil,
          optional(:amount_tax) => integer() | nil,
          optional(:breakdown) => total_details_breakdown() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discounts` - The aggregated discounts.
  * `taxes` - The aggregated tax amounts by rate.
  """
  @type total_details_breakdown :: %{
          optional(:discounts) => [total_details_breakdown_discounts()] | nil,
          optional(:taxes) => [total_details_breakdown_taxes()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount discounted.
  * `discount`
  """
  @type total_details_breakdown_discounts :: %{
          optional(:amount) => integer() | nil,
          optional(:discount) => Stripe.Resources.Discount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount of tax applied for this rate.
  * `rate`
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  """
  @type total_details_breakdown_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:rate) => Stripe.Resources.TaxRate.t() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `link`
  """
  @type wallet_options :: %{
          optional(:link) => wallet_options_link() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `display` - Describes whether Checkout should display Link. Defaults to `auto`. Possible values: `auto`, `never`.
  """
  @type wallet_options_link :: %{
          optional(:display) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "adaptive_pricing" => %{
        fields: %{
          "enabled" => :scalar
        }
      },
      "after_expiration" => %{
        fields: %{
          "recovery" => %{
            fields: %{
              "allow_promotion_codes" => :scalar,
              "enabled" => :scalar,
              "expires_at" => :scalar,
              "url" => :scalar
            }
          }
        }
      },
      "automatic_tax" => %{
        fields: %{
          "enabled" => :scalar,
          "liability" => %{
            fields: %{
              "account" => {:resource, Stripe.Resources.Account},
              "type" => :scalar
            }
          },
          "provider" => :scalar,
          "status" => :scalar
        }
      },
      "branding_settings" => %{
        fields: %{
          "background_color" => :scalar,
          "border_style" => :scalar,
          "button_color" => :scalar,
          "display_name" => :scalar,
          "font_family" => :scalar,
          "icon" => %{
            fields: %{
              "file" => :scalar,
              "type" => :scalar,
              "url" => :scalar
            }
          },
          "logo" => %{
            fields: %{
              "file" => :scalar,
              "type" => :scalar,
              "url" => :scalar
            }
          }
        }
      },
      "collected_information" => %{
        fields: %{
          "business_name" => :scalar,
          "individual_name" => :scalar,
          "shipping_details" => %{
            fields: %{
              "address" => {:resource, Stripe.Resources.Address},
              "name" => :scalar
            }
          }
        }
      },
      "consent" => %{
        fields: %{
          "promotions" => :scalar,
          "terms_of_service" => :scalar
        }
      },
      "consent_collection" => %{
        fields: %{
          "payment_method_reuse_agreement" => %{
            fields: %{
              "position" => :scalar
            }
          },
          "promotions" => :scalar,
          "terms_of_service" => :scalar
        }
      },
      "currency_conversion" => %{
        fields: %{
          "amount_subtotal" => :scalar,
          "amount_total" => :scalar,
          "fx_rate" => :scalar,
          "source_currency" => :scalar
        }
      },
      "custom_fields" => %{
        fields: %{
          "dropdown" => {:resource, Stripe.Resources.CustomFieldDropdown},
          "key" => :scalar,
          "label" => %{
            fields: %{
              "custom" => :scalar,
              "type" => :scalar
            }
          },
          "numeric" => {:resource, Stripe.Resources.CustomFieldNumeric},
          "optional" => :scalar,
          "text" => %{
            fields: %{
              "default_value" => :scalar,
              "maximum_length" => :scalar,
              "minimum_length" => :scalar,
              "value" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "custom_text" => %{
        fields: %{
          "after_submit" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "shipping_address" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "submit" => %{
            fields: %{
              "message" => :scalar
            }
          },
          "terms_of_service_acceptance" => %{
            fields: %{
              "message" => :scalar
            }
          }
        }
      },
      "customer_details" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "business_name" => :scalar,
          "email" => :scalar,
          "individual_name" => :scalar,
          "name" => :scalar,
          "phone" => :scalar,
          "tax_exempt" => :scalar,
          "tax_ids" =>
            {:list,
             %{
               fields: %{
                 "type" => :scalar,
                 "value" => :scalar
               }
             }}
        }
      },
      "discounts" => %{
        fields: %{
          "coupon" => {:resource, Stripe.Resources.Coupon},
          "promotion_code" => {:resource, Stripe.Resources.PromotionCode}
        }
      },
      "invoice_creation" => %{
        fields: %{
          "enabled" => :scalar,
          "invoice_data" => %{
            fields: %{
              "account_tax_ids" => {:list, {:resource, Stripe.Resources.TaxId}},
              "custom_fields" =>
                {:list,
                 %{
                   fields: %{
                     "name" => :scalar,
                     "value" => :scalar
                   }
                 }},
              "description" => :scalar,
              "footer" => :scalar,
              "issuer" => %{
                fields: %{
                  "account" => {:resource, Stripe.Resources.Account},
                  "type" => :scalar
                }
              },
              "metadata" => {:map, :scalar},
              "rendering_options" => %{
                fields: %{
                  "amount_tax_display" => :scalar,
                  "template" => :scalar
                }
              }
            }
          }
        }
      },
      "line_items" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.LineItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "name_collection" => %{
        fields: %{
          "business" => %{
            fields: %{
              "enabled" => :scalar,
              "optional" => :scalar
            }
          },
          "individual" => %{
            fields: %{
              "enabled" => :scalar,
              "optional" => :scalar
            }
          }
        }
      },
      "optional_items" => %{
        fields: %{
          "adjustable_quantity" => %{
            fields: %{
              "enabled" => :scalar,
              "maximum" => :scalar,
              "minimum" => :scalar
            }
          },
          "price" => :scalar,
          "quantity" => :scalar
        }
      },
      "payment_method_configuration_details" => %{
        fields: %{
          "id" => :scalar,
          "parent" => :scalar
        }
      },
      "payment_method_options" => %{
        fields: %{
          "acss_debit" => %{
            fields: %{
              "currency" => :scalar,
              "mandate_options" => %{
                fields: %{
                  "custom_mandate_url" => :scalar,
                  "default_for" => {:list, :scalar},
                  "interval_description" => :scalar,
                  "payment_schedule" => :scalar,
                  "transaction_type" => :scalar
                }
              },
              "setup_future_usage" => :scalar,
              "target_date" => :scalar,
              "verification_method" => :scalar
            }
          },
          "affirm" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "afterpay_clearpay" => {:resource, Stripe.Resources.AfterpayClearpay},
          "alipay" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "alma" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "amazon_pay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "au_becs_debit" => %{
            fields: %{
              "setup_future_usage" => :scalar,
              "target_date" => :scalar
            }
          },
          "bacs_debit" => %{
            fields: %{
              "mandate_options" => {:resource, Stripe.Resources.BacsDebitMandateOptions},
              "setup_future_usage" => :scalar,
              "target_date" => :scalar
            }
          },
          "bancontact" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "billie" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "boleto" => %{
            fields: %{
              "expires_after_days" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "card" => %{
            fields: %{
              "capture_method" => :scalar,
              "installments" => %{
                fields: %{
                  "enabled" => :scalar
                }
              },
              "request_extended_authorization" => :scalar,
              "request_incremental_authorization" => :scalar,
              "request_multicapture" => :scalar,
              "request_overcapture" => :scalar,
              "request_three_d_secure" => :scalar,
              "restrictions" => {:resource, Stripe.Resources.CheckoutCardRestrictions},
              "setup_future_usage" => :scalar,
              "statement_descriptor_suffix_kana" => :scalar,
              "statement_descriptor_suffix_kanji" => :scalar
            }
          },
          "cashapp" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "customer_balance" => %{
            fields: %{
              "bank_transfer" => %{
                fields: %{
                  "eu_bank_transfer" => %{
                    fields: %{
                      "country" => :scalar
                    }
                  },
                  "requested_address_types" => {:list, :scalar},
                  "type" => :scalar
                }
              },
              "funding_type" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "eps" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "fpx" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "giropay" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "grabpay" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "ideal" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "kakao_pay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "klarna" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "konbini" => %{
            fields: %{
              "expires_after_days" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "kr_card" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "link" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "mobilepay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "multibanco" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "naver_pay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "oxxo" => %{
            fields: %{
              "expires_after_days" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "p24" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "payco" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "paynow" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "paypal" => %{
            fields: %{
              "capture_method" => :scalar,
              "preferred_locale" => :scalar,
              "reference" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "payto" => %{
            fields: %{
              "mandate_options" => {:resource, Stripe.Resources.Payto},
              "setup_future_usage" => :scalar
            }
          },
          "pix" => %{
            fields: %{
              "amount_includes_iof" => :scalar,
              "expires_after_seconds" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "revolut_pay" => %{
            fields: %{
              "capture_method" => :scalar,
              "setup_future_usage" => :scalar
            }
          },
          "samsung_pay" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "satispay" => %{
            fields: %{
              "capture_method" => :scalar
            }
          },
          "sepa_debit" => %{
            fields: %{
              "mandate_options" => {:resource, Stripe.Resources.SepaDebitMandateOptions},
              "setup_future_usage" => :scalar,
              "target_date" => :scalar
            }
          },
          "sofort" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "swish" => %{
            fields: %{
              "reference" => :scalar
            }
          },
          "twint" => %{
            fields: %{
              "setup_future_usage" => :scalar
            }
          },
          "us_bank_account" => %{
            fields: %{
              "financial_connections" => %{
                fields: %{
                  "filters" => %{
                    fields: %{
                      "account_subcategories" => {:list, :scalar}
                    }
                  },
                  "permissions" => {:list, :scalar},
                  "prefetch" => {:list, :scalar},
                  "return_url" => :scalar
                }
              },
              "setup_future_usage" => :scalar,
              "target_date" => :scalar,
              "verification_method" => :scalar
            }
          }
        }
      },
      "phone_number_collection" => %{
        fields: %{
          "enabled" => :scalar
        }
      },
      "presentment_details" => %{
        fields: %{
          "presentment_amount" => :scalar,
          "presentment_currency" => :scalar
        }
      },
      "saved_payment_method_options" => %{
        fields: %{
          "allow_redisplay_filters" => {:list, :scalar},
          "payment_method_remove" => :scalar,
          "payment_method_save" => :scalar
        }
      },
      "shipping_cost" => %{
        fields: %{
          "amount_subtotal" => :scalar,
          "amount_tax" => :scalar,
          "amount_total" => :scalar,
          "shipping_rate" => {:resource, Stripe.Resources.ShippingRate},
          "taxes" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "rate" => {:resource, Stripe.Resources.TaxRate},
                 "taxability_reason" => :scalar,
                 "taxable_amount" => :scalar
               }
             }}
        }
      },
      "shipping_options" => %{
        fields: %{
          "shipping_amount" => :scalar,
          "shipping_rate" => {:resource, Stripe.Resources.ShippingRate}
        }
      },
      "tax_id_collection" => %{
        fields: %{
          "enabled" => :scalar,
          "required" => :scalar
        }
      },
      "total_details" => %{
        fields: %{
          "amount_discount" => :scalar,
          "amount_shipping" => :scalar,
          "amount_tax" => :scalar,
          "breakdown" => %{
            fields: %{
              "discounts" =>
                {:list,
                 %{
                   fields: %{
                     "amount" => :scalar,
                     "discount" => {:resource, Stripe.Resources.Discount}
                   }
                 }},
              "taxes" =>
                {:list,
                 %{
                   fields: %{
                     "amount" => :scalar,
                     "rate" => {:resource, Stripe.Resources.TaxRate},
                     "taxability_reason" => :scalar,
                     "taxable_amount" => :scalar
                   }
                 }}
            }
          }
        }
      },
      "wallet_options" => %{
        fields: %{
          "link" => %{
            fields: %{
              "display" => :scalar
            }
          }
        }
      },
      "permissions" => {:resource, Stripe.Resources.Permissions},
      "shipping_address_collection" => {:resource, Stripe.Resources.ShippingAddressCollection}
    }
  end
end
