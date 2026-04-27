# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountCreateParams do
  @moduledoc "Parameters for account create."

  @typedoc """
  * `account_token` - An [account token](https://api.stripe.com#create_account_token), used to securely provide details to the account. Max length: 5000.
  * `business_profile` - Business information about the account.
  * `business_type` - The business type. Once you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions), this property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts. Possible values: `company`, `government_entity`, `individual`, `non_profit`.
  * `capabilities` - Each key of the dictionary represents a capability, and each capability
  maps to its settings (for example, whether it has been requested or not). Each
  capability is inactive until you have provided its specific
  requirements and Stripe has verified them. An account might have some
  of its requested capabilities be active and some be inactive.

  Required when [account.controller.stripe_dashboard.type](https://docs.stripe.com/api/accounts/create#create_account-controller-dashboard-type)
  is `none`, which includes Custom accounts.
  * `company` - Information about the company or business. This field is available for any `business_type`. Once you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions), this property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts.
  * `controller` - A hash of configuration describing the account controller's attributes.
  * `country` - The country in which the account holder resides, or in which the business is legally established. This should be an ISO 3166-1 alpha-2 country code. For example, if you are in the United States and the business for which you're creating an account is legally represented in Canada, you would use `CA` as the country for the account being created. Available countries include [Stripe's global markets](https://stripe.com/global) as well as countries where [cross-border payouts](https://stripe.com/docs/connect/cross-border-payouts) are supported. Max length: 5000.
  * `default_currency` - Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://docs.stripe.com/payouts). Format: ISO 4217 currency code.
  * `documents` - Documents that may be submitted to satisfy various informational requests.
  * `email` - The email address of the account holder. This is only to make the account easier to identify to you. If [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts, Stripe doesn't email the account without your consent.
  * `expand` - Specifies which fields in the response should be expanded.
  * `external_account` - A card or bank account to attach to the account for receiving [payouts](https://stripe.com/connect/bank-debit-card-payouts) (you won’t be able to use it for top-ups). You can provide either a token, like the ones returned by [Stripe.js](https://stripe.com/js), or a dictionary, as documented in the `external_account` parameter for [bank account](https://stripe.com/api#account_create_bank_account) creation. 

  By default, providing an external account sets it as the new default external account for its currency, and deletes the old default if one exists. To add additional external accounts without replacing the existing default for the currency, use the [bank account](https://stripe.com/api#account_create_bank_account) or [card creation](https://stripe.com/api#account_create_card) APIs. After you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions), this property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts. Max length: 5000.
  * `groups` - A hash of account group type to tokens. These are account groups this account should be added to.
  * `individual` - Information about the person represented by the account. This field is null unless `business_type` is set to `individual`. Once you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions), this property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `settings` - Options for customizing how the account functions within Stripe.
  * `tos_acceptance` - Details on the account's acceptance of the [Stripe Services Agreement](https://stripe.com/connect/updating-accounts#tos-acceptance). This property can only be updated for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts. This property defaults to a `full` service agreement when empty.
  * `type` - The type of Stripe account to create. May be one of `custom`, `express` or `standard`. Possible values: `custom`, `express`, `standard`.
  """
  @type t :: %__MODULE__{
          account_token: String.t() | nil,
          business_profile: business_profile() | nil,
          business_type: String.t() | nil,
          capabilities: capabilities() | nil,
          company: company() | nil,
          controller: controller() | nil,
          country: String.t() | nil,
          default_currency: String.t() | nil,
          documents: documents() | nil,
          email: String.t() | nil,
          expand: [String.t()] | nil,
          external_account: String.t() | nil,
          groups: groups() | nil,
          individual: individual() | nil,
          metadata: map() | nil,
          settings: settings() | nil,
          tos_acceptance: tos_acceptance() | nil,
          type: String.t() | nil
        }

  defstruct [
    :account_token,
    :business_profile,
    :business_type,
    :capabilities,
    :company,
    :controller,
    :country,
    :default_currency,
    :documents,
    :email,
    :expand,
    :external_account,
    :groups,
    :individual,
    :metadata,
    :settings,
    :tos_acceptance,
    :type
  ]

  @typedoc """
  * `annual_revenue` - The applicant's gross annual revenue for its preceding fiscal year.
  * `estimated_worker_count` - An estimated upper bound of employees, contractors, vendors, etc. currently working for the business.
  * `mcc` - [The merchant category code for the account](https://stripe.com/connect/setting-mcc). MCCs are used to classify businesses based on the goods or services they provide. Max length: 4.
  * `minority_owned_business_designation` - Whether the business is a minority-owned, women-owned, and/or LGBTQI+ -owned business.
  * `monthly_estimated_revenue` - An estimate of the monthly revenue of the business. Only accepted for accounts in Brazil and India.
  * `name` - The customer-facing business name. Max length: 5000.
  * `product_description` - Internal-only description of the product sold by, or service provided by, the business. Used by Stripe for risk and underwriting purposes. Max length: 40000.
  * `support_address` - A publicly available mailing address for sending support issues to.
  * `support_email` - A publicly available email address for sending support issues to.
  * `support_phone` - A publicly available phone number to call with support issues. Max length: 5000.
  * `support_url` - A publicly available website for handling support issues.
  * `url` - The business's publicly available website.
  """
  @type business_profile :: %{
          optional(:annual_revenue) => business_profile_annual_revenue() | nil,
          optional(:estimated_worker_count) => integer() | nil,
          optional(:mcc) => String.t() | nil,
          optional(:minority_owned_business_designation) => [String.t()] | nil,
          optional(:monthly_estimated_revenue) =>
            business_profile_monthly_estimated_revenue() | nil,
          optional(:name) => String.t() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:support_address) => business_profile_support_address() | nil,
          optional(:support_email) => String.t() | nil,
          optional(:support_phone) => String.t() | nil,
          optional(:support_url) => map() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - A non-negative integer representing the amount in the [smallest currency unit](https://stripe.com/currencies#zero-decimal).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `fiscal_year_end` - The close-out date of the preceding fiscal year in ISO 8601 format. E.g. 2023-12-31 for the 31st of December, 2023. Max length: 5000.
  """
  @type business_profile_annual_revenue :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:fiscal_year_end) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - A non-negative integer representing how much to charge in the [smallest currency unit](https://stripe.com/currencies#zero-decimal).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  """
  @type business_profile_monthly_estimated_revenue :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 100.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type business_profile_support_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `acss_debit_payments` - The acss_debit_payments capability.
  * `affirm_payments` - The affirm_payments capability.
  * `afterpay_clearpay_payments` - The afterpay_clearpay_payments capability.
  * `alma_payments` - The alma_payments capability.
  * `amazon_pay_payments` - The amazon_pay_payments capability.
  * `au_becs_debit_payments` - The au_becs_debit_payments capability.
  * `bacs_debit_payments` - The bacs_debit_payments capability.
  * `bancontact_payments` - The bancontact_payments capability.
  * `bank_transfer_payments` - The bank_transfer_payments capability.
  * `billie_payments` - The billie_payments capability.
  * `blik_payments` - The blik_payments capability.
  * `boleto_payments` - The boleto_payments capability.
  * `card_issuing` - The card_issuing capability.
  * `card_payments` - The card_payments capability.
  * `cartes_bancaires_payments` - The cartes_bancaires_payments capability.
  * `cashapp_payments` - The cashapp_payments capability.
  * `crypto_payments` - The crypto_payments capability.
  * `eps_payments` - The eps_payments capability.
  * `fpx_payments` - The fpx_payments capability.
  * `gb_bank_transfer_payments` - The gb_bank_transfer_payments capability.
  * `giropay_payments` - The giropay_payments capability.
  * `grabpay_payments` - The grabpay_payments capability.
  * `ideal_payments` - The ideal_payments capability.
  * `india_international_payments` - The india_international_payments capability.
  * `jcb_payments` - The jcb_payments capability.
  * `jp_bank_transfer_payments` - The jp_bank_transfer_payments capability.
  * `kakao_pay_payments` - The kakao_pay_payments capability.
  * `klarna_payments` - The klarna_payments capability.
  * `konbini_payments` - The konbini_payments capability.
  * `kr_card_payments` - The kr_card_payments capability.
  * `legacy_payments` - The legacy_payments capability.
  * `link_payments` - The link_payments capability.
  * `mb_way_payments` - The mb_way_payments capability.
  * `mobilepay_payments` - The mobilepay_payments capability.
  * `multibanco_payments` - The multibanco_payments capability.
  * `mx_bank_transfer_payments` - The mx_bank_transfer_payments capability.
  * `naver_pay_payments` - The naver_pay_payments capability.
  * `nz_bank_account_becs_debit_payments` - The nz_bank_account_becs_debit_payments capability.
  * `oxxo_payments` - The oxxo_payments capability.
  * `p24_payments` - The p24_payments capability.
  * `pay_by_bank_payments` - The pay_by_bank_payments capability.
  * `payco_payments` - The payco_payments capability.
  * `paynow_payments` - The paynow_payments capability.
  * `payto_payments` - The payto_payments capability.
  * `pix_payments` - The pix_payments capability.
  * `promptpay_payments` - The promptpay_payments capability.
  * `revolut_pay_payments` - The revolut_pay_payments capability.
  * `samsung_pay_payments` - The samsung_pay_payments capability.
  * `satispay_payments` - The satispay_payments capability.
  * `sepa_bank_transfer_payments` - The sepa_bank_transfer_payments capability.
  * `sepa_debit_payments` - The sepa_debit_payments capability.
  * `sofort_payments` - The sofort_payments capability.
  * `swish_payments` - The swish_payments capability.
  * `tax_reporting_us_1099_k` - The tax_reporting_us_1099_k capability.
  * `tax_reporting_us_1099_misc` - The tax_reporting_us_1099_misc capability.
  * `transfers` - The transfers capability.
  * `treasury` - The treasury capability.
  * `twint_payments` - The twint_payments capability.
  * `upi_payments` - The upi_payments capability.
  * `us_bank_account_ach_payments` - The us_bank_account_ach_payments capability.
  * `us_bank_transfer_payments` - The us_bank_transfer_payments capability.
  * `zip_payments` - The zip_payments capability.
  """
  @type capabilities :: %{
          optional(:acss_debit_payments) => capabilities_acss_debit_payments() | nil,
          optional(:affirm_payments) => capabilities_affirm_payments() | nil,
          optional(:afterpay_clearpay_payments) =>
            capabilities_afterpay_clearpay_payments() | nil,
          optional(:alma_payments) => capabilities_alma_payments() | nil,
          optional(:amazon_pay_payments) => capabilities_amazon_pay_payments() | nil,
          optional(:au_becs_debit_payments) => capabilities_au_becs_debit_payments() | nil,
          optional(:bacs_debit_payments) => capabilities_bacs_debit_payments() | nil,
          optional(:bancontact_payments) => capabilities_bancontact_payments() | nil,
          optional(:bank_transfer_payments) => capabilities_bank_transfer_payments() | nil,
          optional(:billie_payments) => capabilities_billie_payments() | nil,
          optional(:blik_payments) => capabilities_blik_payments() | nil,
          optional(:boleto_payments) => capabilities_boleto_payments() | nil,
          optional(:card_issuing) => capabilities_card_issuing() | nil,
          optional(:card_payments) => capabilities_card_payments() | nil,
          optional(:cartes_bancaires_payments) => capabilities_cartes_bancaires_payments() | nil,
          optional(:cashapp_payments) => capabilities_cashapp_payments() | nil,
          optional(:crypto_payments) => capabilities_crypto_payments() | nil,
          optional(:eps_payments) => capabilities_eps_payments() | nil,
          optional(:fpx_payments) => capabilities_fpx_payments() | nil,
          optional(:gb_bank_transfer_payments) => capabilities_gb_bank_transfer_payments() | nil,
          optional(:giropay_payments) => capabilities_giropay_payments() | nil,
          optional(:grabpay_payments) => capabilities_grabpay_payments() | nil,
          optional(:ideal_payments) => capabilities_ideal_payments() | nil,
          optional(:india_international_payments) =>
            capabilities_india_international_payments() | nil,
          optional(:jcb_payments) => capabilities_jcb_payments() | nil,
          optional(:jp_bank_transfer_payments) => capabilities_jp_bank_transfer_payments() | nil,
          optional(:kakao_pay_payments) => capabilities_kakao_pay_payments() | nil,
          optional(:klarna_payments) => capabilities_klarna_payments() | nil,
          optional(:konbini_payments) => capabilities_konbini_payments() | nil,
          optional(:kr_card_payments) => capabilities_kr_card_payments() | nil,
          optional(:legacy_payments) => capabilities_legacy_payments() | nil,
          optional(:link_payments) => capabilities_link_payments() | nil,
          optional(:mb_way_payments) => capabilities_mb_way_payments() | nil,
          optional(:mobilepay_payments) => capabilities_mobilepay_payments() | nil,
          optional(:multibanco_payments) => capabilities_multibanco_payments() | nil,
          optional(:mx_bank_transfer_payments) => capabilities_mx_bank_transfer_payments() | nil,
          optional(:naver_pay_payments) => capabilities_naver_pay_payments() | nil,
          optional(:nz_bank_account_becs_debit_payments) =>
            capabilities_nz_bank_account_becs_debit_payments() | nil,
          optional(:oxxo_payments) => capabilities_oxxo_payments() | nil,
          optional(:p24_payments) => capabilities_p24_payments() | nil,
          optional(:pay_by_bank_payments) => capabilities_pay_by_bank_payments() | nil,
          optional(:payco_payments) => capabilities_payco_payments() | nil,
          optional(:paynow_payments) => capabilities_paynow_payments() | nil,
          optional(:payto_payments) => capabilities_payto_payments() | nil,
          optional(:pix_payments) => capabilities_pix_payments() | nil,
          optional(:promptpay_payments) => capabilities_promptpay_payments() | nil,
          optional(:revolut_pay_payments) => capabilities_revolut_pay_payments() | nil,
          optional(:samsung_pay_payments) => capabilities_samsung_pay_payments() | nil,
          optional(:satispay_payments) => capabilities_satispay_payments() | nil,
          optional(:sepa_bank_transfer_payments) =>
            capabilities_sepa_bank_transfer_payments() | nil,
          optional(:sepa_debit_payments) => capabilities_sepa_debit_payments() | nil,
          optional(:sofort_payments) => capabilities_sofort_payments() | nil,
          optional(:swish_payments) => capabilities_swish_payments() | nil,
          optional(:tax_reporting_us_1099_k) => capabilities_tax_reporting_us_1099_k() | nil,
          optional(:tax_reporting_us_1099_misc) =>
            capabilities_tax_reporting_us_1099_misc() | nil,
          optional(:transfers) => capabilities_transfers() | nil,
          optional(:treasury) => capabilities_treasury() | nil,
          optional(:twint_payments) => capabilities_twint_payments() | nil,
          optional(:upi_payments) => capabilities_upi_payments() | nil,
          optional(:us_bank_account_ach_payments) =>
            capabilities_us_bank_account_ach_payments() | nil,
          optional(:us_bank_transfer_payments) => capabilities_us_bank_transfer_payments() | nil,
          optional(:zip_payments) => capabilities_zip_payments() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_acss_debit_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_affirm_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_afterpay_clearpay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_alma_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_amazon_pay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_au_becs_debit_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_bacs_debit_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_bancontact_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_bank_transfer_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_billie_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_blik_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_boleto_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_card_issuing :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_card_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_cartes_bancaires_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_cashapp_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_crypto_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_eps_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_fpx_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_gb_bank_transfer_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_giropay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_grabpay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_ideal_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_india_international_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_jcb_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_jp_bank_transfer_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_kakao_pay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_klarna_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_konbini_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_kr_card_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_legacy_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_link_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_mb_way_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_mobilepay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_multibanco_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_mx_bank_transfer_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_naver_pay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_nz_bank_account_becs_debit_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_oxxo_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_p24_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_pay_by_bank_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_payco_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_paynow_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_payto_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_pix_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_promptpay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_revolut_pay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_samsung_pay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_satispay_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_sepa_bank_transfer_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_sepa_debit_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_sofort_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_swish_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_tax_reporting_us_1099_k :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_tax_reporting_us_1099_misc :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_transfers :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_treasury :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_twint_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_upi_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_us_bank_account_ach_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_us_bank_transfer_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
  """
  @type capabilities_zip_payments :: %{
          optional(:requested) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The company's primary address.
  * `address_kana` - The Kana variation of the company's primary address (Japan only).
  * `address_kanji` - The Kanji variation of the company's primary address (Japan only).
  * `directors_provided` - Whether the company's directors have been provided. Set this Boolean to `true` after creating all the company's directors with [the Persons API](https://docs.stripe.com/api/persons) for accounts with a `relationship.director` requirement. This value is not automatically set to `true` after creating directors, so it needs to be updated to indicate all directors have been provided.
  * `directorship_declaration` - This hash is used to attest that the directors information provided to Stripe is both current and correct.
  * `executives_provided` - Whether the company's executives have been provided. Set this Boolean to `true` after creating all the company's executives with [the Persons API](https://docs.stripe.com/api/persons) for accounts with a `relationship.executive` requirement.
  * `export_license_id` - The export license ID number of the company, also referred as Import Export Code (India only). Max length: 5000.
  * `export_purpose_code` - The purpose code to use for export transactions (India only). Max length: 5000.
  * `name` - The company's legal name. Max length: 100.
  * `name_kana` - The Kana variation of the company's legal name (Japan only). Max length: 100.
  * `name_kanji` - The Kanji variation of the company's legal name (Japan only). Max length: 100.
  * `owners_provided` - Whether the company's owners have been provided. Set this Boolean to `true` after creating all the company's owners with [the Persons API](https://docs.stripe.com/api/persons) for accounts with a `relationship.owner` requirement.
  * `ownership_declaration` - This hash is used to attest that the beneficial owner information provided to Stripe is both current and correct.
  * `ownership_exemption_reason` - This value is used to determine if a business is exempt from providing ultimate beneficial owners. See [this support article](https://support.stripe.com/questions/exemption-from-providing-ownership-details) and [changelog](https://docs.stripe.com/changelog/acacia/2025-01-27/ownership-exemption-reason-accounts-api) for more details. Possible values: `qualified_entity_exceeds_ownership_threshold`, `qualifies_as_financial_institution`.
  * `phone` - The company's phone number (used for verification). Max length: 5000.
  * `registration_date` - When the business was incorporated or registered.
  * `registration_number` - The identification number given to a company when it is registered or incorporated, if distinct from the identification number used for filing taxes. (Examples are the CIN for companies and LLP IN for partnerships in India, and the Company Registration Number in Hong Kong). Max length: 5000.
  * `representative_declaration` - This hash is used to attest that the representative is authorized to act as the representative of their legal entity.
  * `structure` - The category identifying the legal structure of the company or legal entity. See [Business structure](https://stripe.com/connect/identity-verification#business-structure) for more details. Pass an empty string to unset this value. Possible values: `free_zone_establishment`, `free_zone_llc`, `government_instrumentality`, `governmental_unit`, `incorporated_non_profit`, `incorporated_partnership`, `limited_liability_partnership`, `llc`, `multi_member_llc`, `private_company`, `private_corporation`, `private_partnership`, `public_company`, `public_corporation`, `public_partnership`, `registered_charity`, `single_member_llc`, `sole_establishment`, `sole_proprietorship`, `tax_exempt_government_instrumentality`, `unincorporated_association`, `unincorporated_non_profit`, `unincorporated_partnership`.
  * `tax_id` - The business ID number of the company, as appropriate for the company’s country. (Examples are an Employer ID Number in the U.S., a Business Number in Canada, or a Company Number in the UK.) Max length: 5000.
  * `tax_id_registrar` - The jurisdiction in which the `tax_id` is registered (Germany-based companies only). Max length: 5000.
  * `vat_id` - The VAT number of the company. Max length: 5000.
  * `verification` - Information on the verification state of the company.
  """
  @type company :: %{
          optional(:address) => company_address() | nil,
          optional(:address_kana) => company_address_kana() | nil,
          optional(:address_kanji) => company_address_kanji() | nil,
          optional(:directors_provided) => boolean() | nil,
          optional(:directorship_declaration) => company_directorship_declaration() | nil,
          optional(:executives_provided) => boolean() | nil,
          optional(:export_license_id) => String.t() | nil,
          optional(:export_purpose_code) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:name_kana) => String.t() | nil,
          optional(:name_kanji) => String.t() | nil,
          optional(:owners_provided) => boolean() | nil,
          optional(:ownership_declaration) => company_ownership_declaration() | nil,
          optional(:ownership_exemption_reason) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(:registration_date) => map() | nil,
          optional(:registration_number) => String.t() | nil,
          optional(:representative_declaration) => company_representative_declaration() | nil,
          optional(:structure) => String.t() | nil,
          optional(:tax_id) => String.t() | nil,
          optional(:tax_id_registrar) => String.t() | nil,
          optional(:vat_id) => String.t() | nil,
          optional(:verification) => company_verification() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 100.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type company_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City or ward. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Block or building number. Max length: 5000.
  * `line2` - Building details. Max length: 5000.
  * `postal_code` - Postal code. Max length: 5000.
  * `state` - Prefecture. Max length: 5000.
  * `town` - Town or cho-me. Max length: 5000.
  """
  @type company_address_kana :: %{
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
  * `city` - City or ward. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Block or building number. Max length: 5000.
  * `line2` - Building details. Max length: 5000.
  * `postal_code` - Postal code. Max length: 5000.
  * `state` - Prefecture. Max length: 5000.
  * `town` - Town or cho-me. Max length: 5000.
  """
  @type company_address_kanji :: %{
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
  * `date` - The Unix timestamp marking when the directorship declaration attestation was made. Format: Unix timestamp.
  * `ip` - The IP address from which the directorship declaration attestation was made.
  * `user_agent` - The user agent of the browser from which the directorship declaration attestation was made. Max length: 5000.
  """
  @type company_directorship_declaration :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp marking when the beneficial owner attestation was made. Format: Unix timestamp.
  * `ip` - The IP address from which the beneficial owner attestation was made.
  * `user_agent` - The user agent of the browser from which the beneficial owner attestation was made. Max length: 5000.
  """
  @type company_ownership_declaration :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp marking when the representative declaration attestation was made. Format: Unix timestamp.
  * `ip` - The IP address from which the representative declaration attestation was made.
  * `user_agent` - The user agent of the browser from which the representative declaration attestation was made. Max length: 5000.
  """
  @type company_representative_declaration :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `document` - A document verifying the business.
  """
  @type company_verification :: %{
          optional(:document) => company_verification_document() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - The back of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `additional_verification`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
  * `front` - The front of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `additional_verification`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
  """
  @type company_verification_document :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fees` - A hash of configuration for who pays Stripe fees for product usage on this account.
  * `losses` - A hash of configuration for products that have negative balance liability, and whether Stripe or a Connect application is responsible for them.
  * `requirement_collection` - A value indicating responsibility for collecting updated information when requirements on the account are due or change. Defaults to `stripe`. Possible values: `application`, `stripe`.
  * `stripe_dashboard` - A hash of configuration for Stripe-hosted dashboards.
  """
  @type controller :: %{
          optional(:fees) => controller_fees() | nil,
          optional(:losses) => controller_losses() | nil,
          optional(:requirement_collection) => String.t() | nil,
          optional(:stripe_dashboard) => controller_stripe_dashboard() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payer` - A value indicating the responsible payer of Stripe fees on this account. Defaults to `account`. Learn more about [fee behavior on connected accounts](https://docs.stripe.com/connect/direct-charges-fee-payer-behavior). Possible values: `account`, `application`.
  """
  @type controller_fees :: %{
          optional(:payer) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payments` - A value indicating who is liable when this account can't pay back negative balances resulting from payments. Defaults to `stripe`. Possible values: `application`, `stripe`.
  """
  @type controller_losses :: %{
          optional(:payments) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Whether this account should have access to the full Stripe Dashboard (`full`), to the Express Dashboard (`express`), or to no Stripe-hosted dashboard (`none`). Defaults to `full`. Possible values: `express`, `full`, `none`.
  """
  @type controller_stripe_dashboard :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_account_ownership_verification` - One or more documents that support the [Bank account ownership verification](https://support.stripe.com/questions/bank-account-ownership-verification) requirement. Must be a document associated with the account’s primary active bank account that displays the last 4 digits of the account number, either a statement or a check.
  * `company_license` - One or more documents that demonstrate proof of a company's license to operate.
  * `company_memorandum_of_association` - One or more documents showing the company's Memorandum of Association.
  * `company_ministerial_decree` - (Certain countries only) One or more documents showing the ministerial decree legalizing the company's establishment.
  * `company_registration_verification` - One or more documents that demonstrate proof of a company's registration with the appropriate local authorities.
  * `company_tax_id_verification` - One or more documents that demonstrate proof of a company's tax ID.
  * `proof_of_address` - One or more documents that demonstrate proof of address.
  * `proof_of_registration` - One or more documents showing the company’s proof of registration with the national business registry.
  * `proof_of_ultimate_beneficial_ownership` - One or more documents that demonstrate proof of ultimate beneficial ownership.
  """
  @type documents :: %{
          optional(:bank_account_ownership_verification) =>
            documents_bank_account_ownership_verification() | nil,
          optional(:company_license) => documents_company_license() | nil,
          optional(:company_memorandum_of_association) =>
            documents_company_memorandum_of_association() | nil,
          optional(:company_ministerial_decree) => documents_company_ministerial_decree() | nil,
          optional(:company_registration_verification) =>
            documents_company_registration_verification() | nil,
          optional(:company_tax_id_verification) => documents_company_tax_id_verification() | nil,
          optional(:proof_of_address) => documents_proof_of_address() | nil,
          optional(:proof_of_registration) => documents_proof_of_registration() | nil,
          optional(:proof_of_ultimate_beneficial_ownership) =>
            documents_proof_of_ultimate_beneficial_ownership() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  """
  @type documents_bank_account_ownership_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  """
  @type documents_company_license :: %{
          optional(:files) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  """
  @type documents_company_memorandum_of_association :: %{
          optional(:files) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  """
  @type documents_company_ministerial_decree :: %{
          optional(:files) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  """
  @type documents_company_registration_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  """
  @type documents_company_tax_id_verification :: %{
          optional(:files) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  """
  @type documents_proof_of_address :: %{
          optional(:files) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  * `signer` - Information regarding the person signing the document if applicable.
  """
  @type documents_proof_of_registration :: %{
          optional(:files) => [String.t()] | nil,
          optional(:signer) => documents_proof_of_registration_signer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `person` - The token of the person signing the document, if applicable. Max length: 5000.
  """
  @type documents_proof_of_registration_signer :: %{
          optional(:person) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
  * `signer` - Information regarding the person signing the document if applicable.
  """
  @type documents_proof_of_ultimate_beneficial_ownership :: %{
          optional(:files) => [String.t()] | nil,
          optional(:signer) => documents_proof_of_ultimate_beneficial_ownership_signer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `person` - The token of the person signing the document, if applicable. Max length: 5000.
  """
  @type documents_proof_of_ultimate_beneficial_ownership_signer :: %{
          optional(:person) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payments_pricing` - The group the account is in to determine their payments pricing, and null if the account is on customized pricing. [See the Platform pricing tool documentation](https://docs.stripe.com/connect/platform-pricing-tools) for details.
  """
  @type groups :: %{
          optional(:payments_pricing) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The individual's primary address.
  * `address_kana` - The Kana variation of the individual's primary address (Japan only).
  * `address_kanji` - The Kanji variation of the individual's primary address (Japan only).
  * `dob` - The individual's date of birth.
  * `email` - The individual's email address.
  * `first_name` - The individual's first name. Max length: 100.
  * `first_name_kana` - The Kana variation of the individual's first name (Japan only). Max length: 5000.
  * `first_name_kanji` - The Kanji variation of the individual's first name (Japan only). Max length: 5000.
  * `full_name_aliases` - A list of alternate names or aliases that the individual is known by.
  * `gender` - The individual's gender
  * `id_number` - The government-issued ID number of the individual, as appropriate for the representative's country. (Examples are a Social Security Number in the U.S., or a Social Insurance Number in Canada). Instead of the number itself, you can also provide a [PII token created with Stripe.js](https://stripe.com/js/tokens/create_token?type=pii). Max length: 5000.
  * `id_number_secondary` - The government-issued secondary ID number of the individual, as appropriate for the representative's country, will be used for enhanced verification checks. In Thailand, this would be the laser code found on the back of an ID card. Instead of the number itself, you can also provide a [PII token created with Stripe.js](https://stripe.com/js/tokens/create_token?type=pii). Max length: 5000.
  * `last_name` - The individual's last name. Max length: 100.
  * `last_name_kana` - The Kana variation of the individual's last name (Japan only). Max length: 5000.
  * `last_name_kanji` - The Kanji variation of the individual's last name (Japan only). Max length: 5000.
  * `maiden_name` - The individual's maiden name. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `phone` - The individual's phone number.
  * `political_exposure` - Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction. Possible values: `existing`, `none`.
  * `registered_address` - The individual's registered address.
  * `relationship` - Describes the person’s relationship to the account.
  * `ssn_last_4` - The last four digits of the individual's Social Security Number (U.S. only). Max length: 5000.
  * `verification` - The individual's verification document information.
  """
  @type individual :: %{
          optional(:address) => individual_address() | nil,
          optional(:address_kana) => individual_address_kana() | nil,
          optional(:address_kanji) => individual_address_kanji() | nil,
          optional(:dob) => map() | nil,
          optional(:email) => String.t() | nil,
          optional(:first_name) => String.t() | nil,
          optional(:first_name_kana) => String.t() | nil,
          optional(:first_name_kanji) => String.t() | nil,
          optional(:full_name_aliases) => map() | nil,
          optional(:gender) => String.t() | nil,
          optional(:id_number) => String.t() | nil,
          optional(:id_number_secondary) => String.t() | nil,
          optional(:last_name) => String.t() | nil,
          optional(:last_name_kana) => String.t() | nil,
          optional(:last_name_kanji) => String.t() | nil,
          optional(:maiden_name) => String.t() | nil,
          optional(:metadata) => map() | nil,
          optional(:phone) => String.t() | nil,
          optional(:political_exposure) => String.t() | nil,
          optional(:registered_address) => individual_registered_address() | nil,
          optional(:relationship) => individual_relationship() | nil,
          optional(:ssn_last_4) => String.t() | nil,
          optional(:verification) => individual_verification() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 100.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type individual_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City or ward. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Block or building number. Max length: 5000.
  * `line2` - Building details. Max length: 5000.
  * `postal_code` - Postal code. Max length: 5000.
  * `state` - Prefecture. Max length: 5000.
  * `town` - Town or cho-me. Max length: 5000.
  """
  @type individual_address_kana :: %{
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
  * `city` - City or ward. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Block or building number. Max length: 5000.
  * `line2` - Building details. Max length: 5000.
  * `postal_code` - Postal code. Max length: 5000.
  * `state` - Prefecture. Max length: 5000.
  * `town` - Town or cho-me. Max length: 5000.
  """
  @type individual_address_kanji :: %{
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
  * `city` - City, district, suburb, town, or village. Max length: 100.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type individual_registered_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `director` - Whether the person is a director of the account's legal entity. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
  * `executive` - Whether the person has significant responsibility to control, manage, or direct the organization.
  * `owner` - Whether the person is an owner of the account’s legal entity.
  * `percent_ownership` - The percent owned by the person of the account's legal entity.
  * `title` - The person's title (e.g., CEO, Support Engineer). Max length: 5000.
  """
  @type individual_relationship :: %{
          optional(:director) => boolean() | nil,
          optional(:executive) => boolean() | nil,
          optional(:owner) => boolean() | nil,
          optional(:percent_ownership) => map() | nil,
          optional(:title) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_document` - A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
  * `document` - An identifying document, either a passport or local ID card.
  """
  @type individual_verification :: %{
          optional(:additional_document) => individual_verification_additional_document() | nil,
          optional(:document) => individual_verification_document() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
  * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
  """
  @type individual_verification_additional_document :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
  * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
  """
  @type individual_verification_document :: %{
          optional(:back) => String.t() | nil,
          optional(:front) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bacs_debit_payments` - Settings specific to Bacs Direct Debit.
  * `branding` - Settings used to apply the account's branding to email receipts, invoices, Checkout, and other products.
  * `card_issuing` - Settings specific to the account's use of the Card Issuing product.
  * `card_payments` - Settings specific to card charging on the account.
  * `invoices` - Settings specific to the account’s use of Invoices.
  * `payments` - Settings that apply across payment methods for charging on the account.
  * `payouts` - Settings specific to the account's payouts.
  * `treasury` - Settings specific to the account's Treasury FinancialAccounts.
  """
  @type settings :: %{
          optional(:bacs_debit_payments) => settings_bacs_debit_payments() | nil,
          optional(:branding) => settings_branding() | nil,
          optional(:card_issuing) => settings_card_issuing() | nil,
          optional(:card_payments) => settings_card_payments() | nil,
          optional(:invoices) => settings_invoices() | nil,
          optional(:payments) => settings_payments() | nil,
          optional(:payouts) => settings_payouts() | nil,
          optional(:treasury) => settings_treasury() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `display_name` - The Bacs Direct Debit Display Name for this account. For payments made with Bacs Direct Debit, this name appears on the mandate as the statement descriptor. Mobile banking apps display it as the name of the business. To use custom branding, set the Bacs Direct Debit Display Name during or right after creation. Custom branding incurs an additional monthly fee for the platform. If you don't set the display name before requesting Bacs capability, it's automatically set as "Stripe" and the account is onboarded to Stripe branding, which is free.
  """
  @type settings_bacs_debit_payments :: %{
          optional(:display_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `icon` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) An icon for the account. Must be square and at least 128px x 128px. Max length: 5000.
  * `logo` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A logo for the account that will be used in Checkout instead of the icon and without the account's name next to it if provided. Must be at least 128px x 128px. Max length: 5000.
  * `primary_color` - A CSS hex color value representing the primary branding color for this account. Max length: 5000.
  * `secondary_color` - A CSS hex color value representing the secondary branding color for this account. Max length: 5000.
  """
  @type settings_branding :: %{
          optional(:icon) => String.t() | nil,
          optional(:logo) => String.t() | nil,
          optional(:primary_color) => String.t() | nil,
          optional(:secondary_color) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tos_acceptance` - Details on the account's acceptance of the [Stripe Issuing Terms and Disclosures](https://stripe.com/issuing/connect/tos_acceptance).
  """
  @type settings_card_issuing :: %{
          optional(:tos_acceptance) => settings_card_issuing_tos_acceptance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp marking when the account representative accepted the service agreement. Format: Unix timestamp.
  * `ip` - The IP address from which the account representative accepted the service agreement.
  * `user_agent` - The user agent of the browser from which the account representative accepted the service agreement.
  """
  @type settings_card_issuing_tos_acceptance :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `decline_on` - Automatically declines certain charge types regardless of whether the card issuer accepted or declined the charge.
  * `statement_descriptor_prefix` - The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. `statement_descriptor_prefix` is useful for maximizing descriptor space for the dynamic portion. Max length: 10.
  * `statement_descriptor_prefix_kana` - The Kana variation of the default text that appears on credit card statements when a charge is made (Japan only). This field prefixes any dynamic `statement_descriptor_suffix_kana` specified on the charge. `statement_descriptor_prefix_kana` is useful for maximizing descriptor space for the dynamic portion.
  * `statement_descriptor_prefix_kanji` - The Kanji variation of the default text that appears on credit card statements when a charge is made (Japan only). This field prefixes any dynamic `statement_descriptor_suffix_kanji` specified on the charge. `statement_descriptor_prefix_kanji` is useful for maximizing descriptor space for the dynamic portion.
  """
  @type settings_card_payments :: %{
          optional(:decline_on) => settings_card_payments_decline_on() | nil,
          optional(:statement_descriptor_prefix) => String.t() | nil,
          optional(:statement_descriptor_prefix_kana) => map() | nil,
          optional(:statement_descriptor_prefix_kanji) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `avs_failure` - Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This setting only applies when a ZIP or postal code is provided and they fail bank verification.
  * `cvc_failure` - Whether Stripe automatically declines charges with an incorrect CVC. This setting only applies when a CVC is provided and it fails bank verification.
  """
  @type settings_card_payments_decline_on :: %{
          optional(:avs_failure) => boolean() | nil,
          optional(:cvc_failure) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `hosted_payment_method_save` - Whether to save the payment method after a payment is completed for a one-time invoice or a subscription invoice when the customer already has a default payment method on the hosted invoice page. Possible values: `always`, `never`, `offer`.
  """
  @type settings_invoices :: %{
          optional(:hosted_payment_method_save) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `statement_descriptor` - The default text that appears on statements for non-card charges outside of Japan. For card charges, if you don't set a `statement_descriptor_prefix`, this text is also used as the statement descriptor prefix. In that case, if concatenating the statement descriptor suffix causes the combined statement descriptor to exceed 22 characters, we truncate the `statement_descriptor` text to limit the full descriptor to 22 characters. For more information about statement descriptors and their requirements, see the [account settings documentation](https://docs.stripe.com/get-started/account/statement-descriptors). Max length: 22.
  * `statement_descriptor_kana` - The Kana variation of `statement_descriptor` used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors). Max length: 22.
  * `statement_descriptor_kanji` - The Kanji variation of `statement_descriptor` used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors). Max length: 22.
  """
  @type settings_payments :: %{
          optional(:statement_descriptor) => String.t() | nil,
          optional(:statement_descriptor_kana) => String.t() | nil,
          optional(:statement_descriptor_kanji) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `debit_negative_balances` - A Boolean indicating whether Stripe should try to reclaim negative balances from an attached bank account. For details, see [Understanding Connect Account Balances](https://stripe.com/connect/account-balances).
  * `schedule` - Details on when funds from charges are available, and when they are paid out to an external account. For details, see our [Setting Bank and Debit Card Payouts](https://stripe.com/connect/bank-transfers#payout-information) documentation.
  * `statement_descriptor` - The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard. Max length: 22.
  """
  @type settings_payouts :: %{
          optional(:debit_negative_balances) => boolean() | nil,
          optional(:schedule) => settings_payouts_schedule() | nil,
          optional(:statement_descriptor) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `delay_days` - The number of days charge funds are held before being paid out. May also be set to `minimum`, representing the lowest available value for the account country. Default is `minimum`. The `delay_days` parameter remains at the last configured value if `interval` is `manual`. [Learn more about controlling payout delay days](https://stripe.com/connect/manage-payout-schedule).
  * `interval` - How frequently available funds are paid out. One of: `daily`, `manual`, `weekly`, or `monthly`. Default is `daily`. Possible values: `daily`, `manual`, `monthly`, `weekly`. Max length: 5000.
  * `monthly_anchor` - The day of the month when available funds are paid out, specified as a number between 1--31. Payouts nominally scheduled between the 29th and 31st of the month are instead sent on the last day of a shorter month. Required and applicable only if `interval` is `monthly`.
  * `monthly_payout_days` - The days of the month when available funds are paid out, specified as an array of numbers between 1--31. Payouts nominally scheduled between the 29th and 31st of the month are instead sent on the last day of a shorter month. Required and applicable only if `interval` is `monthly` and `monthly_anchor` is not set.
  * `weekly_anchor` - The day of the week when available funds are paid out, specified as `monday`, `tuesday`, etc. Required and applicable only if `interval` is `weekly`. Possible values: `friday`, `monday`, `saturday`, `sunday`, `thursday`, `tuesday`, `wednesday`. Max length: 5000.
  * `weekly_payout_days` - The days of the week when available funds are paid out, specified as an array, e.g., [`monday`, `tuesday`]. Required and applicable only if `interval` is `weekly`.
  """
  @type settings_payouts_schedule :: %{
          optional(:delay_days) => map() | nil,
          optional(:interval) => String.t() | nil,
          optional(:monthly_anchor) => integer() | nil,
          optional(:monthly_payout_days) => [integer()] | nil,
          optional(:weekly_anchor) => String.t() | nil,
          optional(:weekly_payout_days) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tos_acceptance` - Details on the account's acceptance of the Stripe Treasury Services Agreement.
  """
  @type settings_treasury :: %{
          optional(:tos_acceptance) => settings_treasury_tos_acceptance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp marking when the account representative accepted the service agreement. Format: Unix timestamp.
  * `ip` - The IP address from which the account representative accepted the service agreement.
  * `user_agent` - The user agent of the browser from which the account representative accepted the service agreement.
  """
  @type settings_treasury_tos_acceptance :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:user_agent) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `date` - The Unix timestamp marking when the account representative accepted their service agreement. Format: Unix timestamp.
  * `ip` - The IP address from which the account representative accepted their service agreement.
  * `service_agreement` - The user's service agreement type. Max length: 5000.
  * `user_agent` - The user agent of the browser from which the account representative accepted their service agreement. Max length: 5000.
  """
  @type tos_acceptance :: %{
          optional(:date) => integer() | nil,
          optional(:ip) => String.t() | nil,
          optional(:service_agreement) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }
end
