# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.Account do
  @moduledoc """
  Account

  A V2 Account is a representation of a company or individual that a Stripe user does business with. Accounts contain the contact details, Legal Entity information, and configuration required to enable the Account for use across Stripe products.
  """

  @typedoc """
  * `applied_configurations` - The configurations that have been applied to this account.
  * `closed` - Indicates whether the account has been closed.
  * `configuration` - An Account represents a company, individual, or other entity that a user interacts with. Accounts store identity information and one or more configurations that enable product-specific capabilities. You can assign configurations at creation or add them later.
  * `contact_email` - The default contact email address for the Account. Required when configuring the account as a merchant or recipient.
  * `contact_phone` - The default contact phone for the Account.
  * `created` - Time at which the object was created. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `dashboard` - A value indicating the Stripe dashboard this Account has access to. This will depend on which configurations are enabled for this account. Possible values: `express`, `full`, `none`.
  * `defaults` - Default values for settings shared across Account configurations.
  * `display_name` - A descriptive name for the Account. This name will be surfaced in the Stripe Dashboard and on any invoices sent to the Account.
  * `future_requirements` - Information about the future requirements for the Account that will eventually come into effect, including what information needs to be collected, and by when.
  * `id` - Unique identifier for the Account.
  * `identity` - Information about the company, individual, and business represented by the Account.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.account`.
  * `requirements` - Information about the active requirements for the Account, including what information needs to be collected, and by when.
  """
  @type t :: %__MODULE__{
          applied_configurations: [String.t()],
          closed: boolean() | nil,
          configuration: configuration() | nil,
          contact_email: String.t() | nil,
          contact_phone: String.t() | nil,
          created: String.t(),
          dashboard: String.t() | nil,
          defaults: defaults() | nil,
          display_name: String.t() | nil,
          future_requirements: future_requirements() | nil,
          id: String.t(),
          identity: identity() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()} | nil,
          object: String.t(),
          requirements: requirements() | nil
        }

  defstruct [
    :applied_configurations,
    :closed,
    :configuration,
    :contact_email,
    :contact_phone,
    :created,
    :dashboard,
    :defaults,
    :display_name,
    :future_requirements,
    :id,
    :identity,
    :livemode,
    :metadata,
    :object,
    :requirements
  ]

  @object_name "v2.core.account"
  def object_name, do: @object_name

  @typedoc """
  * `customer` - The Customer Configuration allows the Account to be used in inbound payment flows.
  * `merchant` - Enables the Account to act as a connected account and collect payments facilitated by a Connect platform. You must onboard your platform to Connect before you can add this configuration to your connected accounts. Utilize this configuration when the Account will be the Merchant of Record, like with Direct charges or Destination Charges with on_behalf_of set.
  * `recipient` - The Recipient Configuration allows the Account to receive funds. Utilize this configuration if the Account will not be the Merchant of Record, like with Separate Charges & Transfers, or Destination Charges without on_behalf_of set.
  """
  @type configuration :: %{
          optional(:customer) => configuration_customer() | nil,
          optional(:merchant) => configuration_merchant() | nil,
          optional(:recipient) => configuration_recipient() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `applied` - Indicates whether the customer configuration is active. You can deactivate or reactivate the customer configuration by updating this property. Deactivating the configuration by setting this value to false will unrequest all capabilities within the configuration. It will not delete any of the configuration's other properties.
  * `automatic_indirect_tax` - Settings for automatic indirect tax calculation on the customer's invoices, subscriptions, Checkout Sessions, and Payment Links. Available when automatic tax calculation is available for the customer account's location.
  * `billing` - Default Billing settings for the customer account, used in Invoices and Subscriptions.
  * `capabilities` - Capabilities that have been requested on the Customer Configuration.
  * `shipping` - The customer's shipping information. Appears on invoices emailed to this customer.
  * `test_clock` - ID of the test clock to attach to the customer. Can only be set on testmode Accounts, and when the Customer Configuration is first set on an Account.
  """
  @type configuration_customer :: %{
          optional(:applied) => boolean() | nil,
          optional(:automatic_indirect_tax) =>
            configuration_customer_automatic_indirect_tax() | nil,
          optional(:billing) => configuration_customer_billing() | nil,
          optional(:capabilities) => configuration_customer_capabilities() | nil,
          optional(:shipping) => configuration_customer_shipping() | nil,
          optional(:test_clock) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `exempt` - The customer account's tax exemption status: `none`, `exempt`, or `reverse`. When `reverse`, invoice and receipt PDFs include "Reverse charge". Possible values: `exempt`, `none`, `reverse`.
  * `ip_address` - A recent IP address of the customer used for tax reporting and tax location inference.
  * `location` - The customer account's identified tax location, derived from `location_source`. Only rendered if the `automatic_indirect_tax` feature is requested and `active`.
  * `location_source` - Data source used to identify the customer account's tax location. Defaults to `identity_address`. Used for automatic indirect tax calculation. Possible values: `identity_address`, `ip_address`, `payment_method`, `shipping_address`.
  """
  @type configuration_customer_automatic_indirect_tax :: %{
          optional(:exempt) => String.t() | nil,
          optional(:ip_address) => String.t() | nil,
          optional(:location) => configuration_customer_automatic_indirect_tax_location() | nil,
          optional(:location_source) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - The identified tax country of the customer.
  * `state` - The identified tax state, county, province, or region of the customer.
  """
  @type configuration_customer_automatic_indirect_tax_location :: %{
          optional(:country) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `default_payment_method` - ID of a PaymentMethod attached to the customer account to use as the default for invoices and subscriptions.
  * `invoice` - Default invoice settings for the customer account.
  """
  @type configuration_customer_billing :: %{
          optional(:default_payment_method) => String.t() | nil,
          optional(:invoice) => configuration_customer_billing_invoice() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom_fields` - The list of up to 4 default custom fields to be displayed on invoices for this customer. When updating, pass an empty string to remove previously-defined fields.
  * `footer` - Default invoice footer.
  * `next_sequence` - Sequence number to use on the customer account's next invoice. Defaults to 1.
  * `prefix` - Prefix used to generate unique invoice numbers. Must be 3-12 uppercase letters or numbers.
  * `rendering` - Default invoice PDF rendering options.
  """
  @type configuration_customer_billing_invoice :: %{
          optional(:custom_fields) =>
            [configuration_customer_billing_invoice_custom_fields()] | nil,
          optional(:footer) => String.t() | nil,
          optional(:next_sequence) => integer() | nil,
          optional(:prefix) => String.t() | nil,
          optional(:rendering) => configuration_customer_billing_invoice_rendering() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `name` - The name of the custom field. This may be up to 40 characters.
  * `value` - The value of the custom field. This may be up to 140 characters. When updating, pass an empty string to remove previously-defined values.
  """
  @type configuration_customer_billing_invoice_custom_fields :: %{
          optional(:name) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_tax_display` - Indicates whether displayed line item prices and amounts on invoice PDFs include inclusive tax amounts. Must be either `include_inclusive_tax` or `exclude_tax`. Possible values: `exclude_tax`, `include_inclusive_tax`.
  * `template` - ID of the invoice rendering template to use for future invoices.
  """
  @type configuration_customer_billing_invoice_rendering :: %{
          optional(:amount_tax_display) => String.t() | nil,
          optional(:template) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `automatic_indirect_tax` - Generates requirements for enabling automatic indirect tax calculation on this customer's invoices or subscriptions. Recommended to request this capability if planning to enable automatic tax calculation on this customer's invoices or subscriptions.
  """
  @type configuration_customer_capabilities :: %{
          optional(:automatic_indirect_tax) =>
            configuration_customer_capabilities_automatic_indirect_tax() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_customer_capabilities_automatic_indirect_tax :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_customer_capabilities_automatic_indirect_tax_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_customer_capabilities_automatic_indirect_tax_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - Customer shipping address.
  * `name` - Customer name.
  * `phone` - Customer phone (including extension).
  """
  @type configuration_customer_shipping :: %{
          optional(:address) => configuration_customer_shipping_address() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  """
  @type configuration_customer_shipping_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `applied` - Indicates whether the merchant configuration is active. You can deactivate or reactivate the merchant configuration by updating this property. Deactivating the configuration by setting this value to false doesn't delete the configuration's properties.
  * `bacs_debit_payments` - Settings for Bacs Direct Debit payments.
  * `branding` - Settings used to apply the merchant's branding to email receipts, invoices, Checkout, and other products.
  * `capabilities` - Capabilities that have been requested on the Merchant Configuration.
  * `card_payments` - Card payments settings.
  * `konbini_payments` - Settings specific to Konbini payments on the account.
  * `mcc` - The Merchant Category Code (MCC) for the merchant. MCCs classify businesses based on the goods or services they provide.
  * `script_statement_descriptor` - Settings for the default text that appears on statements for language variations.
  * `sepa_debit_payments` - Settings for SEPA Direct Debit payments.
  * `statement_descriptor` - Statement descriptor.
  * `support` - Publicly available contact information for sending support issues to.
  """
  @type configuration_merchant :: %{
          optional(:applied) => boolean() | nil,
          optional(:bacs_debit_payments) => configuration_merchant_bacs_debit_payments() | nil,
          optional(:branding) => configuration_merchant_branding() | nil,
          optional(:capabilities) => configuration_merchant_capabilities() | nil,
          optional(:card_payments) => configuration_merchant_card_payments() | nil,
          optional(:konbini_payments) => configuration_merchant_konbini_payments() | nil,
          optional(:mcc) => String.t() | nil,
          optional(:script_statement_descriptor) =>
            configuration_merchant_script_statement_descriptor() | nil,
          optional(:sepa_debit_payments) => configuration_merchant_sepa_debit_payments() | nil,
          optional(:statement_descriptor) => configuration_merchant_statement_descriptor() | nil,
          optional(:support) => configuration_merchant_support() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `display_name` - Display name for Bacs Direct Debit payments.
  * `service_user_number` - Service User Number (SUN) for Bacs Direct Debit payments.
  """
  @type configuration_merchant_bacs_debit_payments :: %{
          optional(:display_name) => String.t() | nil,
          optional(:service_user_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `icon` - ID of a [file upload](https://docs.stripe.com/api/persons/update#create_file): An icon for the merchant. Must be square and at least 128px x 128px.
  * `logo` - ID of a [file upload](https://docs.stripe.com/api/persons/update#create_file): A logo for the merchant that will be used in Checkout instead of the icon and without the merchant's name next to it if provided. Must be at least 128px x 128px.
  * `primary_color` - A CSS hex color value representing the primary branding color for the merchant.
  * `secondary_color` - A CSS hex color value representing the secondary branding color for the merchant.
  """
  @type configuration_merchant_branding :: %{
          optional(:icon) => String.t() | nil,
          optional(:logo) => String.t() | nil,
          optional(:primary_color) => String.t() | nil,
          optional(:secondary_color) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach_debit_payments` - Allow the merchant to process ACH debit payments.
  * `acss_debit_payments` - Allow the merchant to process ACSS debit payments.
  * `affirm_payments` - Allow the merchant to process Affirm payments.
  * `afterpay_clearpay_payments` - Allow the merchant to process Afterpay/Clearpay payments.
  * `alma_payments` - Allow the merchant to process Alma payments.
  * `amazon_pay_payments` - Allow the merchant to process Amazon Pay payments.
  * `au_becs_debit_payments` - Allow the merchant to process Australian BECS Direct Debit payments.
  * `bacs_debit_payments` - Allow the merchant to process BACS Direct Debit payments.
  * `bancontact_payments` - Allow the merchant to process Bancontact payments.
  * `blik_payments` - Allow the merchant to process BLIK payments.
  * `boleto_payments` - Allow the merchant to process Boleto payments.
  * `card_payments` - Allow the merchant to collect card payments.
  * `cartes_bancaires_payments` - Allow the merchant to process Cartes Bancaires payments.
  * `cashapp_payments` - Allow the merchant to process Cash App payments.
  * `eps_payments` - Allow the merchant to process EPS payments.
  * `fpx_payments` - Allow the merchant to process FPX payments.
  * `gb_bank_transfer_payments` - Allow the merchant to process UK bank transfer payments.
  * `grabpay_payments` - Allow the merchant to process GrabPay payments.
  * `ideal_payments` - Allow the merchant to process iDEAL payments.
  * `jcb_payments` - Allow the merchant to process JCB card payments.
  * `jp_bank_transfer_payments` - Allow the merchant to process Japanese bank transfer payments.
  * `kakao_pay_payments` - Allow the merchant to process Kakao Pay payments.
  * `klarna_payments` - Allow the merchant to process Klarna payments.
  * `konbini_payments` - Allow the merchant to process Konbini convenience store payments.
  * `kr_card_payments` - Allow the merchant to process Korean card payments.
  * `link_payments` - Allow the merchant to process Link payments.
  * `mobilepay_payments` - Allow the merchant to process MobilePay payments.
  * `multibanco_payments` - Allow the merchant to process Multibanco payments.
  * `mx_bank_transfer_payments` - Allow the merchant to process Mexican bank transfer payments.
  * `naver_pay_payments` - Allow the merchant to process Naver Pay payments.
  * `oxxo_payments` - Allow the merchant to process OXXO payments.
  * `p24_payments` - Allow the merchant to process Przelewy24 (P24) payments.
  * `pay_by_bank_payments` - Allow the merchant to process Pay by Bank payments.
  * `payco_payments` - Allow the merchant to process PAYCO payments.
  * `paynow_payments` - Allow the merchant to process PayNow payments.
  * `promptpay_payments` - Allow the merchant to process PromptPay payments.
  * `revolut_pay_payments` - Allow the merchant to process Revolut Pay payments.
  * `samsung_pay_payments` - Allow the merchant to process Samsung Pay payments.
  * `sepa_bank_transfer_payments` - Allow the merchant to process SEPA bank transfer payments.
  * `sepa_debit_payments` - Allow the merchant to process SEPA Direct Debit payments.
  * `stripe_balance` - Capabilities that enable the merchant to manage their Stripe Balance (/v1/balance).
  * `swish_payments` - Allow the merchant to process Swish payments.
  * `twint_payments` - Allow the merchant to process TWINT payments.
  * `us_bank_transfer_payments` - Allow the merchant to process US bank transfer payments.
  * `zip_payments` - Allow the merchant to process Zip payments.
  """
  @type configuration_merchant_capabilities :: %{
          optional(:ach_debit_payments) =>
            configuration_merchant_capabilities_ach_debit_payments() | nil,
          optional(:acss_debit_payments) =>
            configuration_merchant_capabilities_acss_debit_payments() | nil,
          optional(:affirm_payments) =>
            configuration_merchant_capabilities_affirm_payments() | nil,
          optional(:afterpay_clearpay_payments) =>
            configuration_merchant_capabilities_afterpay_clearpay_payments() | nil,
          optional(:alma_payments) => configuration_merchant_capabilities_alma_payments() | nil,
          optional(:amazon_pay_payments) =>
            configuration_merchant_capabilities_amazon_pay_payments() | nil,
          optional(:au_becs_debit_payments) =>
            configuration_merchant_capabilities_au_becs_debit_payments() | nil,
          optional(:bacs_debit_payments) =>
            configuration_merchant_capabilities_bacs_debit_payments() | nil,
          optional(:bancontact_payments) =>
            configuration_merchant_capabilities_bancontact_payments() | nil,
          optional(:blik_payments) => configuration_merchant_capabilities_blik_payments() | nil,
          optional(:boleto_payments) =>
            configuration_merchant_capabilities_boleto_payments() | nil,
          optional(:card_payments) => configuration_merchant_capabilities_card_payments() | nil,
          optional(:cartes_bancaires_payments) =>
            configuration_merchant_capabilities_cartes_bancaires_payments() | nil,
          optional(:cashapp_payments) =>
            configuration_merchant_capabilities_cashapp_payments() | nil,
          optional(:eps_payments) => configuration_merchant_capabilities_eps_payments() | nil,
          optional(:fpx_payments) => configuration_merchant_capabilities_fpx_payments() | nil,
          optional(:gb_bank_transfer_payments) =>
            configuration_merchant_capabilities_gb_bank_transfer_payments() | nil,
          optional(:grabpay_payments) =>
            configuration_merchant_capabilities_grabpay_payments() | nil,
          optional(:ideal_payments) => configuration_merchant_capabilities_ideal_payments() | nil,
          optional(:jcb_payments) => configuration_merchant_capabilities_jcb_payments() | nil,
          optional(:jp_bank_transfer_payments) =>
            configuration_merchant_capabilities_jp_bank_transfer_payments() | nil,
          optional(:kakao_pay_payments) =>
            configuration_merchant_capabilities_kakao_pay_payments() | nil,
          optional(:klarna_payments) =>
            configuration_merchant_capabilities_klarna_payments() | nil,
          optional(:konbini_payments) =>
            configuration_merchant_capabilities_konbini_payments() | nil,
          optional(:kr_card_payments) =>
            configuration_merchant_capabilities_kr_card_payments() | nil,
          optional(:link_payments) => configuration_merchant_capabilities_link_payments() | nil,
          optional(:mobilepay_payments) =>
            configuration_merchant_capabilities_mobilepay_payments() | nil,
          optional(:multibanco_payments) =>
            configuration_merchant_capabilities_multibanco_payments() | nil,
          optional(:mx_bank_transfer_payments) =>
            configuration_merchant_capabilities_mx_bank_transfer_payments() | nil,
          optional(:naver_pay_payments) =>
            configuration_merchant_capabilities_naver_pay_payments() | nil,
          optional(:oxxo_payments) => configuration_merchant_capabilities_oxxo_payments() | nil,
          optional(:p24_payments) => configuration_merchant_capabilities_p24_payments() | nil,
          optional(:pay_by_bank_payments) =>
            configuration_merchant_capabilities_pay_by_bank_payments() | nil,
          optional(:payco_payments) => configuration_merchant_capabilities_payco_payments() | nil,
          optional(:paynow_payments) =>
            configuration_merchant_capabilities_paynow_payments() | nil,
          optional(:promptpay_payments) =>
            configuration_merchant_capabilities_promptpay_payments() | nil,
          optional(:revolut_pay_payments) =>
            configuration_merchant_capabilities_revolut_pay_payments() | nil,
          optional(:samsung_pay_payments) =>
            configuration_merchant_capabilities_samsung_pay_payments() | nil,
          optional(:sepa_bank_transfer_payments) =>
            configuration_merchant_capabilities_sepa_bank_transfer_payments() | nil,
          optional(:sepa_debit_payments) =>
            configuration_merchant_capabilities_sepa_debit_payments() | nil,
          optional(:stripe_balance) => configuration_merchant_capabilities_stripe_balance() | nil,
          optional(:swish_payments) => configuration_merchant_capabilities_swish_payments() | nil,
          optional(:twint_payments) => configuration_merchant_capabilities_twint_payments() | nil,
          optional(:us_bank_transfer_payments) =>
            configuration_merchant_capabilities_us_bank_transfer_payments() | nil,
          optional(:zip_payments) => configuration_merchant_capabilities_zip_payments() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_ach_debit_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_ach_debit_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_ach_debit_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_acss_debit_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_acss_debit_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_acss_debit_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_affirm_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_affirm_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_affirm_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_afterpay_clearpay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_afterpay_clearpay_payments_status_details()]
            | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_afterpay_clearpay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_alma_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_alma_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_alma_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_amazon_pay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_amazon_pay_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_amazon_pay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_au_becs_debit_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_au_becs_debit_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_au_becs_debit_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_bacs_debit_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_bacs_debit_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_bacs_debit_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_bancontact_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_bancontact_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_bancontact_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_blik_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_blik_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_blik_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_boleto_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_boleto_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_boleto_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_card_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_card_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_card_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_cartes_bancaires_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_cartes_bancaires_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_cartes_bancaires_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_cashapp_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_cashapp_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_cashapp_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_eps_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_eps_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_eps_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_fpx_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_fpx_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_fpx_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_gb_bank_transfer_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_gb_bank_transfer_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_gb_bank_transfer_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_grabpay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_grabpay_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_grabpay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_ideal_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_ideal_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_ideal_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_jcb_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_jcb_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_jcb_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_jp_bank_transfer_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_jp_bank_transfer_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_jp_bank_transfer_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_kakao_pay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_kakao_pay_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_kakao_pay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_klarna_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_klarna_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_klarna_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_konbini_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_konbini_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_konbini_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_kr_card_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_kr_card_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_kr_card_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_link_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_link_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_link_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_mobilepay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_mobilepay_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_mobilepay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_multibanco_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_multibanco_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_multibanco_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_mx_bank_transfer_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_mx_bank_transfer_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_mx_bank_transfer_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_naver_pay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_naver_pay_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_naver_pay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_oxxo_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_oxxo_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_oxxo_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_p24_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_p24_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_p24_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_pay_by_bank_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_pay_by_bank_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_pay_by_bank_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_payco_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_payco_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_payco_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_paynow_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_paynow_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_paynow_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_promptpay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_promptpay_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_promptpay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_revolut_pay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_revolut_pay_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_revolut_pay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_samsung_pay_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_samsung_pay_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_samsung_pay_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_sepa_bank_transfer_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_sepa_bank_transfer_payments_status_details()]
            | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_sepa_bank_transfer_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_sepa_debit_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_sepa_debit_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_sepa_debit_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payouts` - Enables this Account to complete payouts from their Stripe Balance (/v1/balance).
  """
  @type configuration_merchant_capabilities_stripe_balance :: %{
          optional(:payouts) =>
            configuration_merchant_capabilities_stripe_balance_payouts() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_stripe_balance_payouts :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_stripe_balance_payouts_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_stripe_balance_payouts_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_swish_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_swish_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_swish_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_twint_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_twint_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_twint_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_us_bank_transfer_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_us_bank_transfer_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_us_bank_transfer_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_merchant_capabilities_zip_payments :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_merchant_capabilities_zip_payments_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_merchant_capabilities_zip_payments_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `decline_on` - Automatically declines certain charge types regardless of whether the card issuer accepted or declined the charge.
  """
  @type configuration_merchant_card_payments :: %{
          optional(:decline_on) => configuration_merchant_card_payments_decline_on() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `avs_failure` - Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This setting only applies when a ZIP or postal code is provided and they fail bank verification.
  * `cvc_failure` - Whether Stripe automatically declines charges with an incorrect CVC. This setting only applies when a CVC is provided and it fails bank verification.
  """
  @type configuration_merchant_card_payments_decline_on :: %{
          optional(:avs_failure) => boolean() | nil,
          optional(:cvc_failure) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `support` - Support for Konbini payments.
  """
  @type configuration_merchant_konbini_payments :: %{
          optional(:support) => configuration_merchant_konbini_payments_support() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `email` - Support email address for Konbini payments.
  * `hours` - Support hours for Konbini payments.
  * `phone` - Support phone number for Konbini payments.
  """
  @type configuration_merchant_konbini_payments_support :: %{
          optional(:email) => String.t() | nil,
          optional(:hours) => configuration_merchant_konbini_payments_support_hours() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end_time` - Support hours end time (JST time of day) for in `HH:MM` format.
  * `start_time` - Support hours start time (JST time of day) for in `HH:MM` format.
  """
  @type configuration_merchant_konbini_payments_support_hours :: %{
          optional(:end_time) => String.t() | nil,
          optional(:start_time) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - The Kana variation of statement_descriptor used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors).
  * `kanji` - The Kanji variation of statement_descriptor used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors).
  """
  @type configuration_merchant_script_statement_descriptor :: %{
          optional(:kana) => configuration_merchant_script_statement_descriptor_kana() | nil,
          optional(:kanji) => configuration_merchant_script_statement_descriptor_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `descriptor` - The default text that appears on statements for non-card charges outside of Japan. For card charges, if you don’t set a statement_descriptor_prefix, this text is also used as the statement descriptor prefix. In that case, if concatenating the statement descriptor suffix causes the combined statement descriptor to exceed 22 characters, we truncate the statement_descriptor text to limit the full descriptor to 22 characters. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
  * `prefix` - Default text that appears on statements for card charges outside of Japan, prefixing any dynamic statement_descriptor_suffix specified on the charge. To maximize space for the dynamic part of the descriptor, keep this text short. If you don’t specify this value, statement_descriptor is used as the prefix. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
  """
  @type configuration_merchant_script_statement_descriptor_kana :: %{
          optional(:descriptor) => String.t() | nil,
          optional(:prefix) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `descriptor` - The default text that appears on statements for non-card charges outside of Japan. For card charges, if you don’t set a statement_descriptor_prefix, this text is also used as the statement descriptor prefix. In that case, if concatenating the statement descriptor suffix causes the combined statement descriptor to exceed 22 characters, we truncate the statement_descriptor text to limit the full descriptor to 22 characters. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
  * `prefix` - Default text that appears on statements for card charges outside of Japan, prefixing any dynamic statement_descriptor_suffix specified on the charge. To maximize space for the dynamic part of the descriptor, keep this text short. If you don’t specify this value, statement_descriptor is used as the prefix. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
  """
  @type configuration_merchant_script_statement_descriptor_kanji :: %{
          optional(:descriptor) => String.t() | nil,
          optional(:prefix) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `creditor_id` - Creditor ID for SEPA Direct Debit payments.
  """
  @type configuration_merchant_sepa_debit_payments :: %{
          optional(:creditor_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `descriptor` - The default text that appears on statements for non-card charges outside of Japan. For card charges, if you don’t set a statement_descriptor_prefix, this text is also used as the statement descriptor prefix. In that case, if concatenating the statement descriptor suffix causes the combined statement descriptor to exceed 22 characters, we truncate the statement_descriptor text to limit the full descriptor to 22 characters. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
  * `prefix` - Default text that appears on statements for card charges outside of Japan, prefixing any dynamic statement_descriptor_suffix specified on the charge. To maximize space for the dynamic part of the descriptor, keep this text short. If you don’t specify this value, statement_descriptor is used as the prefix. For more information about statement descriptors and their requirements, see the Merchant Configuration settings documentation.
  """
  @type configuration_merchant_statement_descriptor :: %{
          optional(:descriptor) => String.t() | nil,
          optional(:prefix) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - A publicly available mailing address for sending support issues to.
  * `email` - A publicly available email address for sending support issues to.
  * `phone` - A publicly available phone number to call with support issues.
  * `url` - A publicly available website for handling support issues.
  """
  @type configuration_merchant_support :: %{
          optional(:address) => configuration_merchant_support_address() | nil,
          optional(:email) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type configuration_merchant_support_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `applied` - Indicates whether the recipient configuration is active. You can deactivate or reactivate the recipient configuration by updating this property. Deactivating the configuration by setting this value to false unrequest all capabilities within the configuration. It will not delete any of the configuration's other properties.
  * `capabilities` - Capabilities that have been requested on the Recipient Configuration.
  """
  @type configuration_recipient :: %{
          optional(:applied) => boolean() | nil,
          optional(:capabilities) => configuration_recipient_capabilities() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `stripe_balance` - Capabilities that enable the recipient to manage their Stripe Balance (/v1/balance).
  """
  @type configuration_recipient_capabilities :: %{
          optional(:stripe_balance) =>
            configuration_recipient_capabilities_stripe_balance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payouts` - Enables this Account to complete payouts from their Stripe Balance (/v1/balance).
  * `stripe_transfers` - Enables this Account to receive /v1/transfers into their Stripe Balance (/v1/balance).
  """
  @type configuration_recipient_capabilities_stripe_balance :: %{
          optional(:payouts) =>
            configuration_recipient_capabilities_stripe_balance_payouts() | nil,
          optional(:stripe_transfers) =>
            configuration_recipient_capabilities_stripe_balance_stripe_transfers() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_recipient_capabilities_stripe_balance_payouts :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [configuration_recipient_capabilities_stripe_balance_payouts_status_details()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_recipient_capabilities_stripe_balance_payouts_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The status of the Capability. Possible values: `active`, `pending`, `restricted`, `unsupported`.
  * `status_details` - Additional details about the capability's status. This value is empty when `status` is `active`.
  """
  @type configuration_recipient_capabilities_stripe_balance_stripe_transfers :: %{
          optional(:status) => String.t() | nil,
          optional(:status_details) =>
            [
              configuration_recipient_capabilities_stripe_balance_stripe_transfers_status_details()
            ]
            | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code explaining the reason for the Capability to be in its current status. Possible values: `determining_status`, `requirements_past_due`, `requirements_pending_verification`, `restricted_other`, `unsupported_business`, `unsupported_country`, `unsupported_entity_type`.
  * `resolution` - Machine-readable code explaining how to make the Capability active. Possible values: `contact_stripe`, `no_resolution`, `provide_info`.
  """
  @type configuration_recipient_capabilities_stripe_balance_stripe_transfers_status_details :: %{
          optional(:code) => String.t() | nil,
          optional(:resolution) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
  * `locales` - The Account's preferred locales (languages), ordered by preference.
  * `profile` - Account profile information.
  * `responsibilities` - Default responsibilities held by either Stripe or the platform.
  """
  @type defaults :: %{
          optional(:currency) => String.t() | nil,
          optional(:locales) => [String.t()] | nil,
          optional(:profile) => defaults_profile() | nil,
          optional(:responsibilities) => defaults_responsibilities() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `business_url` - The business's publicly-available website.
  * `doing_business_as` - The customer-facing business name.
  * `product_description` - Internal-only description of the product sold or service provided by the business. It's used by Stripe for risk and underwriting purposes.
  """
  @type defaults_profile :: %{
          optional(:business_url) => String.t() | nil,
          optional(:doing_business_as) => String.t() | nil,
          optional(:product_description) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fees_collector` - Indicates whether the platform or connected account is responsible for paying Stripe fees for pricing-control-eligible products. Possible values: `application`, `application_custom`, `application_express`, `stripe`.
  * `losses_collector` - A value indicating responsibility for collecting requirements on this account. Possible values: `application`, `stripe`.
  * `requirements_collector` - A value indicating responsibility for collecting requirements on this account. Possible values: `application`, `stripe`.
  """
  @type defaults_responsibilities :: %{
          optional(:fees_collector) => String.t() | nil,
          optional(:losses_collector) => String.t() | nil,
          optional(:requirements_collector) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `entries` - A list of requirements for the Account.
  * `minimum_transition_date` - The time at which the future requirements become effective. Format: date-time.
  * `summary` - An object containing an overview of requirements for the Account.
  """
  @type future_requirements :: %{
          optional(:entries) => [future_requirements_entries()] | nil,
          optional(:minimum_transition_date) => String.t() | nil,
          optional(:summary) => future_requirements_summary() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `awaiting_action_from` - Indicates whether the platform or Stripe is currently responsible for taking action on the requirement. Value can be `user` or `stripe`. Possible values: `stripe`, `user`.
  * `description` - Machine-readable string describing the requirement.
  * `errors` - Descriptions of why the requirement must be collected, or why the collected information isn't satisfactory to Stripe.
  * `impact` - A hash describing the impact of not collecting the requirement, or Stripe not being able to verify the collected information.
  * `minimum_deadline` - The soonest point when the account will be impacted by not providing the requirement.
  * `reference` - A reference to the location of the requirement.
  * `requested_reasons` - A list of reasons why Stripe is collecting the requirement.
  """
  @type future_requirements_entries :: %{
          optional(:awaiting_action_from) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:errors) => [future_requirements_entries_errors()] | nil,
          optional(:impact) => future_requirements_entries_impact() | nil,
          optional(:minimum_deadline) => future_requirements_entries_minimum_deadline() | nil,
          optional(:reference) => future_requirements_entries_reference() | nil,
          optional(:requested_reasons) => [future_requirements_entries_requested_reasons()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code describing the error. Possible values: `invalid_address_city_state_postal_code`, `invalid_address_highway_contract_box`, `invalid_address_private_mailbox`, `invalid_business_profile_name`, `invalid_business_profile_name_denylisted`, `invalid_company_name_denylisted`, `invalid_dob_age_over_maximum`, `invalid_dob_age_under_18`, `invalid_dob_age_under_minimum`, `invalid_product_description_length`, `invalid_product_description_url_match`, `invalid_representative_country`, `invalid_statement_descriptor_business_mismatch`, `invalid_statement_descriptor_denylisted`, `invalid_statement_descriptor_length`, `invalid_statement_descriptor_prefix_denylisted`, `invalid_statement_descriptor_prefix_mismatch`, `invalid_street_address`, `invalid_tax_id`, `invalid_tax_id_format`, `invalid_tos_acceptance`, `invalid_url_denylisted`, `invalid_url_format`, `invalid_url_website_business_information_mismatch`, `invalid_url_website_empty`, `invalid_url_website_inaccessible`, `invalid_url_website_inaccessible_geoblocked`, `invalid_url_website_inaccessible_password_protected`, `invalid_url_website_incomplete`, `invalid_url_website_incomplete_cancellation_policy`, `invalid_url_website_incomplete_customer_service_details`, `invalid_url_website_incomplete_legal_restrictions`, `invalid_url_website_incomplete_refund_policy`, `invalid_url_website_incomplete_return_policy`, `invalid_url_website_incomplete_terms_and_conditions`, `invalid_url_website_incomplete_under_construction`, `invalid_url_website_other`, `invalid_url_web_presence_detected`, `invalid_value_other`, `unresolvable_ip_address`, `unresolvable_postal_code`, `verification_directors_mismatch`, `verification_document_address_mismatch`, `verification_document_address_missing`, `verification_document_corrupt`, `verification_document_country_not_supported`, `verification_document_directors_mismatch`, `verification_document_dob_mismatch`, `verification_document_duplicate_type`, `verification_document_expired`, `verification_document_failed_copy`, `verification_document_failed_greyscale`, `verification_document_failed_other`, `verification_document_failed_test_mode`, `verification_document_fraudulent`, `verification_document_id_number_mismatch`, `verification_document_id_number_missing`, `verification_document_incomplete`, `verification_document_invalid`, `verification_document_issue_or_expiry_date_missing`, `verification_document_manipulated`, `verification_document_missing_back`, `verification_document_missing_front`, `verification_document_name_mismatch`, `verification_document_name_missing`, `verification_document_nationality_mismatch`, `verification_document_not_readable`, `verification_document_not_signed`, `verification_document_not_uploaded`, `verification_document_photo_mismatch`, `verification_document_too_large`, `verification_document_type_not_supported`, `verification_extraneous_directors`, `verification_failed_address_match`, `verification_failed_business_iec_number`, `verification_failed_document_match`, `verification_failed_id_number_match`, `verification_failed_keyed_identity`, `verification_failed_keyed_match`, `verification_failed_name_match`, `verification_failed_other`, `verification_failed_representative_authority`, `verification_failed_residential_address`, `verification_failed_tax_id_match`, `verification_failed_tax_id_not_issued`, `verification_missing_directors`, `verification_missing_executives`, `verification_missing_owners`, `verification_requires_additional_memorandum_of_associations`, `verification_requires_additional_proof_of_registration`, `verification_selfie_document_missing_photo`, `verification_selfie_face_mismatch`, `verification_selfie_manipulated`, `verification_selfie_unverified_other`, `verification_supportability`, `verification_token_stale`.
  * `description` - Human-readable description of the error.
  """
  @type future_requirements_entries_errors :: %{
          optional(:code) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `restricts_capabilities` - The Capabilities that will be restricted if the requirement is not collected and satisfactory to Stripe.
  """
  @type future_requirements_entries_impact :: %{
          optional(:restricts_capabilities) =>
            [future_requirements_entries_impact_restricts_capabilities()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capability` - The name of the Capability which will be restricted. Possible values: `ach_debit_payments`, `acss_debit_payments`, `affirm_payments`, `afterpay_clearpay_payments`, `alma_payments`, `amazon_pay_payments`, `automatic_indirect_tax`, `au_becs_debit_payments`, `bacs_debit_payments`, `bancontact_payments`, `bank_accounts.local`, `bank_accounts.wire`, `blik_payments`, `boleto_payments`, `cards`, `card_payments`, `cartes_bancaires_payments`, `cashapp_payments`, `eps_payments`, `fpx_payments`, `gb_bank_transfer_payments`, `grabpay_payments`, `ideal_payments`, `jcb_payments`, `jp_bank_transfer_payments`, `kakao_pay_payments`, `klarna_payments`, `konbini_payments`, `kr_card_payments`, `link_payments`, `mobilepay_payments`, `multibanco_payments`, `mx_bank_transfer_payments`, `naver_pay_payments`, `oxxo_payments`, `p24_payments`, `payco_payments`, `paynow_payments`, `pay_by_bank_payments`, `promptpay_payments`, `revolut_pay_payments`, `samsung_pay_payments`, `sepa_bank_transfer_payments`, `sepa_debit_payments`, `stripe_balance.payouts`, `stripe_balance.stripe_transfers`, `swish_payments`, `twint_payments`, `us_bank_transfer_payments`, `zip_payments`.
  * `configuration` - The configuration which specifies the Capability which will be restricted. Possible values: `customer`, `merchant`, `recipient`.
  * `deadline` - Details about when in the account lifecycle the requirement must be collected by the avoid the Capability restriction.
  """
  @type future_requirements_entries_impact_restricts_capabilities :: %{
          optional(:capability) => String.t() | nil,
          optional(:configuration) => String.t() | nil,
          optional(:deadline) =>
            future_requirements_entries_impact_restricts_capabilities_deadline() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The current status of the requirement's impact. Possible values: `currently_due`, `eventually_due`, `past_due`.
  """
  @type future_requirements_entries_impact_restricts_capabilities_deadline :: %{
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The current status of the requirement's impact. Possible values: `currently_due`, `eventually_due`, `past_due`.
  """
  @type future_requirements_entries_minimum_deadline :: %{
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `inquiry` - If `inquiry` is the type, the inquiry token.
  * `resource` - If `resource` is the type, the resource token.
  * `type` - The type of the reference. If the type is "inquiry", the inquiry token can be found in the "inquiry" field.
  Otherwise the type is an API resource, the token for which can be found in the "resource" field. Possible values: `inquiry`, `payment_method`, `person`.
  """
  @type future_requirements_entries_reference :: %{
          optional(:inquiry) => String.t() | nil,
          optional(:resource) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable description of Stripe's reason for collecting the requirement. Possible values: `routine_onboarding`, `routine_verification`.
  """
  @type future_requirements_entries_requested_reasons :: %{
          optional(:code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `minimum_deadline` - The soonest date and time a requirement on the Account will become `past due`. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: `2022-09-18T13:22:18.123Z`.
  """
  @type future_requirements_summary :: %{
          optional(:minimum_deadline) => future_requirements_summary_minimum_deadline() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The current strictest status of all requirements on the Account. Possible values: `currently_due`, `eventually_due`, `past_due`.
  * `time` - The soonest RFC3339 date & time UTC value a requirement can impact the Account. Format: date-time.
  """
  @type future_requirements_summary_minimum_deadline :: %{
          optional(:status) => String.t() | nil,
          optional(:time) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `attestations` - Attestations from the identity's key people, e.g. owners, executives, directors, representatives.
  * `business_details` - Information about the company or business.
  * `country` - The country in which the account holder resides, or in which the business is legally established. This should be an [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) country code.
  * `entity_type` - The entity type. Possible values: `company`, `government_entity`, `individual`, `non_profit`.
  * `individual` - Information about the individual represented by the Account. This property is `null` unless `entity_type` is set to `individual`.
  """
  @type identity :: %{
          optional(:attestations) => identity_attestations() | nil,
          optional(:business_details) => identity_business_details() | nil,
          optional(:country) => String.t() | nil,
          optional(:entity_type) => String.t() | nil,
          optional(:individual) => identity_individual() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `directorship_declaration` - This hash is used to attest that the directors information provided to Stripe is both current and correct.
  * `ownership_declaration` - This hash is used to attest that the beneficial owner information provided to Stripe is both current and correct.
  * `persons_provided` - Attestation that all Persons with a specific Relationship value have been provided.
  * `representative_declaration` - This hash is used to attest that the representative is authorized to act as the representative of their legal entity.
  * `terms_of_service` - Attestations of accepted terms of service agreements.
  """
  @type identity_attestations :: %{
          optional(:directorship_declaration) =>
            identity_attestations_directorship_declaration() | nil,
          optional(:ownership_declaration) => identity_attestations_ownership_declaration() | nil,
          optional(:persons_provided) => identity_attestations_persons_provided() | nil,
          optional(:representative_declaration) =>
            identity_attestations_representative_declaration() | nil,
          optional(:terms_of_service) => identity_attestations_terms_of_service() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The time marking when the director attestation was made. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `ip` - The IP address from which the director attestation was made.
  * `user_agent` - The user agent of the browser from which the director attestation was made.
  """
  @type identity_attestations_directorship_declaration :: %{
          optional(:date) => String.t() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The time marking when the beneficial owner attestation was made. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `ip` - The IP address from which the beneficial owner attestation was made.
  * `user_agent` - The user agent of the browser from which the beneficial owner attestation was made.
  """
  @type identity_attestations_ownership_declaration :: %{
          optional(:date) => String.t() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `directors` - Whether the company’s directors have been provided. Set this Boolean to true after creating all the company’s directors with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
  * `executives` - Whether the company’s executives have been provided. Set this Boolean to true after creating all the company’s executives with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
  * `owners` - Whether the company’s owners have been provided. Set this Boolean to true after creating all the company’s owners with the [Persons API](https://docs.stripe.com/api/v2/core/accounts/createperson).
  * `ownership_exemption_reason` - Reason for why the company is exempt from providing ownership information. Possible values: `qualified_entity_exceeds_ownership_threshold`, `qualifies_as_financial_institution`.
  """
  @type identity_attestations_persons_provided :: %{
          optional(:directors) => boolean() | nil,
          optional(:executives) => boolean() | nil,
          optional(:owners) => boolean() | nil,
          optional(:ownership_exemption_reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The time marking when the representative attestation was made. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `ip` - The IP address from which the representative attestation was made.
  * `user_agent` - The user agent of the browser from which the representative attestation was made.
  """
  @type identity_attestations_representative_declaration :: %{
          optional(:date) => String.t() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - Details on the Account's acceptance of the [Stripe Services Agreement](https://docs.stripe.com/connect/updating-accounts#tos-acceptance).
  """
  @type identity_attestations_terms_of_service :: %{
          optional(:account) => identity_attestations_terms_of_service_account() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The time when the Account's representative accepted the terms of service. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `ip` - The IP address from which the Account's representative accepted the terms of service.
  * `user_agent` - The user agent of the browser from which the Account's representative accepted the terms of service.
  """
  @type identity_attestations_terms_of_service_account :: %{
          optional(:date) => String.t() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The company’s primary address.
  * `annual_revenue` - The business gross annual revenue for its preceding fiscal year.
  * `documents` - Documents that may be submitted to satisfy various informational requests.
  * `estimated_worker_count` - Estimated maximum number of workers currently engaged by the business (including employees, contractors, and vendors).
  * `id_numbers` - The provided ID numbers of a business entity.
  * `monthly_estimated_revenue` - An estimate of the monthly revenue of the business. Only accepted for accounts in Brazil and India.
  * `phone` - The company’s phone number (used for verification).
  * `registered_name` - The business legal name.
  * `registration_date` - When the business was incorporated or registered.
  * `script_addresses` - The business registration address of the business entity in non latin script.
  * `script_names` - The business legal name in non latin script.
  * `structure` - The category identifying the legal structure of the business. Possible values: `cooperative`, `free_zone_establishment`, `free_zone_llc`, `governmental_unit`, `government_instrumentality`, `incorporated_association`, `incorporated_non_profit`, `incorporated_partnership`, `limited_liability_partnership`, `llc`, `multi_member_llc`, `private_company`, `private_corporation`, `private_partnership`, `public_company`, `public_corporation`, `public_listed_corporation`, `public_partnership`, `registered_charity`, `single_member_llc`, `sole_establishment`, `sole_proprietorship`, `tax_exempt_government_instrumentality`, `trust`, `unincorporated_association`, `unincorporated_non_profit`, `unincorporated_partnership`.
  """
  @type identity_business_details :: %{
          optional(:address) => identity_business_details_address() | nil,
          optional(:annual_revenue) => identity_business_details_annual_revenue() | nil,
          optional(:documents) => identity_business_details_documents() | nil,
          optional(:estimated_worker_count) => integer() | nil,
          optional(:id_numbers) => [identity_business_details_id_numbers()] | nil,
          optional(:monthly_estimated_revenue) =>
            identity_business_details_monthly_estimated_revenue() | nil,
          optional(:phone) => String.t() | nil,
          optional(:registered_name) => String.t() | nil,
          optional(:registration_date) => identity_business_details_registration_date() | nil,
          optional(:script_addresses) => identity_business_details_script_addresses() | nil,
          optional(:script_names) => identity_business_details_script_names() | nil,
          optional(:structure) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type identity_business_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Annual revenue amount in minor currency units (for example, '123' for 1.23 USD).
  * `fiscal_year_end` - The close-out date of the preceding fiscal year in ISO 8601 format. E.g. 2023-12-31 for the 31st of December, 2023.
  """
  @type identity_business_details_annual_revenue :: %{
          optional(:amount) => identity_business_details_annual_revenue_amount() | nil,
          optional(:fiscal_year_end) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
  * `value` - A non-negative integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  """
  @type identity_business_details_annual_revenue_amount :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account_ownership_verification` - One or more documents that support the Bank account ownership verification requirement. Must be a document associated with the account’s primary active bank account that displays the last 4 digits of the account number, either a statement or a check.
  * `company_license` - One or more documents that demonstrate proof of a company’s license to operate.
  * `company_memorandum_of_association` - One or more documents showing the company’s Memorandum of Association.
  * `company_ministerial_decree` - Certain countries only: One or more documents showing the ministerial decree legalizing the company’s establishment.
  * `company_registration_verification` - One or more documents that demonstrate proof of a company’s registration with the appropriate local authorities.
  * `company_tax_id_verification` - One or more documents that demonstrate proof of a company’s tax ID.
  * `primary_verification` - A document verifying the business.
  * `proof_of_address` - One or more documents that demonstrate proof of address.
  * `proof_of_registration` - One or more documents showing the company’s proof of registration with the national business registry.
  * `proof_of_ultimate_beneficial_ownership` - One or more documents that demonstrate proof of ultimate beneficial ownership.
  """
  @type identity_business_details_documents :: %{
          optional(:bank_account_ownership_verification) =>
            identity_business_details_documents_bank_account_ownership_verification() | nil,
          optional(:company_license) =>
            identity_business_details_documents_company_license() | nil,
          optional(:company_memorandum_of_association) =>
            identity_business_details_documents_company_memorandum_of_association() | nil,
          optional(:company_ministerial_decree) =>
            identity_business_details_documents_company_ministerial_decree() | nil,
          optional(:company_registration_verification) =>
            identity_business_details_documents_company_registration_verification() | nil,
          optional(:company_tax_id_verification) =>
            identity_business_details_documents_company_tax_id_verification() | nil,
          optional(:primary_verification) =>
            identity_business_details_documents_primary_verification() | nil,
          optional(:proof_of_address) =>
            identity_business_details_documents_proof_of_address() | nil,
          optional(:proof_of_registration) =>
            identity_business_details_documents_proof_of_registration() | nil,
          optional(:proof_of_ultimate_beneficial_ownership) =>
            identity_business_details_documents_proof_of_ultimate_beneficial_ownership() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_bank_account_ownership_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_license :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_memorandum_of_association :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_ministerial_decree :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_registration_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_company_tax_id_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens for the front and back of the verification document.
  * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
  """
  @type identity_business_details_documents_primary_verification :: %{
          optional(:front_back) =>
            identity_business_details_documents_primary_verification_front_back() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  """
  @type identity_business_details_documents_primary_verification_front_back :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_proof_of_address :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_proof_of_registration :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_business_details_documents_proof_of_ultimate_beneficial_ownership :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `registrar` - The registrar of the ID number (Only valid for DE ID number types).
  * `type` - Open Enum. The ID number type of a business entity. Possible values: `ae_crn`, `ae_vat`, `ao_nif`, `ar_cuit`, `at_fn`, `at_stn`, `at_vat`, `au_abn`, `au_acn`, `au_in`, `az_tin`, `bd_etin`, `be_cbe`, `be_vat`, `bg_uic`, `bg_vat`, `br_cnpj`, `ca_cn`, `ca_crarr`, `ca_gst_hst`, `ca_neq`, `ca_rid`, `ch_chid`, `ch_uid`, `cr_cpj`, `cr_nite`, `cy_he`, `cy_tic`, `cy_vat`, `cz_ico`, `cz_vat`, `de_hrn`, `de_stn`, `de_vat`, `dk_cvr`, `dk_vat`, `do_rcn`, `ee_rk`, `ee_vat`, `es_cif`, `es_vat`, `fi_vat`, `fi_yt`, `fr_rna`, `fr_siren`, `fr_vat`, `gb_crn`, `gb_vat`, `gi_crn`, `gr_afm`, `gr_gemi`, `gr_vat`, `gt_nit`, `hk_br`, `hk_cr`, `hr_mbs`, `hr_oib`, `hr_vat`, `hu_cjs`, `hu_tin`, `hu_vat`, `ie_crn`, `ie_trn`, `ie_vat`, `it_rea`, `it_vat`, `jp_cn`, `kz_bin`, `li_uid`, `lt_ccrn`, `lt_vat`, `lu_nif`, `lu_rcs`, `lu_vat`, `lv_urn`, `lv_vat`, `mt_crn`, `mt_tin`, `mt_vat`, `mx_rfc`, `my_brn`, `my_coid`, `my_itn`, `my_sst`, `mz_nuit`, `nl_kvk`, `nl_rsin`, `nl_vat`, `no_orgnr`, `nz_bn`, `nz_ird`, `pe_ruc`, `pk_ntn`, `pl_nip`, `pl_regon`, `pl_vat`, `pt_vat`, `ro_cui`, `ro_orc`, `ro_vat`, `sa_crn`, `sa_tin`, `se_orgnr`, `se_vat`, `sg_uen`, `si_msp`, `si_tin`, `si_vat`, `sk_dic`, `sk_ico`, `sk_vat`, `th_crn`, `th_prn`, `th_tin`, `us_ein`.
  """
  @type identity_business_details_id_numbers :: %{
          optional(:registrar) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Estimated monthly revenue amount in minor currency units (for example, '123' for 1.23 USD).
  """
  @type identity_business_details_monthly_estimated_revenue :: %{
          optional(:amount) => identity_business_details_monthly_estimated_revenue_amount() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
  * `value` - A non-negative integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  """
  @type identity_business_details_monthly_estimated_revenue_amount :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - The day of registration, between 1 and 31.
  * `month` - The month of registration, between 1 and 12.
  * `year` - The four-digit year of registration.
  """
  @type identity_business_details_registration_date :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - Kana Address.
  * `kanji` - Kanji Address.
  """
  @type identity_business_details_script_addresses :: %{
          optional(:kana) => identity_business_details_script_addresses_kana() | nil,
          optional(:kanji) => identity_business_details_script_addresses_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type identity_business_details_script_addresses_kana :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type identity_business_details_script_addresses_kanji :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - Kana name.
  * `kanji` - Kanji name.
  """
  @type identity_business_details_script_names :: %{
          optional(:kana) => identity_business_details_script_names_kana() | nil,
          optional(:kanji) => identity_business_details_script_names_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `registered_name` - Registered name of the business.
  """
  @type identity_business_details_script_names_kana :: %{
          optional(:registered_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `registered_name` - Registered name of the business.
  """
  @type identity_business_details_script_names_kanji :: %{
          optional(:registered_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - The account ID which the individual belongs to.
  * `additional_addresses` - Additional addresses associated with the individual.
  * `additional_names` - Additional names (e.g. aliases) associated with the individual.
  * `additional_terms_of_service` - Terms of service acceptances.
  * `address` - The individual's residential address.
  * `created` - Time at which the object was created. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `date_of_birth` - The individual's date of birth.
  * `documents` - Documents that may be submitted to satisfy various informational requests.
  * `email` - The individual's email address.
  * `given_name` - The individual's first name.
  * `id` - Unique identifier for the object.
  * `id_numbers` - The identification numbers (e.g., SSN) associated with the individual.
  * `legal_gender` - The individual's gender (International regulations require either "male” or "female"). Possible values: `female`, `male`.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `nationalities` - The countries where the individual is a national. Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `object` - String representing the object's type. Objects of the same type share the same value.
  * `phone` - The individual's phone number.
  * `political_exposure` - Indicates if the individual or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction. Possible values: `existing`, `none`.
  * `relationship` - The relationship that this individual has with the Account's identity.
  * `script_addresses` - The script addresses (e.g., non-Latin characters) associated with the individual.
  * `script_names` - The script names (e.g. non-Latin characters) associated with the individual.
  * `surname` - The individual's last name.
  * `updated` - Time at which the object was last updated. Format: date-time.
  """
  @type identity_individual :: %{
          optional(:account) => String.t() | nil,
          optional(:additional_addresses) => [identity_individual_additional_addresses()] | nil,
          optional(:additional_names) => [identity_individual_additional_names()] | nil,
          optional(:additional_terms_of_service) =>
            identity_individual_additional_terms_of_service() | nil,
          optional(:address) => identity_individual_address() | nil,
          optional(:created) => String.t() | nil,
          optional(:date_of_birth) => identity_individual_date_of_birth() | nil,
          optional(:documents) => identity_individual_documents() | nil,
          optional(:email) => String.t() | nil,
          optional(:given_name) => String.t() | nil,
          optional(:id) => String.t() | nil,
          optional(:id_numbers) => [identity_individual_id_numbers()] | nil,
          optional(:legal_gender) => String.t() | nil,
          optional(:metadata) => %{String.t() => String.t()} | nil,
          optional(:nationalities) => [String.t()] | nil,
          optional(:object) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(:political_exposure) => String.t() | nil,
          optional(:relationship) => identity_individual_relationship() | nil,
          optional(:script_addresses) => identity_individual_script_addresses() | nil,
          optional(:script_names) => identity_individual_script_names() | nil,
          optional(:surname) => String.t() | nil,
          optional(:updated) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `purpose` - Purpose of additional address. Possible values: `registered`.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type identity_individual_additional_addresses :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:purpose) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `full_name` - The individual's full name.
  * `given_name` - The individual's first or given name.
  * `purpose` - The purpose or type of the additional name. Possible values: `alias`, `maiden`.
  * `surname` - The individual's last or family name.
  """
  @type identity_individual_additional_names :: %{
          optional(:full_name) => String.t() | nil,
          optional(:given_name) => String.t() | nil,
          optional(:purpose) => String.t() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account` - Stripe terms of service agreement.
  """
  @type identity_individual_additional_terms_of_service :: %{
          optional(:account) => identity_individual_additional_terms_of_service_account() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The time when the Account's representative accepted the terms of service. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `ip` - The IP address from which the Account's representative accepted the terms of service.
  * `user_agent` - The user agent of the browser from which the Account's representative accepted the terms of service.
  """
  @type identity_individual_additional_terms_of_service_account :: %{
          optional(:date) => String.t() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type identity_individual_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - The day of birth, between 1 and 31.
  * `month` - The month of birth, between 1 and 12.
  * `year` - The four-digit year of birth.
  """
  @type identity_individual_date_of_birth :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `company_authorization` - One or more documents that demonstrate proof that this person is authorized to represent the company.
  * `passport` - One or more documents showing the person’s passport page with photo and personal data.
  * `primary_verification` - An identifying document showing the person's name, either a passport or local ID card.
  * `secondary_verification` - A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
  * `visa` - One or more documents showing the person’s visa required for living in the country where they are residing.
  """
  @type identity_individual_documents :: %{
          optional(:company_authorization) =>
            identity_individual_documents_company_authorization() | nil,
          optional(:passport) => identity_individual_documents_passport() | nil,
          optional(:primary_verification) =>
            identity_individual_documents_primary_verification() | nil,
          optional(:secondary_verification) =>
            identity_individual_documents_secondary_verification() | nil,
          optional(:visa) => identity_individual_documents_visa() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_individual_documents_company_authorization :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_individual_documents_passport :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens for the front and back of the verification document.
  * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
  """
  @type identity_individual_documents_primary_verification :: %{
          optional(:front_back) =>
            identity_individual_documents_primary_verification_front_back() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  """
  @type identity_individual_documents_primary_verification_front_back :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `front_back` - The [file upload](https://docs.stripe.com/api/persons/update#create_file) tokens for the front and back of the verification document.
  * `type` - The format of the verification document. Currently supports `front_back` only. Possible values: `front_back`.
  """
  @type identity_individual_documents_secondary_verification :: %{
          optional(:front_back) =>
            identity_individual_documents_secondary_verification_front_back() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the back of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  * `front` - A [file upload](https://docs.stripe.com/api/persons/update#create_file) token representing the front of the verification document. The purpose of the uploaded file should be 'identity_document'. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  """
  @type identity_individual_documents_secondary_verification_front_back :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document IDs returned by a [file upload](https://docs.stripe.com/api/persons/update#create_file) with a purpose value of `account_requirement`.
  * `type` - The format of the document. Currently supports `files` only. Possible values: `files`.
  """
  @type identity_individual_documents_visa :: %{
          optional(:files) => [String.t()] | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The ID number type of an individual. Possible values: `ae_eid`, `ao_nif`, `ar_cuil`, `ar_dni`, `at_stn`, `az_tin`, `bd_brc`, `bd_etin`, `bd_nid`, `be_nrn`, `bg_ucn`, `bn_nric`, `br_cpf`, `ca_sin`, `ch_oasi`, `cl_rut`, `cn_pp`, `co_nuip`, `cr_ci`, `cr_cpf`, `cr_dimex`, `cr_nite`, `cy_tic`, `cz_rc`, `de_stn`, `dk_cpr`, `do_cie`, `do_rcn`, `ec_ci`, `ee_ik`, `es_nif`, `fi_hetu`, `fr_nir`, `gb_nino`, `gr_afm`, `gt_nit`, `hk_id`, `hr_oib`, `hu_ad`, `id_nik`, `ie_ppsn`, `is_kt`, `it_cf`, `jp_inc`, `ke_pin`, `kz_iin`, `li_peid`, `lt_ak`, `lu_nif`, `lv_pk`, `mx_rfc`, `my_nric`, `mz_nuit`, `ng_nin`, `nl_bsn`, `no_nin`, `nz_ird`, `pe_dni`, `pk_cnic`, `pk_snic`, `pl_pesel`, `pt_nif`, `ro_cnp`, `sa_tin`, `se_pin`, `sg_fin`, `sg_nric`, `sk_dic`, `th_lc`, `th_pin`, `tr_tin`, `us_itin`, `us_itin_last_4`, `us_ssn`, `us_ssn_last_4`, `uy_dni`, `za_id`.
  """
  @type identity_individual_id_numbers :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `authorizer` - Whether the individual is an authorizer of the Account's identity.
  * `director` - Whether the individual is a director of the Account's identity. Directors are typically members of the governing board of the company or are responsible for making sure that the company meets its regulatory obligations.
  * `executive` - Whether the individual has significant responsibility to control, manage, or direct the organization.
  * `legal_guardian` - Whether the individual is the legal guardian of the Account's representative.
  * `owner` - Whether the individual is an owner of the Account's identity.
  * `percent_ownership` - The percentage of the Account's identity that the individual owns. Format: decimal string.
  * `representative` - Whether the individual is authorized as the primary representative of the Account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.
  * `title` - The individual's title (e.g., CEO, Support Engineer).
  """
  @type identity_individual_relationship :: %{
          optional(:authorizer) => boolean() | nil,
          optional(:director) => boolean() | nil,
          optional(:executive) => boolean() | nil,
          optional(:legal_guardian) => boolean() | nil,
          optional(:owner) => boolean() | nil,
          optional(:percent_ownership) => String.t() | nil,
          optional(:representative) => boolean() | nil,
          optional(:title) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - Kana Address.
  * `kanji` - Kanji Address.
  """
  @type identity_individual_script_addresses :: %{
          optional(:kana) => identity_individual_script_addresses_kana() | nil,
          optional(:kanji) => identity_individual_script_addresses_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type identity_individual_script_addresses_kana :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  * `line1` - Address line 1 (e.g., street, PO Box, or company name).
  * `line2` - Address line 2 (e.g., apartment, suite, unit, or building).
  * `postal_code` - ZIP or postal code.
  * `state` - State, county, province, or region.
  * `town` - Town or district.
  """
  @type identity_individual_script_addresses_kanji :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `kana` - Persons name in kana script.
  * `kanji` - Persons name in kanji script.
  """
  @type identity_individual_script_names :: %{
          optional(:kana) => identity_individual_script_names_kana() | nil,
          optional(:kanji) => identity_individual_script_names_kanji() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `given_name` - The person's first or given name.
  * `surname` - The person's last or family name.
  """
  @type identity_individual_script_names_kana :: %{
          optional(:given_name) => String.t() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `given_name` - The person's first or given name.
  * `surname` - The person's last or family name.
  """
  @type identity_individual_script_names_kanji :: %{
          optional(:given_name) => String.t() | nil,
          optional(:surname) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `entries` - A list of requirements for the Account.
  * `summary` - An object containing an overview of requirements for the Account.
  """
  @type requirements :: %{
          optional(:entries) => [requirements_entries()] | nil,
          optional(:summary) => requirements_summary() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `awaiting_action_from` - Indicates whether the platform or Stripe is currently responsible for taking action on the requirement. Value can be `user` or `stripe`. Possible values: `stripe`, `user`.
  * `description` - Machine-readable string describing the requirement.
  * `errors` - Descriptions of why the requirement must be collected, or why the collected information isn't satisfactory to Stripe.
  * `impact` - A hash describing the impact of not collecting the requirement, or Stripe not being able to verify the collected information.
  * `minimum_deadline` - The soonest point when the account will be impacted by not providing the requirement.
  * `reference` - A reference to the location of the requirement.
  * `requested_reasons` - A list of reasons why Stripe is collecting the requirement.
  """
  @type requirements_entries :: %{
          optional(:awaiting_action_from) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:errors) => [requirements_entries_errors()] | nil,
          optional(:impact) => requirements_entries_impact() | nil,
          optional(:minimum_deadline) => requirements_entries_minimum_deadline() | nil,
          optional(:reference) => requirements_entries_reference() | nil,
          optional(:requested_reasons) => [requirements_entries_requested_reasons()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable code describing the error. Possible values: `invalid_address_city_state_postal_code`, `invalid_address_highway_contract_box`, `invalid_address_private_mailbox`, `invalid_business_profile_name`, `invalid_business_profile_name_denylisted`, `invalid_company_name_denylisted`, `invalid_dob_age_over_maximum`, `invalid_dob_age_under_18`, `invalid_dob_age_under_minimum`, `invalid_product_description_length`, `invalid_product_description_url_match`, `invalid_representative_country`, `invalid_statement_descriptor_business_mismatch`, `invalid_statement_descriptor_denylisted`, `invalid_statement_descriptor_length`, `invalid_statement_descriptor_prefix_denylisted`, `invalid_statement_descriptor_prefix_mismatch`, `invalid_street_address`, `invalid_tax_id`, `invalid_tax_id_format`, `invalid_tos_acceptance`, `invalid_url_denylisted`, `invalid_url_format`, `invalid_url_website_business_information_mismatch`, `invalid_url_website_empty`, `invalid_url_website_inaccessible`, `invalid_url_website_inaccessible_geoblocked`, `invalid_url_website_inaccessible_password_protected`, `invalid_url_website_incomplete`, `invalid_url_website_incomplete_cancellation_policy`, `invalid_url_website_incomplete_customer_service_details`, `invalid_url_website_incomplete_legal_restrictions`, `invalid_url_website_incomplete_refund_policy`, `invalid_url_website_incomplete_return_policy`, `invalid_url_website_incomplete_terms_and_conditions`, `invalid_url_website_incomplete_under_construction`, `invalid_url_website_other`, `invalid_url_web_presence_detected`, `invalid_value_other`, `unresolvable_ip_address`, `unresolvable_postal_code`, `verification_directors_mismatch`, `verification_document_address_mismatch`, `verification_document_address_missing`, `verification_document_corrupt`, `verification_document_country_not_supported`, `verification_document_directors_mismatch`, `verification_document_dob_mismatch`, `verification_document_duplicate_type`, `verification_document_expired`, `verification_document_failed_copy`, `verification_document_failed_greyscale`, `verification_document_failed_other`, `verification_document_failed_test_mode`, `verification_document_fraudulent`, `verification_document_id_number_mismatch`, `verification_document_id_number_missing`, `verification_document_incomplete`, `verification_document_invalid`, `verification_document_issue_or_expiry_date_missing`, `verification_document_manipulated`, `verification_document_missing_back`, `verification_document_missing_front`, `verification_document_name_mismatch`, `verification_document_name_missing`, `verification_document_nationality_mismatch`, `verification_document_not_readable`, `verification_document_not_signed`, `verification_document_not_uploaded`, `verification_document_photo_mismatch`, `verification_document_too_large`, `verification_document_type_not_supported`, `verification_extraneous_directors`, `verification_failed_address_match`, `verification_failed_business_iec_number`, `verification_failed_document_match`, `verification_failed_id_number_match`, `verification_failed_keyed_identity`, `verification_failed_keyed_match`, `verification_failed_name_match`, `verification_failed_other`, `verification_failed_representative_authority`, `verification_failed_residential_address`, `verification_failed_tax_id_match`, `verification_failed_tax_id_not_issued`, `verification_missing_directors`, `verification_missing_executives`, `verification_missing_owners`, `verification_requires_additional_memorandum_of_associations`, `verification_requires_additional_proof_of_registration`, `verification_selfie_document_missing_photo`, `verification_selfie_face_mismatch`, `verification_selfie_manipulated`, `verification_selfie_unverified_other`, `verification_supportability`, `verification_token_stale`.
  * `description` - Human-readable description of the error.
  """
  @type requirements_entries_errors :: %{
          optional(:code) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `restricts_capabilities` - The Capabilities that will be restricted if the requirement is not collected and satisfactory to Stripe.
  """
  @type requirements_entries_impact :: %{
          optional(:restricts_capabilities) =>
            [requirements_entries_impact_restricts_capabilities()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `capability` - The name of the Capability which will be restricted. Possible values: `ach_debit_payments`, `acss_debit_payments`, `affirm_payments`, `afterpay_clearpay_payments`, `alma_payments`, `amazon_pay_payments`, `automatic_indirect_tax`, `au_becs_debit_payments`, `bacs_debit_payments`, `bancontact_payments`, `bank_accounts.local`, `bank_accounts.wire`, `blik_payments`, `boleto_payments`, `cards`, `card_payments`, `cartes_bancaires_payments`, `cashapp_payments`, `eps_payments`, `fpx_payments`, `gb_bank_transfer_payments`, `grabpay_payments`, `ideal_payments`, `jcb_payments`, `jp_bank_transfer_payments`, `kakao_pay_payments`, `klarna_payments`, `konbini_payments`, `kr_card_payments`, `link_payments`, `mobilepay_payments`, `multibanco_payments`, `mx_bank_transfer_payments`, `naver_pay_payments`, `oxxo_payments`, `p24_payments`, `payco_payments`, `paynow_payments`, `pay_by_bank_payments`, `promptpay_payments`, `revolut_pay_payments`, `samsung_pay_payments`, `sepa_bank_transfer_payments`, `sepa_debit_payments`, `stripe_balance.payouts`, `stripe_balance.stripe_transfers`, `swish_payments`, `twint_payments`, `us_bank_transfer_payments`, `zip_payments`.
  * `configuration` - The configuration which specifies the Capability which will be restricted. Possible values: `customer`, `merchant`, `recipient`.
  * `deadline` - Details about when in the account lifecycle the requirement must be collected by the avoid the Capability restriction.
  """
  @type requirements_entries_impact_restricts_capabilities :: %{
          optional(:capability) => String.t() | nil,
          optional(:configuration) => String.t() | nil,
          optional(:deadline) =>
            requirements_entries_impact_restricts_capabilities_deadline() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The current status of the requirement's impact. Possible values: `currently_due`, `eventually_due`, `past_due`.
  """
  @type requirements_entries_impact_restricts_capabilities_deadline :: %{
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The current status of the requirement's impact. Possible values: `currently_due`, `eventually_due`, `past_due`.
  """
  @type requirements_entries_minimum_deadline :: %{
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `inquiry` - If `inquiry` is the type, the inquiry token.
  * `resource` - If `resource` is the type, the resource token.
  * `type` - The type of the reference. If the type is "inquiry", the inquiry token can be found in the "inquiry" field.
  Otherwise the type is an API resource, the token for which can be found in the "resource" field. Possible values: `inquiry`, `payment_method`, `person`.
  """
  @type requirements_entries_reference :: %{
          optional(:inquiry) => String.t() | nil,
          optional(:resource) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Machine-readable description of Stripe's reason for collecting the requirement. Possible values: `routine_onboarding`, `routine_verification`.
  """
  @type requirements_entries_requested_reasons :: %{
          optional(:code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `minimum_deadline` - The soonest date and time a requirement on the Account will become `past due`. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: `2022-09-18T13:22:18.123Z`.
  """
  @type requirements_summary :: %{
          optional(:minimum_deadline) => requirements_summary_minimum_deadline() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - The current strictest status of all requirements on the Account. Possible values: `currently_due`, `eventually_due`, `past_due`.
  * `time` - The soonest RFC3339 date & time UTC value a requirement can impact the Account. Format: date-time.
  """
  @type requirements_summary_minimum_deadline :: %{
          optional(:status) => String.t() | nil,
          optional(:time) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "configuration" => %{
        fields: %{
          "customer" => %{
            fields: %{
              "applied" => :scalar,
              "automatic_indirect_tax" => %{
                fields: %{
                  "exempt" => :scalar,
                  "ip_address" => :scalar,
                  "location" => %{
                    fields: %{
                      "country" => :scalar,
                      "state" => :scalar
                    }
                  },
                  "location_source" => :scalar
                }
              },
              "billing" => %{
                fields: %{
                  "default_payment_method" => :scalar,
                  "invoice" => %{
                    fields: %{
                      "custom_fields" =>
                        {:list,
                         %{
                           fields: %{
                             "name" => :scalar,
                             "value" => :scalar
                           }
                         }},
                      "footer" => :scalar,
                      "next_sequence" => :scalar,
                      "prefix" => :scalar,
                      "rendering" => %{
                        fields: %{
                          "amount_tax_display" => :scalar,
                          "template" => :scalar
                        }
                      }
                    }
                  }
                }
              },
              "capabilities" => %{
                fields: %{
                  "automatic_indirect_tax" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  }
                }
              },
              "shipping" => %{
                fields: %{
                  "address" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar
                    }
                  },
                  "name" => :scalar,
                  "phone" => :scalar
                }
              },
              "test_clock" => :scalar
            }
          },
          "merchant" => %{
            fields: %{
              "applied" => :scalar,
              "bacs_debit_payments" => %{
                fields: %{
                  "display_name" => :scalar,
                  "service_user_number" => :scalar
                }
              },
              "branding" => %{
                fields: %{
                  "icon" => :scalar,
                  "logo" => :scalar,
                  "primary_color" => :scalar,
                  "secondary_color" => :scalar
                }
              },
              "capabilities" => %{
                fields: %{
                  "ach_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "acss_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "affirm_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "afterpay_clearpay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "alma_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "amazon_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "au_becs_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "bacs_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "bancontact_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "blik_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "boleto_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "card_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "cartes_bancaires_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "cashapp_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "eps_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "fpx_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "gb_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "grabpay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "ideal_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "jcb_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "jp_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "kakao_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "klarna_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "konbini_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "kr_card_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "link_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "mobilepay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "multibanco_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "mx_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "naver_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "oxxo_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "p24_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "pay_by_bank_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "payco_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "paynow_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "promptpay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "revolut_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "samsung_pay_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "sepa_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "sepa_debit_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "stripe_balance" => %{
                    fields: %{
                      "payouts" => %{
                        fields: %{
                          "status" => :scalar,
                          "status_details" =>
                            {:list,
                             %{
                               fields: %{
                                 "code" => :scalar,
                                 "resolution" => :scalar
                               }
                             }}
                        }
                      }
                    }
                  },
                  "swish_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "twint_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "us_bank_transfer_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  },
                  "zip_payments" => %{
                    fields: %{
                      "status" => :scalar,
                      "status_details" =>
                        {:list,
                         %{
                           fields: %{
                             "code" => :scalar,
                             "resolution" => :scalar
                           }
                         }}
                    }
                  }
                }
              },
              "card_payments" => %{
                fields: %{
                  "decline_on" => %{
                    fields: %{
                      "avs_failure" => :scalar,
                      "cvc_failure" => :scalar
                    }
                  }
                }
              },
              "konbini_payments" => %{
                fields: %{
                  "support" => %{
                    fields: %{
                      "email" => :scalar,
                      "hours" => %{
                        fields: %{
                          "end_time" => :scalar,
                          "start_time" => :scalar
                        }
                      },
                      "phone" => :scalar
                    }
                  }
                }
              },
              "mcc" => :scalar,
              "script_statement_descriptor" => %{
                fields: %{
                  "kana" => %{
                    fields: %{
                      "descriptor" => :scalar,
                      "prefix" => :scalar
                    }
                  },
                  "kanji" => %{
                    fields: %{
                      "descriptor" => :scalar,
                      "prefix" => :scalar
                    }
                  }
                }
              },
              "sepa_debit_payments" => %{
                fields: %{
                  "creditor_id" => :scalar
                }
              },
              "statement_descriptor" => %{
                fields: %{
                  "descriptor" => :scalar,
                  "prefix" => :scalar
                }
              },
              "support" => %{
                fields: %{
                  "address" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar,
                      "town" => :scalar
                    }
                  },
                  "email" => :scalar,
                  "phone" => :scalar,
                  "url" => :scalar
                }
              }
            }
          },
          "recipient" => %{
            fields: %{
              "applied" => :scalar,
              "capabilities" => %{
                fields: %{
                  "stripe_balance" => %{
                    fields: %{
                      "payouts" => %{
                        fields: %{
                          "status" => :scalar,
                          "status_details" =>
                            {:list,
                             %{
                               fields: %{
                                 "code" => :scalar,
                                 "resolution" => :scalar
                               }
                             }}
                        }
                      },
                      "stripe_transfers" => %{
                        fields: %{
                          "status" => :scalar,
                          "status_details" =>
                            {:list,
                             %{
                               fields: %{
                                 "code" => :scalar,
                                 "resolution" => :scalar
                               }
                             }}
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      },
      "defaults" => %{
        fields: %{
          "currency" => :scalar,
          "locales" => {:list, :scalar},
          "profile" => %{
            fields: %{
              "business_url" => :scalar,
              "doing_business_as" => :scalar,
              "product_description" => :scalar
            }
          },
          "responsibilities" => %{
            fields: %{
              "fees_collector" => :scalar,
              "losses_collector" => :scalar,
              "requirements_collector" => :scalar
            }
          }
        }
      },
      "future_requirements" => %{
        fields: %{
          "entries" =>
            {:list,
             %{
               fields: %{
                 "awaiting_action_from" => :scalar,
                 "description" => :scalar,
                 "errors" =>
                   {:list,
                    %{
                      fields: %{
                        "code" => :scalar,
                        "description" => :scalar
                      }
                    }},
                 "impact" => %{
                   fields: %{
                     "restricts_capabilities" =>
                       {:list,
                        %{
                          fields: %{
                            "capability" => :scalar,
                            "configuration" => :scalar,
                            "deadline" => %{
                              fields: %{
                                "status" => :scalar
                              }
                            }
                          }
                        }}
                   }
                 },
                 "minimum_deadline" => %{
                   fields: %{
                     "status" => :scalar
                   }
                 },
                 "reference" => %{
                   fields: %{
                     "inquiry" => :scalar,
                     "resource" => :scalar,
                     "type" => :scalar
                   }
                 },
                 "requested_reasons" =>
                   {:list,
                    %{
                      fields: %{
                        "code" => :scalar
                      }
                    }}
               }
             }},
          "minimum_transition_date" => :scalar,
          "summary" => %{
            fields: %{
              "minimum_deadline" => %{
                fields: %{
                  "status" => :scalar,
                  "time" => :scalar
                }
              }
            }
          }
        }
      },
      "identity" => %{
        fields: %{
          "attestations" => %{
            fields: %{
              "directorship_declaration" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              },
              "ownership_declaration" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              },
              "persons_provided" => %{
                fields: %{
                  "directors" => :scalar,
                  "executives" => :scalar,
                  "owners" => :scalar,
                  "ownership_exemption_reason" => :scalar
                }
              },
              "representative_declaration" => %{
                fields: %{
                  "date" => :scalar,
                  "ip" => :scalar,
                  "user_agent" => :scalar
                }
              },
              "terms_of_service" => %{
                fields: %{
                  "account" => %{
                    fields: %{
                      "date" => :scalar,
                      "ip" => :scalar,
                      "user_agent" => :scalar
                    }
                  }
                }
              }
            }
          },
          "business_details" => %{
            fields: %{
              "address" => %{
                fields: %{
                  "city" => :scalar,
                  "country" => :scalar,
                  "line1" => :scalar,
                  "line2" => :scalar,
                  "postal_code" => :scalar,
                  "state" => :scalar,
                  "town" => :scalar
                }
              },
              "annual_revenue" => %{
                fields: %{
                  "amount" => %{
                    fields: %{
                      "currency" => :scalar,
                      "value" => :scalar
                    }
                  },
                  "fiscal_year_end" => :scalar
                }
              },
              "documents" => %{
                fields: %{
                  "bank_account_ownership_verification" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_license" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_memorandum_of_association" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_ministerial_decree" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_registration_verification" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "company_tax_id_verification" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "primary_verification" => %{
                    fields: %{
                      "front_back" => %{
                        fields: %{
                          "back" => :scalar,
                          "front" => :scalar
                        }
                      },
                      "type" => :scalar
                    }
                  },
                  "proof_of_address" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "proof_of_registration" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "proof_of_ultimate_beneficial_ownership" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  }
                }
              },
              "estimated_worker_count" => :scalar,
              "id_numbers" =>
                {:list,
                 %{
                   fields: %{
                     "registrar" => :scalar,
                     "type" => :scalar
                   }
                 }},
              "monthly_estimated_revenue" => %{
                fields: %{
                  "amount" => %{
                    fields: %{
                      "currency" => :scalar,
                      "value" => :scalar
                    }
                  }
                }
              },
              "phone" => :scalar,
              "registered_name" => :scalar,
              "registration_date" => %{
                fields: %{
                  "day" => :scalar,
                  "month" => :scalar,
                  "year" => :scalar
                }
              },
              "script_addresses" => %{
                fields: %{
                  "kana" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar,
                      "town" => :scalar
                    }
                  },
                  "kanji" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar,
                      "town" => :scalar
                    }
                  }
                }
              },
              "script_names" => %{
                fields: %{
                  "kana" => %{
                    fields: %{
                      "registered_name" => :scalar
                    }
                  },
                  "kanji" => %{
                    fields: %{
                      "registered_name" => :scalar
                    }
                  }
                }
              },
              "structure" => :scalar
            }
          },
          "country" => :scalar,
          "entity_type" => :scalar,
          "individual" => %{
            fields: %{
              "account" => :scalar,
              "additional_addresses" =>
                {:list,
                 %{
                   fields: %{
                     "city" => :scalar,
                     "country" => :scalar,
                     "line1" => :scalar,
                     "line2" => :scalar,
                     "postal_code" => :scalar,
                     "purpose" => :scalar,
                     "state" => :scalar,
                     "town" => :scalar
                   }
                 }},
              "additional_names" =>
                {:list,
                 %{
                   fields: %{
                     "full_name" => :scalar,
                     "given_name" => :scalar,
                     "purpose" => :scalar,
                     "surname" => :scalar
                   }
                 }},
              "additional_terms_of_service" => %{
                fields: %{
                  "account" => %{
                    fields: %{
                      "date" => :scalar,
                      "ip" => :scalar,
                      "user_agent" => :scalar
                    }
                  }
                }
              },
              "address" => %{
                fields: %{
                  "city" => :scalar,
                  "country" => :scalar,
                  "line1" => :scalar,
                  "line2" => :scalar,
                  "postal_code" => :scalar,
                  "state" => :scalar,
                  "town" => :scalar
                }
              },
              "created" => :scalar,
              "date_of_birth" => %{
                fields: %{
                  "day" => :scalar,
                  "month" => :scalar,
                  "year" => :scalar
                }
              },
              "documents" => %{
                fields: %{
                  "company_authorization" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "passport" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  },
                  "primary_verification" => %{
                    fields: %{
                      "front_back" => %{
                        fields: %{
                          "back" => :scalar,
                          "front" => :scalar
                        }
                      },
                      "type" => :scalar
                    }
                  },
                  "secondary_verification" => %{
                    fields: %{
                      "front_back" => %{
                        fields: %{
                          "back" => :scalar,
                          "front" => :scalar
                        }
                      },
                      "type" => :scalar
                    }
                  },
                  "visa" => %{
                    fields: %{
                      "files" => {:list, :scalar},
                      "type" => :scalar
                    }
                  }
                }
              },
              "email" => :scalar,
              "given_name" => :scalar,
              "id" => :scalar,
              "id_numbers" =>
                {:list,
                 %{
                   fields: %{
                     "type" => :scalar
                   }
                 }},
              "legal_gender" => :scalar,
              "metadata" => {:map, :scalar},
              "nationalities" => {:list, :scalar},
              "object" => :scalar,
              "phone" => :scalar,
              "political_exposure" => :scalar,
              "relationship" => %{
                fields: %{
                  "authorizer" => :scalar,
                  "director" => :scalar,
                  "executive" => :scalar,
                  "legal_guardian" => :scalar,
                  "owner" => :scalar,
                  "percent_ownership" => :scalar,
                  "representative" => :scalar,
                  "title" => :scalar
                }
              },
              "script_addresses" => %{
                fields: %{
                  "kana" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar,
                      "town" => :scalar
                    }
                  },
                  "kanji" => %{
                    fields: %{
                      "city" => :scalar,
                      "country" => :scalar,
                      "line1" => :scalar,
                      "line2" => :scalar,
                      "postal_code" => :scalar,
                      "state" => :scalar,
                      "town" => :scalar
                    }
                  }
                }
              },
              "script_names" => %{
                fields: %{
                  "kana" => %{
                    fields: %{
                      "given_name" => :scalar,
                      "surname" => :scalar
                    }
                  },
                  "kanji" => %{
                    fields: %{
                      "given_name" => :scalar,
                      "surname" => :scalar
                    }
                  }
                }
              },
              "surname" => :scalar,
              "updated" => :scalar
            }
          }
        }
      },
      "requirements" => %{
        fields: %{
          "entries" =>
            {:list,
             %{
               fields: %{
                 "awaiting_action_from" => :scalar,
                 "description" => :scalar,
                 "errors" =>
                   {:list,
                    %{
                      fields: %{
                        "code" => :scalar,
                        "description" => :scalar
                      }
                    }},
                 "impact" => %{
                   fields: %{
                     "restricts_capabilities" =>
                       {:list,
                        %{
                          fields: %{
                            "capability" => :scalar,
                            "configuration" => :scalar,
                            "deadline" => %{
                              fields: %{
                                "status" => :scalar
                              }
                            }
                          }
                        }}
                   }
                 },
                 "minimum_deadline" => %{
                   fields: %{
                     "status" => :scalar
                   }
                 },
                 "reference" => %{
                   fields: %{
                     "inquiry" => :scalar,
                     "resource" => :scalar,
                     "type" => :scalar
                   }
                 },
                 "requested_reasons" =>
                   {:list,
                    %{
                      fields: %{
                        "code" => :scalar
                      }
                    }}
               }
             }},
          "summary" => %{
            fields: %{
              "minimum_deadline" => %{
                fields: %{
                  "status" => :scalar,
                  "time" => :scalar
                }
              }
            }
          }
        }
      }
    }
  end
end
