# File generated from our OpenAPI spec
defmodule Stripe.Params.Checkout.SessionCreateParams do
  @moduledoc "Parameters for session create."

  @typedoc """
  * `adaptive_pricing` - Settings for price localization with [Adaptive Pricing](https://docs.stripe.com/payments/checkout/adaptive-pricing).
  * `after_expiration` - Configure actions after a Checkout Session has expired. You can't set this parameter if `ui_mode` is `custom`.
  * `allow_promotion_codes` - Enables user redeemable promotion codes.
  * `automatic_tax` - Settings for automatic tax lookup for this session and resulting payments, invoices, and subscriptions.
  * `billing_address_collection` - Specify whether Checkout should collect the customer's billing address. Defaults to `auto`. Possible values: `auto`, `required`.
  * `branding_settings` - The branding settings for the Checkout Session. This parameter is not allowed if ui_mode is `custom`.
  * `cancel_url` - If set, Checkout displays a back button and customers will be directed to this URL if they decide to cancel payment and return to your website. This parameter is not allowed if ui_mode is `embedded` or `custom`.
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
  * `invoice_creation` - Generate a post-purchase Invoice for one-time payments.
  * `line_items` - A list of items the customer is purchasing. Use this parameter to pass one-time or recurring [Prices](https://docs.stripe.com/api/prices). The parameter is required for `payment` and `subscription` mode.

  For `payment` mode, there is a maximum of 100 line items, however it is recommended to consolidate line items if there are more than a few dozen.

  For `subscription` mode, there is a maximum of 20 line items with recurring Prices and 20 line items with one-time Prices. Line items with one-time Prices will be on the initial invoice only.
  * `locale` - The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used. Possible values: `auto`, `bg`, `cs`, `da`, `de`, `el`, `en`, `en-GB`, `es`, `es-419`, `et`, `fi`, `fil`, `fr`, `fr-CA`, `hr`, `hu`, `id`, `it`, `ja`, `ko`, `lt`, `lv`, `ms`, `mt`, `nb`, `nl`, `pl`, `pt`, `pt-BR`, `ro`, `ru`, `sk`, `sl`, `sv`, `th`, `tr`, `vi`, `zh`, `zh-HK`, `zh-TW`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `mode` - The mode of the Checkout Session. Pass `subscription` if the Checkout Session includes at least one recurring item. Possible values: `payment`, `setup`, `subscription`.
  * `name_collection` - Controls name collection settings for the session.

  You can configure Checkout to collect your customers' business names, individual names, or both. Each name field can be either required or optional.

  If a [Customer](https://docs.stripe.com/api/customers) is created or provided, the names can be saved to the Customer object as well.

  You can't set this parameter if `ui_mode` is `custom`.
  * `optional_items` - A list of optional items the customer can add to their order at checkout. Use this parameter to pass one-time or recurring [Prices](https://docs.stripe.com/api/prices).

  There is a maximum of 10 optional items allowed on a Checkout Session, and the existing limits on the number of line items allowed on a Checkout Session apply to the combined number of line items and optional items.

  For `payment` mode, there is a maximum of 100 combined line items and optional items, however it is recommended to consolidate items if there are more than a few dozen.

  For `subscription` mode, there is a maximum of 20 line items and optional items with recurring Prices and 20 line items and optional items with one-time Prices.

  You can't set this parameter if `ui_mode` is `custom`.
  * `origin_context` - Where the user is coming from. This informs the optimizations that are applied to the session. You can't set this parameter if `ui_mode` is `custom`. Possible values: `mobile_app`, `web`.
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
  * `redirect_on_completion` - This parameter applies to `ui_mode: embedded`. Learn more about the [redirect behavior](https://docs.stripe.com/payments/checkout/custom-success-page?payment-ui=embedded-form) of embedded sessions. Defaults to `always`. Possible values: `always`, `if_required`, `never`.
  * `return_url` - The URL to redirect your customer back to after they authenticate or cancel their payment on the
  payment method's app or site. This parameter is required if `ui_mode` is `embedded` or `custom`
  and redirect-based payment methods are enabled on the session.
  * `saved_payment_method_options` - Controls saved payment method settings for the session. Only available in `payment` and `subscription` mode.
  * `setup_intent_data` - A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup` mode.
  * `shipping_address_collection` - When set, provides configuration for Checkout to collect a shipping address from a customer.
  * `shipping_options` - The shipping rate options to apply to this Session. Up to a maximum of 5.
  * `submit_type` - Describes the type of transaction being performed by Checkout in order
  to customize relevant text on the page, such as the submit button.
  `submit_type` can only be specified on Checkout Sessions in
  `payment` or `subscription` mode. If blank or `auto`, `pay` is used.
  You can't set this parameter if `ui_mode` is `custom`. Possible values: `auto`, `book`, `donate`, `pay`, `subscribe`.
  * `subscription_data` - A subset of parameters to be passed to subscription creation for Checkout Sessions in `subscription` mode.
  * `success_url` - The URL to which Stripe should send customers when payment or setup
  is complete.
  This parameter is not allowed if ui_mode is `embedded` or `custom`. If you'd like to use
  information from the successful Checkout Session on your page, read the
  guide on [customizing your success page](https://docs.stripe.com/payments/checkout/custom-success-page).
  * `tax_id_collection` - Controls tax ID collection during checkout.
  * `ui_mode` - The UI mode of the Session. Defaults to `hosted`. Possible values: `custom`, `embedded`, `hosted`.
  * `wallet_options` - Wallet-specific configuration.
  """
  @type t :: %__MODULE__{
          adaptive_pricing: __MODULE__.AdaptivePricing.t() | nil,
          after_expiration: __MODULE__.AfterExpiration.t() | nil,
          allow_promotion_codes: boolean() | nil,
          automatic_tax: __MODULE__.AutomaticTax.t() | nil,
          billing_address_collection: String.t() | nil,
          branding_settings: __MODULE__.BrandingSettings.t() | nil,
          cancel_url: String.t() | nil,
          client_reference_id: String.t() | nil,
          consent_collection: __MODULE__.ConsentCollection.t() | nil,
          currency: String.t() | nil,
          custom_fields: [__MODULE__.CustomFields.t()] | nil,
          custom_text: __MODULE__.CustomText.t() | nil,
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          customer_creation: String.t() | nil,
          customer_email: String.t() | nil,
          customer_update: __MODULE__.CustomerUpdate.t() | nil,
          discounts: [__MODULE__.Discounts.t()] | nil,
          excluded_payment_method_types: [String.t()] | nil,
          expand: [String.t()] | nil,
          expires_at: integer() | nil,
          invoice_creation: __MODULE__.InvoiceCreation.t() | nil,
          line_items: [__MODULE__.LineItems.t()] | nil,
          locale: String.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          mode: String.t() | nil,
          name_collection: __MODULE__.NameCollection.t() | nil,
          optional_items: [__MODULE__.OptionalItems.t()] | nil,
          origin_context: String.t() | nil,
          payment_intent_data: __MODULE__.PaymentIntentData.t() | nil,
          payment_method_collection: String.t() | nil,
          payment_method_configuration: String.t() | nil,
          payment_method_data: __MODULE__.PaymentMethodData.t() | nil,
          payment_method_options: __MODULE__.PaymentMethodOptions.t() | nil,
          payment_method_types: [String.t()] | nil,
          permissions: __MODULE__.Permissions.t() | nil,
          phone_number_collection: __MODULE__.PhoneNumberCollection.t() | nil,
          redirect_on_completion: String.t() | nil,
          return_url: String.t() | nil,
          saved_payment_method_options: __MODULE__.SavedPaymentMethodOptions.t() | nil,
          setup_intent_data: __MODULE__.SetupIntentData.t() | nil,
          shipping_address_collection: __MODULE__.ShippingAddressCollection.t() | nil,
          shipping_options: [__MODULE__.ShippingOptions.t()] | nil,
          submit_type: String.t() | nil,
          subscription_data: __MODULE__.SubscriptionData.t() | nil,
          success_url: String.t() | nil,
          tax_id_collection: __MODULE__.TaxIdCollection.t() | nil,
          ui_mode: String.t() | nil,
          wallet_options: __MODULE__.WalletOptions.t() | nil
        }

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
    :invoice_creation,
    :line_items,
    :locale,
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

  defmodule AdaptivePricing do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - If set to `true`, Adaptive Pricing is available on [eligible sessions](https://docs.stripe.com/payments/currencies/localize-prices/adaptive-pricing?payment-ui=stripe-hosted#restrictions). Defaults to your [dashboard setting](https://dashboard.stripe.com/settings/adaptive-pricing).
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil
          }
    defstruct [:enabled]
  end

  defmodule AfterExpiration do
    @moduledoc "Nested parameters."

    @typedoc """
    * `recovery` - Configure a Checkout Session that can be used to recover an expired session.
    """
    @type t :: %__MODULE__{
            recovery: __MODULE__.Recovery.t() | nil
          }
    defstruct [:recovery]

    defmodule Recovery do
      @moduledoc "Nested parameters."

      @typedoc """
      * `allow_promotion_codes` - Enables user redeemable promotion codes on the recovered Checkout Sessions. Defaults to `false`
      * `enabled` - If `true`, a recovery URL will be generated to recover this Checkout Session if it
      expires before a successful transaction is completed. It will be attached to the
      Checkout Session object upon expiration.
      """
      @type t :: %__MODULE__{
              allow_promotion_codes: boolean() | nil,
              enabled: boolean() | nil
            }
      defstruct [:allow_promotion_codes, :enabled]
    end
  end

  defmodule AutomaticTax do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Set to `true` to [calculate tax automatically](https://docs.stripe.com/tax) using the customer's location.

    Enabling this parameter causes Checkout to collect any billing address information necessary for tax calculation.
    * `liability` - The account that's liable for tax. If set, the business address and tax registrations required to perform the tax calculation are loaded from this account. The tax transaction is returned in the report of the connected account.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            liability: __MODULE__.Liability.t() | nil
          }
    defstruct [:enabled, :liability]

    defmodule Liability do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account` - The connected account being referenced when `type` is `account`.
      * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
      """
      @type t :: %__MODULE__{
              account: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:account, :type]
    end
  end

  defmodule BrandingSettings do
    @moduledoc "Nested parameters."

    @typedoc """
    * `background_color` - A hex color value starting with `#` representing the background color for the Checkout Session.
    * `border_style` - The border style for the Checkout Session. Possible values: `pill`, `rectangular`, `rounded`.
    * `button_color` - A hex color value starting with `#` representing the button color for the Checkout Session.
    * `display_name` - A string to override the business name shown on the Checkout Session. This only shows at the top of the Checkout page, and your business name still appears in terms, receipts, and other places. Max length: 5000.
    * `font_family` - The font family for the Checkout Session corresponding to one of the [supported font families](https://docs.stripe.com/payments/checkout/customization/appearance?payment-ui=stripe-hosted#font-compatibility). Possible values: `be_vietnam_pro`, `bitter`, `chakra_petch`, `default`, `hahmlet`, `inconsolata`, `inter`, `lato`, `lora`, `m_plus_1_code`, `montserrat`, `noto_sans`, `noto_sans_jp`, `noto_serif`, `nunito`, `open_sans`, `pridi`, `pt_sans`, `pt_serif`, `raleway`, `roboto`, `roboto_slab`, `source_sans_pro`, `titillium_web`, `ubuntu_mono`, `zen_maru_gothic`.
    * `icon` - The icon for the Checkout Session. For best results, use a square image.
    * `logo` - The logo for the Checkout Session.
    """
    @type t :: %__MODULE__{
            background_color: map() | nil,
            border_style: String.t() | nil,
            button_color: map() | nil,
            display_name: String.t() | nil,
            font_family: String.t() | nil,
            icon: __MODULE__.Icon.t() | nil,
            logo: __MODULE__.Logo.t() | nil
          }
    defstruct [
      :background_color,
      :border_style,
      :button_color,
      :display_name,
      :font_family,
      :icon,
      :logo
    ]

    defmodule Icon do
      @moduledoc "Nested parameters."

      @typedoc """
      * `file` - The ID of a [File upload](https://stripe.com/docs/api/files) representing the icon. Purpose must be `business_icon`. Required if `type` is `file` and disallowed otherwise.
      * `type` - The type of image for the icon. Must be one of `file` or `url`. Possible values: `file`, `url`.
      * `url` - The URL of the image. Required if `type` is `url` and disallowed otherwise.
      """
      @type t :: %__MODULE__{
              file: String.t() | nil,
              type: String.t() | nil,
              url: String.t() | nil
            }
      defstruct [:file, :type, :url]
    end

    defmodule Logo do
      @moduledoc "Nested parameters."

      @typedoc """
      * `file` - The ID of a [File upload](https://stripe.com/docs/api/files) representing the logo. Purpose must be `business_logo`. Required if `type` is `file` and disallowed otherwise.
      * `type` - The type of image for the logo. Must be one of `file` or `url`. Possible values: `file`, `url`.
      * `url` - The URL of the image. Required if `type` is `url` and disallowed otherwise.
      """
      @type t :: %__MODULE__{
              file: String.t() | nil,
              type: String.t() | nil,
              url: String.t() | nil
            }
      defstruct [:file, :type, :url]
    end
  end

  defmodule ConsentCollection do
    @moduledoc "Nested parameters."

    @typedoc """
    * `payment_method_reuse_agreement` - Determines the display of payment method reuse agreement text in the UI. If set to `hidden`, it will hide legal text related to the reuse of a payment method.
    * `promotions` - If set to `auto`, enables the collection of customer consent for promotional communications. The Checkout
    Session will determine whether to display an option to opt into promotional communication
    from the merchant depending on the customer's locale. Only available to US merchants. Possible values: `auto`, `none`.
    * `terms_of_service` - If set to `required`, it requires customers to check a terms of service checkbox before being able to pay.
    There must be a valid terms of service URL set in your [Dashboard settings](https://dashboard.stripe.com/settings/public). Possible values: `none`, `required`.
    """
    @type t :: %__MODULE__{
            payment_method_reuse_agreement: __MODULE__.PaymentMethodReuseAgreement.t() | nil,
            promotions: String.t() | nil,
            terms_of_service: String.t() | nil
          }
    defstruct [:payment_method_reuse_agreement, :promotions, :terms_of_service]

    defmodule PaymentMethodReuseAgreement do
      @moduledoc "Nested parameters."

      @typedoc """
      * `position` - Determines the position and visibility of the payment method reuse agreement in the UI. When set to `auto`, Stripe's
      defaults will be used. When set to `hidden`, the payment method reuse agreement text will always be hidden in the UI. Possible values: `auto`, `hidden`.
      """
      @type t :: %__MODULE__{
              position: String.t() | nil
            }
      defstruct [:position]
    end
  end

  defmodule CustomFields do
    @moduledoc "Nested parameters."

    @typedoc """
    * `dropdown` - Configuration for `type=dropdown` fields.
    * `key` - String of your choice that your integration can use to reconcile this field. Must be unique to this field, alphanumeric, and up to 200 characters. Max length: 200.
    * `label` - The label for the field, displayed to the customer.
    * `numeric` - Configuration for `type=numeric` fields.
    * `optional` - Whether the customer is required to complete the field before completing the Checkout Session. Defaults to `false`.
    * `text` - Configuration for `type=text` fields.
    * `type` - The type of the field. Possible values: `dropdown`, `numeric`, `text`.
    """
    @type t :: %__MODULE__{
            dropdown: __MODULE__.Dropdown.t() | nil,
            key: String.t() | nil,
            label: __MODULE__.Label.t() | nil,
            numeric: __MODULE__.Numeric.t() | nil,
            optional: boolean() | nil,
            text: __MODULE__.Text.t() | nil,
            type: String.t() | nil
          }
    defstruct [:dropdown, :key, :label, :numeric, :optional, :text, :type]

    defmodule Dropdown do
      @moduledoc "Nested parameters."

      @typedoc """
      * `default_value` - The value that will pre-fill the field on the payment page.Must match a `value` in the `options` array. Max length: 100.
      * `options` - The options available for the customer to select. Up to 200 options allowed.
      """
      @type t :: %__MODULE__{
              default_value: String.t() | nil,
              options: [__MODULE__.Options.t()] | nil
            }
      defstruct [:default_value, :options]

      defmodule Options do
        @moduledoc "Nested parameters."

        @typedoc """
        * `label` - The label for the option, displayed to the customer. Up to 100 characters. Max length: 100.
        * `value` - The value for this option, not displayed to the customer, used by your integration to reconcile the option selected by the customer. Must be unique to this option, alphanumeric, and up to 100 characters. Max length: 100.
        """
        @type t :: %__MODULE__{
                label: String.t() | nil,
                value: String.t() | nil
              }
        defstruct [:label, :value]
      end
    end

    defmodule Label do
      @moduledoc "Nested parameters."

      @typedoc """
      * `custom` - Custom text for the label, displayed to the customer. Up to 50 characters. Max length: 50.
      * `type` - The type of the label. Possible values: `custom`.
      """
      @type t :: %__MODULE__{
              custom: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:custom, :type]
    end

    defmodule Numeric do
      @moduledoc "Nested parameters."

      @typedoc """
      * `default_value` - The value that will pre-fill the field on the payment page. Max length: 255.
      * `maximum_length` - The maximum character length constraint for the customer's input.
      * `minimum_length` - The minimum character length requirement for the customer's input.
      """
      @type t :: %__MODULE__{
              default_value: String.t() | nil,
              maximum_length: integer() | nil,
              minimum_length: integer() | nil
            }
      defstruct [:default_value, :maximum_length, :minimum_length]
    end

    defmodule Text do
      @moduledoc "Nested parameters."

      @typedoc """
      * `default_value` - The value that will pre-fill the field on the payment page. Max length: 255.
      * `maximum_length` - The maximum character length constraint for the customer's input.
      * `minimum_length` - The minimum character length requirement for the customer's input.
      """
      @type t :: %__MODULE__{
              default_value: String.t() | nil,
              maximum_length: integer() | nil,
              minimum_length: integer() | nil
            }
      defstruct [:default_value, :maximum_length, :minimum_length]
    end
  end

  defmodule CustomText do
    @moduledoc "Nested parameters."

    @typedoc """
    * `after_submit` - Custom text that should be displayed after the payment confirmation button.
    * `shipping_address` - Custom text that should be displayed alongside shipping address collection.
    * `submit` - Custom text that should be displayed alongside the payment confirmation button.
    * `terms_of_service_acceptance` - Custom text that should be displayed in place of the default terms of service agreement text.
    """
    @type t :: %__MODULE__{
            after_submit: map() | nil,
            shipping_address: map() | nil,
            submit: map() | nil,
            terms_of_service_acceptance: map() | nil
          }
    defstruct [:after_submit, :shipping_address, :submit, :terms_of_service_acceptance]
  end

  defmodule CustomerUpdate do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - Describes whether Checkout saves the billing address onto `customer.address`.
    To always collect a full billing address, use `billing_address_collection`. Defaults to `never`. Possible values: `auto`, `never`.
    * `name` - Describes whether Checkout saves the name onto `customer.name`. Defaults to `never`. Possible values: `auto`, `never`.
    * `shipping` - Describes whether Checkout saves shipping information onto `customer.shipping`.
    To collect shipping information, use `shipping_address_collection`. Defaults to `never`. Possible values: `auto`, `never`.
    """
    @type t :: %__MODULE__{
            address: String.t() | nil,
            name: String.t() | nil,
            shipping: String.t() | nil
          }
    defstruct [:address, :name, :shipping]
  end

  defmodule Discounts do
    @moduledoc "Nested parameters."

    @typedoc """
    * `coupon` - The ID of the coupon to apply to this Session. Max length: 5000.
    * `promotion_code` - The ID of a promotion code to apply to this Session. Max length: 5000.
    """
    @type t :: %__MODULE__{
            coupon: String.t() | nil,
            promotion_code: String.t() | nil
          }
    defstruct [:coupon, :promotion_code]
  end

  defmodule InvoiceCreation do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Set to `true` to enable invoice creation.
    * `invoice_data` - Parameters passed when creating invoices for payment-mode Checkout Sessions.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            invoice_data: __MODULE__.InvoiceData.t() | nil
          }
    defstruct [:enabled, :invoice_data]

    defmodule InvoiceData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_tax_ids` - The account tax IDs associated with the invoice.
      * `custom_fields` - Default custom fields to be displayed on invoices for this customer.
      * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1500.
      * `footer` - Default footer to be displayed on invoices for this customer. Max length: 5000.
      * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
      * `rendering_options` - Default options for invoice PDF rendering for this customer.
      """
      @type t :: %__MODULE__{
              account_tax_ids: map() | nil,
              custom_fields: map() | nil,
              description: String.t() | nil,
              footer: String.t() | nil,
              issuer: __MODULE__.Issuer.t() | nil,
              metadata: %{String.t() => String.t()} | nil,
              rendering_options: map() | nil
            }
      defstruct [
        :account_tax_ids,
        :custom_fields,
        :description,
        :footer,
        :issuer,
        :metadata,
        :rendering_options
      ]

      defmodule Issuer do
        @moduledoc "Nested parameters."

        @typedoc """
        * `account` - The connected account being referenced when `type` is `account`.
        * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
        """
        @type t :: %__MODULE__{
                account: String.t() | nil,
                type: String.t() | nil
              }
        defstruct [:account, :type]
      end
    end
  end

  defmodule LineItems do
    @moduledoc "Nested parameters."

    @typedoc """
    * `adjustable_quantity` - When set, provides configuration for this item’s quantity to be adjusted by the customer during Checkout.
    * `dynamic_tax_rates` - The [tax rates](https://docs.stripe.com/api/tax_rates) that will be applied to this line item depending on the customer's billing/shipping address. We currently support the following countries: US, GB, AU, and all countries in the EU. You can't set this parameter if `ui_mode` is `custom`.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    * `price` - The ID of the [Price](https://docs.stripe.com/api/prices) or [Plan](https://docs.stripe.com/api/plans) object. One of `price` or `price_data` is required. Max length: 5000.
    * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline. One of `price` or `price_data` is required.
    * `quantity` - The quantity of the line item being purchased. Quantity should not be defined when `recurring.usage_type=metered`.
    * `tax_rates` - The [tax rates](https://docs.stripe.com/api/tax_rates) which apply to this line item.
    """
    @type t :: %__MODULE__{
            adjustable_quantity: __MODULE__.AdjustableQuantity.t() | nil,
            dynamic_tax_rates: [String.t()] | nil,
            metadata: %{String.t() => String.t()} | nil,
            price: String.t() | nil,
            price_data: __MODULE__.PriceData.t() | nil,
            quantity: integer() | nil,
            tax_rates: [String.t()] | nil
          }
    defstruct [
      :adjustable_quantity,
      :dynamic_tax_rates,
      :metadata,
      :price,
      :price_data,
      :quantity,
      :tax_rates
    ]

    defmodule AdjustableQuantity do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Set to true if the quantity can be adjusted to any non-negative integer.
      * `maximum` - The maximum quantity the customer can purchase for the Checkout Session. By default this value is 99. You can specify a value up to 999999.
      * `minimum` - The minimum quantity the customer must purchase for the Checkout Session. By default this value is 0.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              maximum: integer() | nil,
              minimum: integer() | nil
            }
      defstruct [:enabled, :maximum, :minimum]
    end

    defmodule PriceData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. One of `product` or `product_data` is required. Max length: 5000.
      * `product_data` - Data used to generate a new [Product](https://docs.stripe.com/api/products) object inline. One of `product` or `product_data` is required.
      * `recurring` - The recurring components of a price such as `interval` and `interval_count`.
      * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
      * `unit_amount` - A non-negative integer in cents (or local equivalent) representing how much to charge. One of `unit_amount` or `unit_amount_decimal` is required.
      * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
      """
      @type t :: %__MODULE__{
              currency: String.t() | nil,
              product: String.t() | nil,
              product_data: __MODULE__.ProductData.t() | nil,
              recurring: __MODULE__.Recurring.t() | nil,
              tax_behavior: String.t() | nil,
              unit_amount: integer() | nil,
              unit_amount_decimal: String.t() | nil
            }
      defstruct [
        :currency,
        :product,
        :product_data,
        :recurring,
        :tax_behavior,
        :unit_amount,
        :unit_amount_decimal
      ]

      defmodule ProductData do
        @moduledoc "Nested parameters."

        @typedoc """
        * `description` - The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes. Max length: 40000.
        * `images` - A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
        * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
        * `name` - The product's name, meant to be displayable to the customer. Max length: 5000.
        * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. Max length: 5000.
        * `unit_label` - A label that represents units of this product. When set, this will be included in customers' receipts, invoices, Checkout, and the customer portal. Max length: 12.
        """
        @type t :: %__MODULE__{
                description: String.t() | nil,
                images: [String.t()] | nil,
                metadata: %{String.t() => String.t()} | nil,
                name: String.t() | nil,
                tax_code: String.t() | nil,
                unit_label: String.t() | nil
              }
        defstruct [:description, :images, :metadata, :name, :tax_code, :unit_label]
      end

      defmodule Recurring do
        @moduledoc "Nested parameters."

        @typedoc """
        * `interval` - Specifies billing frequency. Either `day`, `week`, `month` or `year`. Possible values: `day`, `month`, `week`, `year`.
        * `interval_count` - The number of intervals between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of three years interval allowed (3 years, 36 months, or 156 weeks).
        """
        @type t :: %__MODULE__{
                interval: String.t() | nil,
                interval_count: integer() | nil
              }
        defstruct [:interval, :interval_count]
      end
    end
  end

  defmodule NameCollection do
    @moduledoc "Nested parameters."

    @typedoc """
    * `business` - Controls settings applied for collecting the customer's business name on the session.
    * `individual` - Controls settings applied for collecting the customer's individual name on the session.
    """
    @type t :: %__MODULE__{
            business: __MODULE__.Business.t() | nil,
            individual: __MODULE__.Individual.t() | nil
          }
    defstruct [:business, :individual]

    defmodule Business do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Enable business name collection on the Checkout Session. Defaults to `false`.
      * `optional` - Whether the customer is required to provide a business name before completing the Checkout Session. Defaults to `false`.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              optional: boolean() | nil
            }
      defstruct [:enabled, :optional]
    end

    defmodule Individual do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Enable individual name collection on the Checkout Session. Defaults to `false`.
      * `optional` - Whether the customer is required to provide their name before completing the Checkout Session. Defaults to `false`.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              optional: boolean() | nil
            }
      defstruct [:enabled, :optional]
    end
  end

  defmodule OptionalItems do
    @moduledoc "Nested parameters."

    @typedoc """
    * `adjustable_quantity` - When set, provides configuration for the customer to adjust the quantity of the line item created when a customer chooses to add this optional item to their order.
    * `price` - The ID of the [Price](https://docs.stripe.com/api/prices) or [Plan](https://docs.stripe.com/api/plans) object. Max length: 5000.
    * `quantity` - The initial quantity of the line item created when a customer chooses to add this optional item to their order.
    """
    @type t :: %__MODULE__{
            adjustable_quantity: __MODULE__.AdjustableQuantity.t() | nil,
            price: String.t() | nil,
            quantity: integer() | nil
          }
    defstruct [:adjustable_quantity, :price, :quantity]

    defmodule AdjustableQuantity do
      @moduledoc "Nested parameters."

      @typedoc """
      * `enabled` - Set to true if the quantity can be adjusted to any non-negative integer.
      * `maximum` - The maximum quantity of this item the customer can purchase. By default this value is 99. You can specify a value up to 999999.
      * `minimum` - The minimum quantity of this item the customer must purchase, if they choose to purchase it. Because this item is optional, the customer will always be able to remove it from their order, even if the `minimum` configured here is greater than 0. By default this value is 0.
      """
      @type t :: %__MODULE__{
              enabled: boolean() | nil,
              maximum: integer() | nil,
              minimum: integer() | nil
            }
      defstruct [:enabled, :maximum, :minimum]
    end
  end

  defmodule PaymentIntentData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total amount captured. For more information, see the PaymentIntents [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
    * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `automatic`, `automatic_async`, `manual`.
    * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    * `on_behalf_of` - The Stripe account ID for which these funds are intended. For details,
    see the PaymentIntents [use case for connected
    accounts](https://docs.stripe.com/docs/payments/connected-accounts).
    * `receipt_email` - Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
    * `setup_future_usage` - Indicates that you intend to [make future payments](https://docs.stripe.com/payments/payment-intents#future-usage) with the payment
    method collected by this Checkout Session.

    When setting this to `on_session`, Checkout will show a notice to the
    customer that their payment details will be saved.

    When setting this to `off_session`, Checkout will show a notice to the
    customer that their payment details will be saved and used for future
    payments.

    If a Customer has been provided or Checkout creates a new Customer,
    Checkout will attach the payment method to the Customer.

    If Checkout does not create a Customer, the payment method is not attached
    to a Customer. To reuse the payment method, you can retrieve it from the
    Checkout Session's PaymentIntent.

    When processing card payments, Checkout also uses `setup_future_usage`
    to dynamically optimize your payment flow and comply with regional
    legislation and network rules, such as SCA. Possible values: `off_session`, `on_session`.
    * `shipping` - Shipping information for this payment.
    * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

    Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead. Max length: 22.
    * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. Max length: 22.
    * `transfer_data` - The parameters used to automatically create a Transfer when the payment succeeds.
    For more information, see the PaymentIntents [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
    * `transfer_group` - A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://docs.stripe.com/connect/separate-charges-and-transfers) for details.
    """
    @type t :: %__MODULE__{
            application_fee_amount: integer() | nil,
            capture_method: String.t() | nil,
            description: String.t() | nil,
            metadata: %{String.t() => String.t()} | nil,
            on_behalf_of: String.t() | nil,
            receipt_email: String.t() | nil,
            setup_future_usage: String.t() | nil,
            shipping: __MODULE__.Shipping.t() | nil,
            statement_descriptor: String.t() | nil,
            statement_descriptor_suffix: String.t() | nil,
            transfer_data: __MODULE__.TransferData.t() | nil,
            transfer_group: String.t() | nil
          }
    defstruct [
      :application_fee_amount,
      :capture_method,
      :description,
      :metadata,
      :on_behalf_of,
      :receipt_email,
      :setup_future_usage,
      :shipping,
      :statement_descriptor,
      :statement_descriptor_suffix,
      :transfer_data,
      :transfer_group
    ]

    defmodule Shipping do
      @moduledoc "Nested parameters."

      @typedoc """
      * `address` - Shipping address.
      * `carrier` - The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. Max length: 5000.
      * `name` - Recipient name. Max length: 5000.
      * `phone` - Recipient phone (including extension). Max length: 5000.
      * `tracking_number` - The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas. Max length: 5000.
      """
      @type t :: %__MODULE__{
              address: __MODULE__.Address.t() | nil,
              carrier: String.t() | nil,
              name: String.t() | nil,
              phone: String.t() | nil,
              tracking_number: String.t() | nil
            }
      defstruct [:address, :carrier, :name, :phone, :tracking_number]

      defmodule Address do
        @moduledoc "Nested parameters."

        @typedoc """
        * `city` - City, district, suburb, town, or village. Max length: 5000.
        * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
        * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
        * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
        * `postal_code` - ZIP or postal code. Max length: 5000.
        * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
        """
        @type t :: %__MODULE__{
                city: String.t() | nil,
                country: String.t() | nil,
                line1: String.t() | nil,
                line2: String.t() | nil,
                postal_code: String.t() | nil,
                state: String.t() | nil
              }
        defstruct [:city, :country, :line1, :line2, :postal_code, :state]
      end
    end

    defmodule TransferData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount` - The amount that will be transferred automatically when a charge succeeds.
      * `destination` - If specified, successful charges will be attributed to the destination
      account for tax reporting, and the funds from charges will be transferred
      to the destination account. The ID of the resulting transfer will be
      returned on the successful charge's `transfer` field.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              destination: String.t() | nil
            }
      defstruct [:amount, :destination]
    end
  end

  defmodule PaymentMethodData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `allow_redisplay` - Allow redisplay will be set on the payment method on confirmation and indicates whether this payment method can be shown again to the customer in a checkout flow. Only set this field if you wish to override the allow_redisplay value determined by Checkout. Possible values: `always`, `limited`, `unspecified`.
    """
    @type t :: %__MODULE__{
            allow_redisplay: String.t() | nil
          }
    defstruct [:allow_redisplay]
  end

  defmodule PaymentMethodOptions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `acss_debit` - contains details about the ACSS Debit payment method options. You can't set this parameter if `ui_mode` is `custom`.
    * `affirm` - contains details about the Affirm payment method options.
    * `afterpay_clearpay` - contains details about the Afterpay Clearpay payment method options.
    * `alipay` - contains details about the Alipay payment method options.
    * `alma` - contains details about the Alma payment method options.
    * `amazon_pay` - contains details about the AmazonPay payment method options.
    * `au_becs_debit` - contains details about the AU Becs Debit payment method options.
    * `bacs_debit` - contains details about the Bacs Debit payment method options.
    * `bancontact` - contains details about the Bancontact payment method options.
    * `billie` - contains details about the Billie payment method options.
    * `boleto` - contains details about the Boleto payment method options.
    * `card` - contains details about the Card payment method options.
    * `cashapp` - contains details about the Cashapp Pay payment method options.
    * `customer_balance` - contains details about the Customer Balance payment method options.
    * `demo_pay` - contains details about the DemoPay payment method options.
    * `eps` - contains details about the EPS payment method options.
    * `fpx` - contains details about the FPX payment method options.
    * `giropay` - contains details about the Giropay payment method options.
    * `grabpay` - contains details about the Grabpay payment method options.
    * `ideal` - contains details about the Ideal payment method options.
    * `kakao_pay` - contains details about the Kakao Pay payment method options.
    * `klarna` - contains details about the Klarna payment method options.
    * `konbini` - contains details about the Konbini payment method options.
    * `kr_card` - contains details about the Korean card payment method options.
    * `link` - contains details about the Link payment method options.
    * `mobilepay` - contains details about the Mobilepay payment method options.
    * `multibanco` - contains details about the Multibanco payment method options.
    * `naver_pay` - contains details about the Naver Pay payment method options.
    * `oxxo` - contains details about the OXXO payment method options.
    * `p24` - contains details about the P24 payment method options.
    * `pay_by_bank` - contains details about the Pay By Bank payment method options.
    * `payco` - contains details about the PAYCO payment method options.
    * `paynow` - contains details about the PayNow payment method options.
    * `paypal` - contains details about the PayPal payment method options.
    * `payto` - contains details about the PayTo payment method options.
    * `pix` - contains details about the Pix payment method options.
    * `revolut_pay` - contains details about the RevolutPay payment method options.
    * `samsung_pay` - contains details about the Samsung Pay payment method options.
    * `satispay` - contains details about the Satispay payment method options.
    * `sepa_debit` - contains details about the Sepa Debit payment method options.
    * `sofort` - contains details about the Sofort payment method options.
    * `swish` - contains details about the Swish payment method options.
    * `twint` - contains details about the TWINT payment method options.
    * `us_bank_account` - contains details about the Us Bank Account payment method options.
    * `wechat_pay` - contains details about the WeChat Pay payment method options.
    """
    @type t :: %__MODULE__{
            acss_debit: __MODULE__.AcssDebit.t() | nil,
            affirm: __MODULE__.Affirm.t() | nil,
            afterpay_clearpay: __MODULE__.AfterpayClearpay.t() | nil,
            alipay: __MODULE__.Alipay.t() | nil,
            alma: __MODULE__.Alma.t() | nil,
            amazon_pay: __MODULE__.AmazonPay.t() | nil,
            au_becs_debit: __MODULE__.AuBecsDebit.t() | nil,
            bacs_debit: __MODULE__.BacsDebit.t() | nil,
            bancontact: __MODULE__.Bancontact.t() | nil,
            billie: __MODULE__.Billie.t() | nil,
            boleto: __MODULE__.Boleto.t() | nil,
            card: __MODULE__.Card.t() | nil,
            cashapp: __MODULE__.Cashapp.t() | nil,
            customer_balance: __MODULE__.CustomerBalance.t() | nil,
            demo_pay: __MODULE__.DemoPay.t() | nil,
            eps: __MODULE__.Eps.t() | nil,
            fpx: __MODULE__.Fpx.t() | nil,
            giropay: __MODULE__.Giropay.t() | nil,
            grabpay: __MODULE__.Grabpay.t() | nil,
            ideal: __MODULE__.Ideal.t() | nil,
            kakao_pay: __MODULE__.KakaoPay.t() | nil,
            klarna: __MODULE__.Klarna.t() | nil,
            konbini: __MODULE__.Konbini.t() | nil,
            kr_card: __MODULE__.KrCard.t() | nil,
            link: __MODULE__.Link.t() | nil,
            mobilepay: __MODULE__.Mobilepay.t() | nil,
            multibanco: __MODULE__.Multibanco.t() | nil,
            naver_pay: __MODULE__.NaverPay.t() | nil,
            oxxo: __MODULE__.Oxxo.t() | nil,
            p24: __MODULE__.P24.t() | nil,
            pay_by_bank: map() | nil,
            payco: __MODULE__.Payco.t() | nil,
            paynow: __MODULE__.Paynow.t() | nil,
            paypal: __MODULE__.Paypal.t() | nil,
            payto: __MODULE__.Payto.t() | nil,
            pix: __MODULE__.Pix.t() | nil,
            revolut_pay: __MODULE__.RevolutPay.t() | nil,
            samsung_pay: __MODULE__.SamsungPay.t() | nil,
            satispay: __MODULE__.Satispay.t() | nil,
            sepa_debit: __MODULE__.SepaDebit.t() | nil,
            sofort: __MODULE__.Sofort.t() | nil,
            swish: __MODULE__.Swish.t() | nil,
            twint: __MODULE__.Twint.t() | nil,
            us_bank_account: __MODULE__.UsBankAccount.t() | nil,
            wechat_pay: __MODULE__.WechatPay.t() | nil
          }
    defstruct [
      :acss_debit,
      :affirm,
      :afterpay_clearpay,
      :alipay,
      :alma,
      :amazon_pay,
      :au_becs_debit,
      :bacs_debit,
      :bancontact,
      :billie,
      :boleto,
      :card,
      :cashapp,
      :customer_balance,
      :demo_pay,
      :eps,
      :fpx,
      :giropay,
      :grabpay,
      :ideal,
      :kakao_pay,
      :klarna,
      :konbini,
      :kr_card,
      :link,
      :mobilepay,
      :multibanco,
      :naver_pay,
      :oxxo,
      :p24,
      :pay_by_bank,
      :payco,
      :paynow,
      :paypal,
      :payto,
      :pix,
      :revolut_pay,
      :samsung_pay,
      :satispay,
      :sepa_debit,
      :sofort,
      :swish,
      :twint,
      :us_bank_account,
      :wechat_pay
    ]

    defmodule AcssDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). This is only accepted for Checkout Sessions in `setup` mode. Possible values: `cad`, `usd`.
      * `mandate_options` - Additional fields for Mandate creation
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
      * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
      * `verification_method` - Verification method for the intent Possible values: `automatic`, `instant`, `microdeposits`.
      """
      @type t :: %__MODULE__{
              currency: String.t() | nil,
              mandate_options: __MODULE__.MandateOptions.t() | nil,
              setup_future_usage: String.t() | nil,
              target_date: String.t() | nil,
              verification_method: String.t() | nil
            }
      defstruct [
        :currency,
        :mandate_options,
        :setup_future_usage,
        :target_date,
        :verification_method
      ]

      defmodule MandateOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `custom_mandate_url` - A URL for custom mandate text to render during confirmation step.
        The URL will be rendered with additional GET parameters `payment_intent` and `payment_intent_client_secret` when confirming a Payment Intent,
        or `setup_intent` and `setup_intent_client_secret` when confirming a Setup Intent.
        * `default_for` - List of Stripe products where this mandate can be selected automatically. Only usable in `setup` mode.
        * `interval_description` - Description of the mandate interval. Only required if 'payment_schedule' parameter is 'interval' or 'combined'. Max length: 500.
        * `payment_schedule` - Payment schedule for the mandate. Possible values: `combined`, `interval`, `sporadic`.
        * `transaction_type` - Transaction type of the mandate. Possible values: `business`, `personal`.
        """
        @type t :: %__MODULE__{
                custom_mandate_url: map() | nil,
                default_for: [String.t()] | nil,
                interval_description: String.t() | nil,
                payment_schedule: String.t() | nil,
                transaction_type: String.t() | nil
              }
        defstruct [
          :custom_mandate_url,
          :default_for,
          :interval_description,
          :payment_schedule,
          :transaction_type
        ]
      end
    end

    defmodule Affirm do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule AfterpayClearpay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule Alipay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Alma do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil
            }
      defstruct [:capture_method]
    end

    defmodule AmazonPay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule AuBecsDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil,
              target_date: String.t() | nil
            }
      defstruct [:setup_future_usage, :target_date]
    end

    defmodule BacsDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `mandate_options` - Additional fields for Mandate creation
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
      * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
      """
      @type t :: %__MODULE__{
              mandate_options: __MODULE__.MandateOptions.t() | nil,
              setup_future_usage: String.t() | nil,
              target_date: String.t() | nil
            }
      defstruct [:mandate_options, :setup_future_usage, :target_date]

      defmodule MandateOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `reference_prefix` - Prefix used to generate the Mandate reference. Must be at most 12 characters long. Must consist of only uppercase letters, numbers, spaces, or the following special characters: '/', '_', '-', '&', '.'. Cannot begin with 'DDIC' or 'STRIPE'.
        """
        @type t :: %__MODULE__{
                reference_prefix: map() | nil
              }
        defstruct [:reference_prefix]
      end
    end

    defmodule Bancontact do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Billie do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil
            }
      defstruct [:capture_method]
    end

    defmodule Boleto do
      @moduledoc "Nested parameters."

      @typedoc """
      * `expires_after_days` - The number of calendar days before a Boleto voucher expires. For example, if you create a Boleto voucher on Monday and you set expires_after_days to 2, the Boleto invoice will expire on Wednesday at 23:59 America/Sao_Paulo time.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
      """
      @type t :: %__MODULE__{
              expires_after_days: integer() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:expires_after_days, :setup_future_usage]
    end

    defmodule Card do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `installments` - Installment options for card payments
      * `request_extended_authorization` - Request ability to [capture beyond the standard authorization validity window](https://stripe.com/payments/extended-authorization) for this CheckoutSession. Possible values: `if_available`, `never`.
      * `request_incremental_authorization` - Request ability to [increment the authorization](https://stripe.com/payments/incremental-authorization) for this CheckoutSession. Possible values: `if_available`, `never`.
      * `request_multicapture` - Request ability to make [multiple captures](https://stripe.com/payments/multicapture) for this CheckoutSession. Possible values: `if_available`, `never`.
      * `request_overcapture` - Request ability to [overcapture](https://stripe.com/payments/overcapture) for this CheckoutSession. Possible values: `if_available`, `never`.
      * `request_three_d_secure` - We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://docs.stripe.com/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. If not provided, this value defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://docs.stripe.com/payments/3d-secure/authentication-flow#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine. Possible values: `any`, `automatic`, `challenge`.
      * `restrictions` - Restrictions to apply to the card payment method. For example, you can block specific card brands. You can't set this parameter if `ui_mode` is `custom`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `off_session`, `on_session`.
      * `statement_descriptor_suffix_kana` - Provides information about a card payment that customers see on their statements. Concatenated with the Kana prefix (shortened Kana descriptor) or Kana statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters. On card statements, the *concatenation* of both prefix and suffix (including separators) will appear truncated to 22 characters. Max length: 22.
      * `statement_descriptor_suffix_kanji` - Provides information about a card payment that customers see on their statements. Concatenated with the Kanji prefix (shortened Kanji descriptor) or Kanji statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 17 characters. On card statements, the *concatenation* of both prefix and suffix (including separators) will appear truncated to 17 characters. Max length: 17.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              installments: __MODULE__.Installments.t() | nil,
              request_extended_authorization: String.t() | nil,
              request_incremental_authorization: String.t() | nil,
              request_multicapture: String.t() | nil,
              request_overcapture: String.t() | nil,
              request_three_d_secure: String.t() | nil,
              restrictions: __MODULE__.Restrictions.t() | nil,
              setup_future_usage: String.t() | nil,
              statement_descriptor_suffix_kana: String.t() | nil,
              statement_descriptor_suffix_kanji: String.t() | nil
            }
      defstruct [
        :capture_method,
        :installments,
        :request_extended_authorization,
        :request_incremental_authorization,
        :request_multicapture,
        :request_overcapture,
        :request_three_d_secure,
        :restrictions,
        :setup_future_usage,
        :statement_descriptor_suffix_kana,
        :statement_descriptor_suffix_kanji
      ]

      defmodule Installments do
        @moduledoc "Nested parameters."

        @typedoc """
        * `enabled` - Setting to true enables installments for this Checkout Session.
        Setting to false will prevent any installment plan from applying to a payment.
        """
        @type t :: %__MODULE__{
                enabled: boolean() | nil
              }
        defstruct [:enabled]
      end

      defmodule Restrictions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `brands_blocked` - Specify the card brands to block in the Checkout Session. If a customer enters or selects a card belonging to a blocked brand, they can't complete the Session.
        """
        @type t :: %__MODULE__{
                brands_blocked: [String.t()] | nil
              }
        defstruct [:brands_blocked]
      end
    end

    defmodule Cashapp do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule CustomerBalance do
      @moduledoc "Nested parameters."

      @typedoc """
      * `bank_transfer` - Configuration for the bank transfer funding type, if the `funding_type` is set to `bank_transfer`.
      * `funding_type` - The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`. Possible values: `bank_transfer`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              bank_transfer: __MODULE__.BankTransfer.t() | nil,
              funding_type: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:bank_transfer, :funding_type, :setup_future_usage]

      defmodule BankTransfer do
        @moduledoc "Nested parameters."

        @typedoc """
        * `eu_bank_transfer` - Configuration for eu_bank_transfer funding type.
        * `requested_address_types` - List of address types that should be returned in the financial_addresses response. If not specified, all valid types will be returned.

        Permitted values include: `sort_code`, `zengin`, `iban`, or `spei`.
        * `type` - The list of bank transfer types that this PaymentIntent is allowed to use for funding. Possible values: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, `mx_bank_transfer`, `us_bank_transfer`.
        """
        @type t :: %__MODULE__{
                eu_bank_transfer: __MODULE__.EuBankTransfer.t() | nil,
                requested_address_types: [String.t()] | nil,
                type: String.t() | nil
              }
        defstruct [:eu_bank_transfer, :requested_address_types, :type]

        defmodule EuBankTransfer do
          @moduledoc "Nested parameters."

          @typedoc """
          * `country` - The desired country code of the bank account information. Permitted values include: `BE`, `DE`, `ES`, `FR`, `IE`, or `NL`. Max length: 5000.
          """
          @type t :: %__MODULE__{
                  country: String.t() | nil
                }
          defstruct [:country]
        end
      end
    end

    defmodule DemoPay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Eps do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Fpx do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Giropay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Grabpay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Ideal do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule KakaoPay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule Klarna do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      * `subscriptions` - Subscription details if the Checkout Session sets up a future subscription.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil,
              subscriptions: map() | nil
            }
      defstruct [:capture_method, :setup_future_usage, :subscriptions]
    end

    defmodule Konbini do
      @moduledoc "Nested parameters."

      @typedoc """
      * `expires_after_days` - The number of calendar days (between 1 and 60) after which Konbini payment instructions will expire. For example, if a PaymentIntent is confirmed with Konbini and `expires_after_days` set to 2 on Monday JST, the instructions will expire on Wednesday 23:59:59 JST. Defaults to 3 days.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              expires_after_days: integer() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:expires_after_days, :setup_future_usage]
    end

    defmodule KrCard do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule Link do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule Mobilepay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule Multibanco do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule NaverPay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule Oxxo do
      @moduledoc "Nested parameters."

      @typedoc """
      * `expires_after_days` - The number of calendar days before an OXXO voucher expires. For example, if you create an OXXO voucher on Monday and you set expires_after_days to 2, the OXXO invoice will expire on Wednesday at 23:59 America/Mexico_City time.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              expires_after_days: integer() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:expires_after_days, :setup_future_usage]
    end

    defmodule P24 do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      * `tos_shown_and_accepted` - Confirm that the payer has accepted the P24 terms and conditions.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil,
              tos_shown_and_accepted: boolean() | nil
            }
      defstruct [:setup_future_usage, :tos_shown_and_accepted]
    end

    defmodule Payco do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil
            }
      defstruct [:capture_method]
    end

    defmodule Paynow do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Paypal do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `preferred_locale` - [Preferred locale](https://docs.stripe.com/payments/paypal/supported-locales) of the PayPal checkout page that the customer is redirected to. Possible values: `cs-CZ`, `da-DK`, `de-AT`, `de-DE`, `de-LU`, `el-GR`, `en-GB`, `en-US`, `es-ES`, `fi-FI`, `fr-BE`, `fr-FR`, `fr-LU`, `hu-HU`, `it-IT`, `nl-BE`, `nl-NL`, `pl-PL`, `pt-PT`, `sk-SK`, `sv-SE`.
      * `reference` - A reference of the PayPal transaction visible to customer which is mapped to PayPal's invoice ID. This must be a globally unique ID if you have configured in your PayPal settings to block multiple payments per invoice ID. Max length: 127.
      * `risk_correlation_id` - The risk correlation ID for an on-session payment using a saved PayPal payment method. Max length: 32.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication).

      If you've already set `setup_future_usage` and you're performing a request using a publishable key, you can only update the value from `on_session` to `off_session`. Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              preferred_locale: String.t() | nil,
              reference: String.t() | nil,
              risk_correlation_id: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [
        :capture_method,
        :preferred_locale,
        :reference,
        :risk_correlation_id,
        :setup_future_usage
      ]
    end

    defmodule Payto do
      @moduledoc "Nested parameters."

      @typedoc """
      * `mandate_options` - Additional fields for Mandate creation
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              mandate_options: __MODULE__.MandateOptions.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:mandate_options, :setup_future_usage]

      defmodule MandateOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `amount` - Amount that will be collected. It is required when `amount_type` is `fixed`.
        * `amount_type` - The type of amount that will be collected. The amount charged must be exact or up to the value of `amount` param for `fixed` or `maximum` type respectively. Defaults to `maximum`. Possible values: `fixed`, `maximum`.
        * `end_date` - Date, in YYYY-MM-DD format, after which payments will not be collected. Defaults to no end date.
        * `payment_schedule` - The periodicity at which payments will be collected. Defaults to `adhoc`. Possible values: `adhoc`, `annual`, `daily`, `fortnightly`, `monthly`, `quarterly`, `semi_annual`, `weekly`.
        * `payments_per_period` - The number of payments that will be made during a payment period. Defaults to 1 except for when `payment_schedule` is `adhoc`. In that case, it defaults to no limit.
        * `purpose` - The purpose for which payments are made. Has a default value based on your merchant category code. Possible values: `dependant_support`, `government`, `loan`, `mortgage`, `other`, `pension`, `personal`, `retail`, `salary`, `tax`, `utility`.
        * `start_date` - Date, in YYYY-MM-DD format, from which payments will be collected. Defaults to confirmation time.
        """
        @type t :: %__MODULE__{
                amount: map() | nil,
                amount_type: String.t() | nil,
                end_date: map() | nil,
                payment_schedule: String.t() | nil,
                payments_per_period: map() | nil,
                purpose: String.t() | nil,
                start_date: map() | nil
              }
        defstruct [
          :amount,
          :amount_type,
          :end_date,
          :payment_schedule,
          :payments_per_period,
          :purpose,
          :start_date
        ]
      end
    end

    defmodule Pix do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount_includes_iof` - Determines if the amount includes the IOF tax. Defaults to `never`. Possible values: `always`, `never`.
      * `expires_after_seconds` - The number of seconds (between 10 and 1209600) after which Pix payment will expire. Defaults to 86400 seconds.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              amount_includes_iof: String.t() | nil,
              expires_after_seconds: integer() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:amount_includes_iof, :expires_after_seconds, :setup_future_usage]
    end

    defmodule RevolutPay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:capture_method, :setup_future_usage]
    end

    defmodule SamsungPay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil
            }
      defstruct [:capture_method]
    end

    defmodule Satispay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `manual`.
      """
      @type t :: %__MODULE__{
              capture_method: String.t() | nil
            }
      defstruct [:capture_method]
    end

    defmodule SepaDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `mandate_options` - Additional fields for Mandate creation
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
      * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
      """
      @type t :: %__MODULE__{
              mandate_options: __MODULE__.MandateOptions.t() | nil,
              setup_future_usage: String.t() | nil,
              target_date: String.t() | nil
            }
      defstruct [:mandate_options, :setup_future_usage, :target_date]

      defmodule MandateOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `reference_prefix` - Prefix used to generate the Mandate reference. Must be at most 12 characters long. Must consist of only uppercase letters, numbers, spaces, or the following special characters: '/', '_', '-', '&', '.'. Cannot begin with 'STRIPE'.
        """
        @type t :: %__MODULE__{
                reference_prefix: map() | nil
              }
        defstruct [:reference_prefix]
      end
    end

    defmodule Sofort do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule Swish do
      @moduledoc "Nested parameters."

      @typedoc """
      * `reference` - The order reference that will be displayed to customers in the Swish application. Defaults to the `id` of the Payment Intent. Max length: 5000.
      """
      @type t :: %__MODULE__{
              reference: String.t() | nil
            }
      defstruct [:reference]
    end

    defmodule Twint do
      @moduledoc "Nested parameters."

      @typedoc """
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              setup_future_usage: String.t() | nil
            }
      defstruct [:setup_future_usage]
    end

    defmodule UsBankAccount do
      @moduledoc "Nested parameters."

      @typedoc """
      * `financial_connections` - Additional fields for Financial Connections Session creation
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`, `off_session`, `on_session`.
      * `target_date` - Controls when Stripe will attempt to debit the funds from the customer's account. The date must be a string in YYYY-MM-DD format. The date must be in the future and between 3 and 15 calendar days from now. Max length: 5000.
      * `verification_method` - Verification method for the intent Possible values: `automatic`, `instant`.
      """
      @type t :: %__MODULE__{
              financial_connections: __MODULE__.FinancialConnections.t() | nil,
              setup_future_usage: String.t() | nil,
              target_date: String.t() | nil,
              verification_method: String.t() | nil
            }
      defstruct [:financial_connections, :setup_future_usage, :target_date, :verification_method]

      defmodule FinancialConnections do
        @moduledoc "Nested parameters."

        @typedoc """
        * `permissions` - The list of permissions to request. If this parameter is passed, the `payment_method` permission must be included. Valid permissions include: `balances`, `ownership`, `payment_method`, and `transactions`.
        * `prefetch` - List of data features that you would like to retrieve upon account creation.
        """
        @type t :: %__MODULE__{
                permissions: [String.t()] | nil,
                prefetch: [String.t()] | nil
              }
        defstruct [:permissions, :prefetch]
      end
    end

    defmodule WechatPay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `app_id` - The app ID registered with WeChat Pay. Only required when client is ios or android. Max length: 5000.
      * `client` - The client type that the end customer will pay from Possible values: `android`, `ios`, `web`.
      * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

      If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

      If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

      When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `none`.
      """
      @type t :: %__MODULE__{
              app_id: String.t() | nil,
              client: String.t() | nil,
              setup_future_usage: String.t() | nil
            }
      defstruct [:app_id, :client, :setup_future_usage]
    end
  end

  defmodule Permissions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `update_shipping_details` - Determines which entity is allowed to update the shipping details.

    Default is `client_only`. Stripe Checkout client will automatically update the shipping details. If set to `server_only`, only your server is allowed to update the shipping details.

    When set to `server_only`, you must add the onShippingDetailsChange event handler when initializing the Stripe Checkout client and manually update the shipping details from your server using the Stripe API. Possible values: `client_only`, `server_only`.
    """
    @type t :: %__MODULE__{
            update_shipping_details: String.t() | nil
          }
    defstruct [:update_shipping_details]
  end

  defmodule PhoneNumberCollection do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Set to `true` to enable phone number collection.

    Can only be set in `payment` and `subscription` mode.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil
          }
    defstruct [:enabled]
  end

  defmodule SavedPaymentMethodOptions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `allow_redisplay_filters` - Uses the `allow_redisplay` value of each saved payment method to filter the set presented to a returning customer. By default, only saved payment methods with ’allow_redisplay: ‘always’ are shown in Checkout.
    * `payment_method_remove` - Enable customers to choose if they wish to remove their saved payment methods. Disabled by default. Possible values: `disabled`, `enabled`.
    * `payment_method_save` - Enable customers to choose if they wish to save their payment method for future use. Disabled by default. Possible values: `disabled`, `enabled`.
    """
    @type t :: %__MODULE__{
            allow_redisplay_filters: [String.t()] | nil,
            payment_method_remove: String.t() | nil,
            payment_method_save: String.t() | nil
          }
    defstruct [:allow_redisplay_filters, :payment_method_remove, :payment_method_save]
  end

  defmodule SetupIntentData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    * `on_behalf_of` - The Stripe account for which the setup is intended.
    """
    @type t :: %__MODULE__{
            description: String.t() | nil,
            metadata: %{String.t() => String.t()} | nil,
            on_behalf_of: String.t() | nil
          }
    defstruct [:description, :metadata, :on_behalf_of]
  end

  defmodule ShippingAddressCollection do
    @moduledoc "Nested parameters."

    @typedoc """
    * `allowed_countries` - An array of two-letter ISO country codes representing which countries Checkout should provide as options for
    shipping locations.
    """
    @type t :: %__MODULE__{
            allowed_countries: [String.t()] | nil
          }
    defstruct [:allowed_countries]
  end

  defmodule ShippingOptions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `shipping_rate` - The ID of the Shipping Rate to use for this shipping option. Max length: 5000.
    * `shipping_rate_data` - Parameters to be passed to Shipping Rate creation for this shipping option.
    """
    @type t :: %__MODULE__{
            shipping_rate: String.t() | nil,
            shipping_rate_data: __MODULE__.ShippingRateData.t() | nil
          }
    defstruct [:shipping_rate, :shipping_rate_data]

    defmodule ShippingRateData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `delivery_estimate` - The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions.
      * `display_name` - The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions. Max length: 100.
      * `fixed_amount` - Describes a fixed amount to charge for shipping. Must be present if type is `fixed_amount`.
      * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
      * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`.
      * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. The Shipping tax code is `txcd_92010001`.
      * `type` - The type of calculation to use on the shipping rate. Possible values: `fixed_amount`.
      """
      @type t :: %__MODULE__{
              delivery_estimate: __MODULE__.DeliveryEstimate.t() | nil,
              display_name: String.t() | nil,
              fixed_amount: __MODULE__.FixedAmount.t() | nil,
              metadata: %{String.t() => String.t()} | nil,
              tax_behavior: String.t() | nil,
              tax_code: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [
        :delivery_estimate,
        :display_name,
        :fixed_amount,
        :metadata,
        :tax_behavior,
        :tax_code,
        :type
      ]

      defmodule DeliveryEstimate do
        @moduledoc "Nested parameters."

        @typedoc """
        * `maximum` - The upper bound of the estimated range. If empty, represents no upper bound i.e., infinite.
        * `minimum` - The lower bound of the estimated range. If empty, represents no lower bound.
        """
        @type t :: %__MODULE__{
                maximum: __MODULE__.Maximum.t() | nil,
                minimum: __MODULE__.Minimum.t() | nil
              }
        defstruct [:maximum, :minimum]

        defmodule Maximum do
          @moduledoc "Nested parameters."

          @typedoc """
          * `unit` - A unit of time. Possible values: `business_day`, `day`, `hour`, `month`, `week`.
          * `value` - Must be greater than 0.
          """
          @type t :: %__MODULE__{
                  unit: String.t() | nil,
                  value: integer() | nil
                }
          defstruct [:unit, :value]
        end

        defmodule Minimum do
          @moduledoc "Nested parameters."

          @typedoc """
          * `unit` - A unit of time. Possible values: `business_day`, `day`, `hour`, `month`, `week`.
          * `value` - Must be greater than 0.
          """
          @type t :: %__MODULE__{
                  unit: String.t() | nil,
                  value: integer() | nil
                }
          defstruct [:unit, :value]
        end
      end

      defmodule FixedAmount do
        @moduledoc "Nested parameters."

        @typedoc """
        * `amount` - A non-negative integer in cents representing how much to charge.
        * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
        * `currency_options` - Shipping rates defined in each available currency option. Each key must be a three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported currency](https://stripe.com/docs/currencies).
        """
        @type t :: %__MODULE__{
                amount: integer() | nil,
                currency: String.t() | nil,
                currency_options: %{String.t() => __MODULE__.CurrencyOptions.t()} | nil
              }
        defstruct [:amount, :currency, :currency_options]

        defmodule CurrencyOptions do
          @moduledoc "Nested parameters."

          @typedoc """
          * `amount` - A non-negative integer in cents representing how much to charge.
          * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`.
          """
          @type t :: %__MODULE__{
                  amount: integer() | nil,
                  tax_behavior: String.t() | nil
                }
          defstruct [:amount, :tax_behavior]
        end
      end
    end
  end

  defmodule SubscriptionData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `application_fee_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the application owner's Stripe account. To use an application fee percent, the request must be made on behalf of another account, using the `Stripe-Account` header or an OAuth key. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
    * `billing_cycle_anchor` - A future timestamp to anchor the subscription's billing cycle for new subscriptions. You can't set this parameter if `ui_mode` is `custom`. Format: Unix timestamp.
    * `billing_mode` - Controls how prorations and invoices for subscriptions are calculated and orchestrated.
    * `default_tax_rates` - The tax rates that will apply to any subscription item that does not have
    `tax_rates` set. Invoices created will have their `default_tax_rates` populated
    from the subscription.
    * `description` - The subscription's description, meant to be displayable to the customer.
    Use this field to optionally store an explanation of the subscription
    for rendering in the [customer portal](https://docs.stripe.com/customer-management). Max length: 500.
    * `invoice_settings` - All invoices will be billed using the specified settings.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    * `on_behalf_of` - The account on behalf of which to charge, for each of the subscription's invoices.
    * `proration_behavior` - Determines how to handle prorations resulting from the `billing_cycle_anchor`. If no value is passed, the default is `create_prorations`. Possible values: `create_prorations`, `none`.
    * `transfer_data` - If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
    * `trial_end` - Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. Has to be at least 48 hours in the future. Format: Unix timestamp.
    * `trial_period_days` - Integer representing the number of trial period days before the customer is charged for the first time. Has to be at least 1.
    * `trial_settings` - Settings related to subscription trials.
    """
    @type t :: %__MODULE__{
            application_fee_percent: float() | nil,
            billing_cycle_anchor: integer() | nil,
            billing_mode: __MODULE__.BillingMode.t() | nil,
            default_tax_rates: [String.t()] | nil,
            description: String.t() | nil,
            invoice_settings: __MODULE__.InvoiceSettings.t() | nil,
            metadata: %{String.t() => String.t()} | nil,
            on_behalf_of: String.t() | nil,
            proration_behavior: String.t() | nil,
            transfer_data: __MODULE__.TransferData.t() | nil,
            trial_end: integer() | nil,
            trial_period_days: integer() | nil,
            trial_settings: __MODULE__.TrialSettings.t() | nil
          }
    defstruct [
      :application_fee_percent,
      :billing_cycle_anchor,
      :billing_mode,
      :default_tax_rates,
      :description,
      :invoice_settings,
      :metadata,
      :on_behalf_of,
      :proration_behavior,
      :transfer_data,
      :trial_end,
      :trial_period_days,
      :trial_settings
    ]

    defmodule BillingMode do
      @moduledoc "Nested parameters."

      @typedoc """
      * `flexible` - Configure behavior for flexible billing mode.
      * `type` - Controls the calculation and orchestration of prorations and invoices for subscriptions. If no value is passed, the default is `flexible`. Possible values: `classic`, `flexible`.
      """
      @type t :: %__MODULE__{
              flexible: __MODULE__.Flexible.t() | nil,
              type: String.t() | nil
            }
      defstruct [:flexible, :type]

      defmodule Flexible do
        @moduledoc "Nested parameters."

        @typedoc """
        * `proration_discounts` - Controls how invoices and invoice items display proration amounts and discount amounts. Possible values: `included`, `itemized`.
        """
        @type t :: %__MODULE__{
                proration_discounts: String.t() | nil
              }
        defstruct [:proration_discounts]
      end
    end

    defmodule InvoiceSettings do
      @moduledoc "Nested parameters."

      @typedoc """
      * `issuer` - The connected account that issues the invoice. The invoice is presented with the branding and support information of the specified account.
      """
      @type t :: %__MODULE__{
              issuer: __MODULE__.Issuer.t() | nil
            }
      defstruct [:issuer]

      defmodule Issuer do
        @moduledoc "Nested parameters."

        @typedoc """
        * `account` - The connected account being referenced when `type` is `account`.
        * `type` - Type of the account referenced in the request. Possible values: `account`, `self`.
        """
        @type t :: %__MODULE__{
                account: String.t() | nil,
                type: String.t() | nil
              }
        defstruct [:account, :type]
      end
    end

    defmodule TransferData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount_percent` - A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice total that will be transferred to the destination account. By default, the entire amount is transferred to the destination.
      * `destination` - ID of an existing, connected Stripe account.
      """
      @type t :: %__MODULE__{
              amount_percent: float() | nil,
              destination: String.t() | nil
            }
      defstruct [:amount_percent, :destination]
    end

    defmodule TrialSettings do
      @moduledoc "Nested parameters."

      @typedoc """
      * `end_behavior` - Defines how the subscription should behave when the user's free trial ends.
      """
      @type t :: %__MODULE__{
              end_behavior: __MODULE__.EndBehavior.t() | nil
            }
      defstruct [:end_behavior]

      defmodule EndBehavior do
        @moduledoc "Nested parameters."

        @typedoc """
        * `missing_payment_method` - Indicates how the subscription should change when the trial ends if the user did not provide a payment method. Possible values: `cancel`, `create_invoice`, `pause`.
        """
        @type t :: %__MODULE__{
                missing_payment_method: String.t() | nil
              }
        defstruct [:missing_payment_method]
      end
    end
  end

  defmodule TaxIdCollection do
    @moduledoc "Nested parameters."

    @typedoc """
    * `enabled` - Enable tax ID collection during checkout. Defaults to `false`.
    * `required` - Describes whether a tax ID is required during checkout. Defaults to `never`. You can't set this parameter if `ui_mode` is `custom`. Possible values: `if_supported`, `never`.
    """
    @type t :: %__MODULE__{
            enabled: boolean() | nil,
            required: String.t() | nil
          }
    defstruct [:enabled, :required]
  end

  defmodule WalletOptions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `link` - contains details about the Link wallet options.
    """
    @type t :: %__MODULE__{
            link: __MODULE__.Link.t() | nil
          }
    defstruct [:link]

    defmodule Link do
      @moduledoc "Nested parameters."

      @typedoc """
      * `display` - Specifies whether Checkout should display Link as a payment option. By default, Checkout will display all the supported wallets that the Checkout Session was created with. This is the `auto` behavior, and it is the default choice. Possible values: `auto`, `never`.
      """
      @type t :: %__MODULE__{
              display: String.t() | nil
            }
      defstruct [:display]
    end
  end
end
