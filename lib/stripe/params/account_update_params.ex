# File generated from our OpenAPI spec
defmodule Stripe.Params.AccountUpdateParams do
  @moduledoc "Parameters for account update."

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
  """
  @type t :: %__MODULE__{
          account_token: String.t() | nil,
          business_profile: __MODULE__.BusinessProfile.t() | nil,
          business_type: String.t() | nil,
          capabilities: __MODULE__.Capabilities.t() | nil,
          company: __MODULE__.Company.t() | nil,
          default_currency: String.t() | nil,
          documents: __MODULE__.Documents.t() | nil,
          email: String.t() | nil,
          expand: [String.t()] | nil,
          external_account: String.t() | nil,
          groups: __MODULE__.Groups.t() | nil,
          individual: __MODULE__.Individual.t() | nil,
          metadata: map() | nil,
          settings: __MODULE__.Settings.t() | nil,
          tos_acceptance: __MODULE__.TosAcceptance.t() | nil
        }

  defstruct [
    :account_token,
    :business_profile,
    :business_type,
    :capabilities,
    :company,
    :default_currency,
    :documents,
    :email,
    :expand,
    :external_account,
    :groups,
    :individual,
    :metadata,
    :settings,
    :tos_acceptance
  ]

  defmodule BusinessProfile do
    @moduledoc "Nested parameters."

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
    @type t :: %__MODULE__{
            annual_revenue: __MODULE__.AnnualRevenue.t() | nil,
            estimated_worker_count: integer() | nil,
            mcc: String.t() | nil,
            minority_owned_business_designation: [String.t()] | nil,
            monthly_estimated_revenue: __MODULE__.MonthlyEstimatedRevenue.t() | nil,
            name: String.t() | nil,
            product_description: String.t() | nil,
            support_address: __MODULE__.SupportAddress.t() | nil,
            support_email: String.t() | nil,
            support_phone: String.t() | nil,
            support_url: map() | nil,
            url: String.t() | nil
          }
    defstruct [
      :annual_revenue,
      :estimated_worker_count,
      :mcc,
      :minority_owned_business_designation,
      :monthly_estimated_revenue,
      :name,
      :product_description,
      :support_address,
      :support_email,
      :support_phone,
      :support_url,
      :url
    ]

    defmodule AnnualRevenue do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount` - A non-negative integer representing the amount in the [smallest currency unit](https://stripe.com/currencies#zero-decimal).
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `fiscal_year_end` - The close-out date of the preceding fiscal year in ISO 8601 format. E.g. 2023-12-31 for the 31st of December, 2023. Max length: 5000.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              fiscal_year_end: String.t() | nil
            }
      defstruct [:amount, :currency, :fiscal_year_end]
    end

    defmodule MonthlyEstimatedRevenue do
      @moduledoc "Nested parameters."

      @typedoc """
      * `amount` - A non-negative integer representing how much to charge in the [smallest currency unit](https://stripe.com/currencies#zero-decimal).
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil
            }
      defstruct [:amount, :currency]
    end

    defmodule SupportAddress do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 100.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
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

  defmodule Capabilities do
    @moduledoc "Nested parameters."

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
    * `us_bank_account_ach_payments` - The us_bank_account_ach_payments capability.
    * `us_bank_transfer_payments` - The us_bank_transfer_payments capability.
    * `zip_payments` - The zip_payments capability.
    """
    @type t :: %__MODULE__{
            acss_debit_payments: __MODULE__.AcssDebitPayments.t() | nil,
            affirm_payments: __MODULE__.AffirmPayments.t() | nil,
            afterpay_clearpay_payments: __MODULE__.AfterpayClearpayPayments.t() | nil,
            alma_payments: __MODULE__.AlmaPayments.t() | nil,
            amazon_pay_payments: __MODULE__.AmazonPayPayments.t() | nil,
            au_becs_debit_payments: __MODULE__.AuBecsDebitPayments.t() | nil,
            bacs_debit_payments: __MODULE__.BacsDebitPayments.t() | nil,
            bancontact_payments: __MODULE__.BancontactPayments.t() | nil,
            bank_transfer_payments: __MODULE__.BankTransferPayments.t() | nil,
            billie_payments: __MODULE__.BilliePayments.t() | nil,
            blik_payments: __MODULE__.BlikPayments.t() | nil,
            boleto_payments: __MODULE__.BoletoPayments.t() | nil,
            card_issuing: __MODULE__.CardIssuing.t() | nil,
            card_payments: __MODULE__.CardPayments.t() | nil,
            cartes_bancaires_payments: __MODULE__.CartesBancairesPayments.t() | nil,
            cashapp_payments: __MODULE__.CashappPayments.t() | nil,
            crypto_payments: __MODULE__.CryptoPayments.t() | nil,
            eps_payments: __MODULE__.EpsPayments.t() | nil,
            fpx_payments: __MODULE__.FpxPayments.t() | nil,
            gb_bank_transfer_payments: __MODULE__.GbBankTransferPayments.t() | nil,
            giropay_payments: __MODULE__.GiropayPayments.t() | nil,
            grabpay_payments: __MODULE__.GrabpayPayments.t() | nil,
            ideal_payments: __MODULE__.IdealPayments.t() | nil,
            india_international_payments: __MODULE__.IndiaInternationalPayments.t() | nil,
            jcb_payments: __MODULE__.JcbPayments.t() | nil,
            jp_bank_transfer_payments: __MODULE__.JpBankTransferPayments.t() | nil,
            kakao_pay_payments: __MODULE__.KakaoPayPayments.t() | nil,
            klarna_payments: __MODULE__.KlarnaPayments.t() | nil,
            konbini_payments: __MODULE__.KonbiniPayments.t() | nil,
            kr_card_payments: __MODULE__.KrCardPayments.t() | nil,
            legacy_payments: __MODULE__.LegacyPayments.t() | nil,
            link_payments: __MODULE__.LinkPayments.t() | nil,
            mb_way_payments: __MODULE__.MbWayPayments.t() | nil,
            mobilepay_payments: __MODULE__.MobilepayPayments.t() | nil,
            multibanco_payments: __MODULE__.MultibancoPayments.t() | nil,
            mx_bank_transfer_payments: __MODULE__.MxBankTransferPayments.t() | nil,
            naver_pay_payments: __MODULE__.NaverPayPayments.t() | nil,
            nz_bank_account_becs_debit_payments:
              __MODULE__.NzBankAccountBecsDebitPayments.t() | nil,
            oxxo_payments: __MODULE__.OxxoPayments.t() | nil,
            p24_payments: __MODULE__.P24Payments.t() | nil,
            pay_by_bank_payments: __MODULE__.PayByBankPayments.t() | nil,
            payco_payments: __MODULE__.PaycoPayments.t() | nil,
            paynow_payments: __MODULE__.PaynowPayments.t() | nil,
            payto_payments: __MODULE__.PaytoPayments.t() | nil,
            pix_payments: __MODULE__.PixPayments.t() | nil,
            promptpay_payments: __MODULE__.PromptpayPayments.t() | nil,
            revolut_pay_payments: __MODULE__.RevolutPayPayments.t() | nil,
            samsung_pay_payments: __MODULE__.SamsungPayPayments.t() | nil,
            satispay_payments: __MODULE__.SatispayPayments.t() | nil,
            sepa_bank_transfer_payments: __MODULE__.SepaBankTransferPayments.t() | nil,
            sepa_debit_payments: __MODULE__.SepaDebitPayments.t() | nil,
            sofort_payments: __MODULE__.SofortPayments.t() | nil,
            swish_payments: __MODULE__.SwishPayments.t() | nil,
            tax_reporting_us_1099_k: __MODULE__.TaxReportingUs1099K.t() | nil,
            tax_reporting_us_1099_misc: __MODULE__.TaxReportingUs1099Misc.t() | nil,
            transfers: __MODULE__.Transfers.t() | nil,
            treasury: __MODULE__.Treasury.t() | nil,
            twint_payments: __MODULE__.TwintPayments.t() | nil,
            us_bank_account_ach_payments: __MODULE__.UsBankAccountAchPayments.t() | nil,
            us_bank_transfer_payments: __MODULE__.UsBankTransferPayments.t() | nil,
            zip_payments: __MODULE__.ZipPayments.t() | nil
          }
    defstruct [
      :acss_debit_payments,
      :affirm_payments,
      :afterpay_clearpay_payments,
      :alma_payments,
      :amazon_pay_payments,
      :au_becs_debit_payments,
      :bacs_debit_payments,
      :bancontact_payments,
      :bank_transfer_payments,
      :billie_payments,
      :blik_payments,
      :boleto_payments,
      :card_issuing,
      :card_payments,
      :cartes_bancaires_payments,
      :cashapp_payments,
      :crypto_payments,
      :eps_payments,
      :fpx_payments,
      :gb_bank_transfer_payments,
      :giropay_payments,
      :grabpay_payments,
      :ideal_payments,
      :india_international_payments,
      :jcb_payments,
      :jp_bank_transfer_payments,
      :kakao_pay_payments,
      :klarna_payments,
      :konbini_payments,
      :kr_card_payments,
      :legacy_payments,
      :link_payments,
      :mb_way_payments,
      :mobilepay_payments,
      :multibanco_payments,
      :mx_bank_transfer_payments,
      :naver_pay_payments,
      :nz_bank_account_becs_debit_payments,
      :oxxo_payments,
      :p24_payments,
      :pay_by_bank_payments,
      :payco_payments,
      :paynow_payments,
      :payto_payments,
      :pix_payments,
      :promptpay_payments,
      :revolut_pay_payments,
      :samsung_pay_payments,
      :satispay_payments,
      :sepa_bank_transfer_payments,
      :sepa_debit_payments,
      :sofort_payments,
      :swish_payments,
      :tax_reporting_us_1099_k,
      :tax_reporting_us_1099_misc,
      :transfers,
      :treasury,
      :twint_payments,
      :us_bank_account_ach_payments,
      :us_bank_transfer_payments,
      :zip_payments
    ]

    defmodule AcssDebitPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule AffirmPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule AfterpayClearpayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule AlmaPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule AmazonPayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule AuBecsDebitPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule BacsDebitPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule BancontactPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule BankTransferPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule BilliePayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule BlikPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule BoletoPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule CardIssuing do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule CardPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule CartesBancairesPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule CashappPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule CryptoPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule EpsPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule FpxPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule GbBankTransferPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule GiropayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule GrabpayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule IdealPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule IndiaInternationalPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule JcbPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule JpBankTransferPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule KakaoPayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule KlarnaPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule KonbiniPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule KrCardPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule LegacyPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule LinkPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule MbWayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule MobilepayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule MultibancoPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule MxBankTransferPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule NaverPayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule NzBankAccountBecsDebitPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule OxxoPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule P24Payments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule PayByBankPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule PaycoPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule PaynowPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule PaytoPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule PixPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule PromptpayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule RevolutPayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule SamsungPayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule SatispayPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule SepaBankTransferPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule SepaDebitPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule SofortPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule SwishPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule TaxReportingUs1099K do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule TaxReportingUs1099Misc do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule Transfers do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule Treasury do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule TwintPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule UsBankAccountAchPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule UsBankTransferPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end

    defmodule ZipPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `requested` - Passing true requests the capability for the account, if it is not already requested. A requested capability may not immediately become active. Any requirements to activate the capability are returned in the `requirements` arrays.
      """
      @type t :: %__MODULE__{
              requested: boolean() | nil
            }
      defstruct [:requested]
    end
  end

  defmodule Company do
    @moduledoc "Nested parameters."

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
    * `registration_date`
    * `registration_number` - The identification number given to a company when it is registered or incorporated, if distinct from the identification number used for filing taxes. (Examples are the CIN for companies and LLP IN for partnerships in India, and the Company Registration Number in Hong Kong). Max length: 5000.
    * `representative_declaration` - This hash is used to attest that the representative is authorized to act as the representative of their legal entity.
    * `structure` - The category identifying the legal structure of the company or legal entity. See [Business structure](https://stripe.com/connect/identity-verification#business-structure) for more details. Pass an empty string to unset this value. Possible values: `free_zone_establishment`, `free_zone_llc`, `government_instrumentality`, `governmental_unit`, `incorporated_non_profit`, `incorporated_partnership`, `limited_liability_partnership`, `llc`, `multi_member_llc`, `private_company`, `private_corporation`, `private_partnership`, `public_company`, `public_corporation`, `public_partnership`, `registered_charity`, `single_member_llc`, `sole_establishment`, `sole_proprietorship`, `tax_exempt_government_instrumentality`, `unincorporated_association`, `unincorporated_non_profit`, `unincorporated_partnership`.
    * `tax_id` - The business ID number of the company, as appropriate for the company’s country. (Examples are an Employer ID Number in the U.S., a Business Number in Canada, or a Company Number in the UK.) Max length: 5000.
    * `tax_id_registrar` - The jurisdiction in which the `tax_id` is registered (Germany-based companies only). Max length: 5000.
    * `vat_id` - The VAT number of the company. Max length: 5000.
    * `verification` - Information on the verification state of the company.
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            address_kana: __MODULE__.AddressKana.t() | nil,
            address_kanji: __MODULE__.AddressKanji.t() | nil,
            directors_provided: boolean() | nil,
            directorship_declaration: __MODULE__.DirectorshipDeclaration.t() | nil,
            executives_provided: boolean() | nil,
            export_license_id: String.t() | nil,
            export_purpose_code: String.t() | nil,
            name: String.t() | nil,
            name_kana: String.t() | nil,
            name_kanji: String.t() | nil,
            owners_provided: boolean() | nil,
            ownership_declaration: __MODULE__.OwnershipDeclaration.t() | nil,
            ownership_exemption_reason: String.t() | nil,
            phone: String.t() | nil,
            registration_date: map() | nil,
            registration_number: String.t() | nil,
            representative_declaration: __MODULE__.RepresentativeDeclaration.t() | nil,
            structure: String.t() | nil,
            tax_id: String.t() | nil,
            tax_id_registrar: String.t() | nil,
            vat_id: String.t() | nil,
            verification: __MODULE__.Verification.t() | nil
          }
    defstruct [
      :address,
      :address_kana,
      :address_kanji,
      :directors_provided,
      :directorship_declaration,
      :executives_provided,
      :export_license_id,
      :export_purpose_code,
      :name,
      :name_kana,
      :name_kanji,
      :owners_provided,
      :ownership_declaration,
      :ownership_exemption_reason,
      :phone,
      :registration_date,
      :registration_number,
      :representative_declaration,
      :structure,
      :tax_id,
      :tax_id_registrar,
      :vat_id,
      :verification
    ]

    defmodule Address do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 100.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
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

    defmodule AddressKana do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City or ward. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Block or building number. Max length: 5000.
      * `line2` - Building details. Max length: 5000.
      * `postal_code` - Postal code. Max length: 5000.
      * `state` - Prefecture. Max length: 5000.
      * `town` - Town or cho-me. Max length: 5000.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil,
              town: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
    end

    defmodule AddressKanji do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City or ward. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Block or building number. Max length: 5000.
      * `line2` - Building details. Max length: 5000.
      * `postal_code` - Postal code. Max length: 5000.
      * `state` - Prefecture. Max length: 5000.
      * `town` - Town or cho-me. Max length: 5000.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil,
              town: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
    end

    defmodule DirectorshipDeclaration do
      @moduledoc "Nested parameters."

      @typedoc """
      * `date` - The Unix timestamp marking when the directorship declaration attestation was made. Format: Unix timestamp.
      * `ip` - The IP address from which the directorship declaration attestation was made.
      * `user_agent` - The user agent of the browser from which the directorship declaration attestation was made. Max length: 5000.
      """
      @type t :: %__MODULE__{
              date: integer() | nil,
              ip: String.t() | nil,
              user_agent: String.t() | nil
            }
      defstruct [:date, :ip, :user_agent]
    end

    defmodule OwnershipDeclaration do
      @moduledoc "Nested parameters."

      @typedoc """
      * `date` - The Unix timestamp marking when the beneficial owner attestation was made. Format: Unix timestamp.
      * `ip` - The IP address from which the beneficial owner attestation was made.
      * `user_agent` - The user agent of the browser from which the beneficial owner attestation was made. Max length: 5000.
      """
      @type t :: %__MODULE__{
              date: integer() | nil,
              ip: String.t() | nil,
              user_agent: String.t() | nil
            }
      defstruct [:date, :ip, :user_agent]
    end

    defmodule RepresentativeDeclaration do
      @moduledoc "Nested parameters."

      @typedoc """
      * `date` - The Unix timestamp marking when the representative declaration attestation was made. Format: Unix timestamp.
      * `ip` - The IP address from which the representative declaration attestation was made.
      * `user_agent` - The user agent of the browser from which the representative declaration attestation was made. Max length: 5000.
      """
      @type t :: %__MODULE__{
              date: integer() | nil,
              ip: String.t() | nil,
              user_agent: String.t() | nil
            }
      defstruct [:date, :ip, :user_agent]
    end

    defmodule Verification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `document` - A document verifying the business.
      """
      @type t :: %__MODULE__{
              document: __MODULE__.Document.t() | nil
            }
      defstruct [:document]

      defmodule Document do
        @moduledoc "Nested parameters."

        @typedoc """
        * `back` - The back of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `additional_verification`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
        * `front` - The front of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `additional_verification`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
        """
        @type t :: %__MODULE__{
                back: String.t() | nil,
                front: String.t() | nil
              }
        defstruct [:back, :front]
      end
    end
  end

  defmodule Documents do
    @moduledoc "Nested parameters."

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
    @type t :: %__MODULE__{
            bank_account_ownership_verification:
              __MODULE__.BankAccountOwnershipVerification.t() | nil,
            company_license: __MODULE__.CompanyLicense.t() | nil,
            company_memorandum_of_association:
              __MODULE__.CompanyMemorandumOfAssociation.t() | nil,
            company_ministerial_decree: __MODULE__.CompanyMinisterialDecree.t() | nil,
            company_registration_verification:
              __MODULE__.CompanyRegistrationVerification.t() | nil,
            company_tax_id_verification: __MODULE__.CompanyTaxIdVerification.t() | nil,
            proof_of_address: __MODULE__.ProofOfAddress.t() | nil,
            proof_of_registration: __MODULE__.ProofOfRegistration.t() | nil,
            proof_of_ultimate_beneficial_ownership:
              __MODULE__.ProofOfUltimateBeneficialOwnership.t() | nil
          }
    defstruct [
      :bank_account_ownership_verification,
      :company_license,
      :company_memorandum_of_association,
      :company_ministerial_decree,
      :company_registration_verification,
      :company_tax_id_verification,
      :proof_of_address,
      :proof_of_registration,
      :proof_of_ultimate_beneficial_ownership
    ]

    defmodule BankAccountOwnershipVerification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil
            }
      defstruct [:files]
    end

    defmodule CompanyLicense do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil
            }
      defstruct [:files]
    end

    defmodule CompanyMemorandumOfAssociation do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil
            }
      defstruct [:files]
    end

    defmodule CompanyMinisterialDecree do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil
            }
      defstruct [:files]
    end

    defmodule CompanyRegistrationVerification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil
            }
      defstruct [:files]
    end

    defmodule CompanyTaxIdVerification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil
            }
      defstruct [:files]
    end

    defmodule ProofOfAddress do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil
            }
      defstruct [:files]
    end

    defmodule ProofOfRegistration do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      * `signer` - Information regarding the person signing the document if applicable.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil,
              signer: __MODULE__.Signer.t() | nil
            }
      defstruct [:files, :signer]

      defmodule Signer do
        @moduledoc "Nested parameters."

        @typedoc """
        * `person` - The token of the person signing the document, if applicable. Max length: 5000.
        """
        @type t :: %__MODULE__{
                person: String.t() | nil
              }
        defstruct [:person]
      end
    end

    defmodule ProofOfUltimateBeneficialOwnership do
      @moduledoc "Nested parameters."

      @typedoc """
      * `files` - One or more document ids returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `account_requirement`.
      * `signer` - Information regarding the person signing the document if applicable.
      """
      @type t :: %__MODULE__{
              files: [String.t()] | nil,
              signer: __MODULE__.Signer.t() | nil
            }
      defstruct [:files, :signer]

      defmodule Signer do
        @moduledoc "Nested parameters."

        @typedoc """
        * `person` - The token of the person signing the document, if applicable. Max length: 5000.
        """
        @type t :: %__MODULE__{
                person: String.t() | nil
              }
        defstruct [:person]
      end
    end
  end

  defmodule Groups do
    @moduledoc "Nested parameters."

    @typedoc """
    * `payments_pricing` - The group the account is in to determine their payments pricing, and null if the account is on customized pricing. [See the Platform pricing tool documentation](https://docs.stripe.com/connect/platform-pricing-tools) for details.
    """
    @type t :: %__MODULE__{
            payments_pricing: map() | nil
          }
    defstruct [:payments_pricing]
  end

  defmodule Individual do
    @moduledoc "Nested parameters."

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
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            address_kana: __MODULE__.AddressKana.t() | nil,
            address_kanji: __MODULE__.AddressKanji.t() | nil,
            dob: map() | nil,
            email: String.t() | nil,
            first_name: String.t() | nil,
            first_name_kana: String.t() | nil,
            first_name_kanji: String.t() | nil,
            full_name_aliases: map() | nil,
            gender: String.t() | nil,
            id_number: String.t() | nil,
            id_number_secondary: String.t() | nil,
            last_name: String.t() | nil,
            last_name_kana: String.t() | nil,
            last_name_kanji: String.t() | nil,
            maiden_name: String.t() | nil,
            metadata: map() | nil,
            phone: String.t() | nil,
            political_exposure: String.t() | nil,
            registered_address: __MODULE__.RegisteredAddress.t() | nil,
            relationship: __MODULE__.Relationship.t() | nil,
            ssn_last_4: String.t() | nil,
            verification: __MODULE__.Verification.t() | nil
          }
    defstruct [
      :address,
      :address_kana,
      :address_kanji,
      :dob,
      :email,
      :first_name,
      :first_name_kana,
      :first_name_kanji,
      :full_name_aliases,
      :gender,
      :id_number,
      :id_number_secondary,
      :last_name,
      :last_name_kana,
      :last_name_kanji,
      :maiden_name,
      :metadata,
      :phone,
      :political_exposure,
      :registered_address,
      :relationship,
      :ssn_last_4,
      :verification
    ]

    defmodule Address do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 100.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
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

    defmodule AddressKana do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City or ward. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Block or building number. Max length: 5000.
      * `line2` - Building details. Max length: 5000.
      * `postal_code` - Postal code. Max length: 5000.
      * `state` - Prefecture. Max length: 5000.
      * `town` - Town or cho-me. Max length: 5000.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil,
              town: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
    end

    defmodule AddressKanji do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City or ward. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Block or building number. Max length: 5000.
      * `line2` - Building details. Max length: 5000.
      * `postal_code` - Postal code. Max length: 5000.
      * `state` - Prefecture. Max length: 5000.
      * `town` - Town or cho-me. Max length: 5000.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil,
              town: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
    end

    defmodule RegisteredAddress do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 100.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 200.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 200.
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

    defmodule Relationship do
      @moduledoc "Nested parameters."

      @typedoc """
      * `director` - Whether the person is a director of the account's legal entity. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
      * `executive` - Whether the person has significant responsibility to control, manage, or direct the organization.
      * `owner` - Whether the person is an owner of the account’s legal entity.
      * `percent_ownership` - The percent owned by the person of the account's legal entity.
      * `title` - The person's title (e.g., CEO, Support Engineer). Max length: 5000.
      """
      @type t :: %__MODULE__{
              director: boolean() | nil,
              executive: boolean() | nil,
              owner: boolean() | nil,
              percent_ownership: map() | nil,
              title: String.t() | nil
            }
      defstruct [:director, :executive, :owner, :percent_ownership, :title]
    end

    defmodule Verification do
      @moduledoc "Nested parameters."

      @typedoc """
      * `additional_document` - A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
      * `document` - An identifying document, either a passport or local ID card.
      """
      @type t :: %__MODULE__{
              additional_document: __MODULE__.AdditionalDocument.t() | nil,
              document: __MODULE__.Document.t() | nil
            }
      defstruct [:additional_document, :document]

      defmodule AdditionalDocument do
        @moduledoc "Nested parameters."

        @typedoc """
        * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
        * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
        """
        @type t :: %__MODULE__{
                back: String.t() | nil,
                front: String.t() | nil
              }
        defstruct [:back, :front]
      end

      defmodule Document do
        @moduledoc "Nested parameters."

        @typedoc """
        * `back` - The back of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
        * `front` - The front of an ID returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size. Max length: 500.
        """
        @type t :: %__MODULE__{
                back: String.t() | nil,
                front: String.t() | nil
              }
        defstruct [:back, :front]
      end
    end
  end

  defmodule Settings do
    @moduledoc "Nested parameters."

    @typedoc """
    * `bacs_debit_payments` - Settings specific to Bacs Direct Debit payments.
    * `branding` - Settings used to apply the account's branding to email receipts, invoices, Checkout, and other products.
    * `card_issuing` - Settings specific to the account's use of the Card Issuing product.
    * `card_payments` - Settings specific to card charging on the account.
    * `invoices` - Settings specific to the account's use of Invoices.
    * `payments` - Settings that apply across payment methods for charging on the account.
    * `payouts` - Settings specific to the account's payouts.
    * `treasury` - Settings specific to the account's Treasury FinancialAccounts.
    """
    @type t :: %__MODULE__{
            bacs_debit_payments: __MODULE__.BacsDebitPayments.t() | nil,
            branding: __MODULE__.Branding.t() | nil,
            card_issuing: __MODULE__.CardIssuing.t() | nil,
            card_payments: __MODULE__.CardPayments.t() | nil,
            invoices: __MODULE__.Invoices.t() | nil,
            payments: __MODULE__.Payments.t() | nil,
            payouts: __MODULE__.Payouts.t() | nil,
            treasury: __MODULE__.Treasury.t() | nil
          }
    defstruct [
      :bacs_debit_payments,
      :branding,
      :card_issuing,
      :card_payments,
      :invoices,
      :payments,
      :payouts,
      :treasury
    ]

    defmodule BacsDebitPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `display_name` - The Bacs Direct Debit Display Name for this account. For payments made with Bacs Direct Debit, this name appears on the mandate as the statement descriptor. Mobile banking apps display it as the name of the business. To use custom branding, set the Bacs Direct Debit Display Name during or right after creation. Custom branding incurs an additional monthly fee for the platform. If you don't set the display name before requesting Bacs capability, it's automatically set as "Stripe" and the account is onboarded to Stripe branding, which is free.
      """
      @type t :: %__MODULE__{
              display_name: String.t() | nil
            }
      defstruct [:display_name]
    end

    defmodule Branding do
      @moduledoc "Nested parameters."

      @typedoc """
      * `icon` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) An icon for the account. Must be square and at least 128px x 128px. Max length: 5000.
      * `logo` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A logo for the account that will be used in Checkout instead of the icon and without the account's name next to it if provided. Must be at least 128px x 128px. Max length: 5000.
      * `primary_color` - A CSS hex color value representing the primary branding color for this account. Max length: 5000.
      * `secondary_color` - A CSS hex color value representing the secondary branding color for this account. Max length: 5000.
      """
      @type t :: %__MODULE__{
              icon: String.t() | nil,
              logo: String.t() | nil,
              primary_color: String.t() | nil,
              secondary_color: String.t() | nil
            }
      defstruct [:icon, :logo, :primary_color, :secondary_color]
    end

    defmodule CardIssuing do
      @moduledoc "Nested parameters."

      @typedoc """
      * `tos_acceptance` - Details on the account's acceptance of the [Stripe Issuing Terms and Disclosures](https://stripe.com/issuing/connect/tos_acceptance).
      """
      @type t :: %__MODULE__{
              tos_acceptance: __MODULE__.TosAcceptance.t() | nil
            }
      defstruct [:tos_acceptance]

      defmodule TosAcceptance do
        @moduledoc "Nested parameters."

        @typedoc """
        * `date` - The Unix timestamp marking when the account representative accepted the service agreement. Format: Unix timestamp.
        * `ip` - The IP address from which the account representative accepted the service agreement.
        * `user_agent` - The user agent of the browser from which the account representative accepted the service agreement.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: map() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end
    end

    defmodule CardPayments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `decline_on` - Automatically declines certain charge types regardless of whether the card issuer accepted or declined the charge.
      * `statement_descriptor_prefix` - The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. `statement_descriptor_prefix` is useful for maximizing descriptor space for the dynamic portion. Max length: 10.
      * `statement_descriptor_prefix_kana` - The Kana variation of the default text that appears on credit card statements when a charge is made (Japan only). This field prefixes any dynamic `statement_descriptor_suffix_kana` specified on the charge. `statement_descriptor_prefix_kana` is useful for maximizing descriptor space for the dynamic portion.
      * `statement_descriptor_prefix_kanji` - The Kanji variation of the default text that appears on credit card statements when a charge is made (Japan only). This field prefixes any dynamic `statement_descriptor_suffix_kanji` specified on the charge. `statement_descriptor_prefix_kanji` is useful for maximizing descriptor space for the dynamic portion.
      """
      @type t :: %__MODULE__{
              decline_on: __MODULE__.DeclineOn.t() | nil,
              statement_descriptor_prefix: String.t() | nil,
              statement_descriptor_prefix_kana: map() | nil,
              statement_descriptor_prefix_kanji: map() | nil
            }
      defstruct [
        :decline_on,
        :statement_descriptor_prefix,
        :statement_descriptor_prefix_kana,
        :statement_descriptor_prefix_kanji
      ]

      defmodule DeclineOn do
        @moduledoc "Nested parameters."

        @typedoc """
        * `avs_failure` - Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This setting only applies when a ZIP or postal code is provided and they fail bank verification.
        * `cvc_failure` - Whether Stripe automatically declines charges with an incorrect CVC. This setting only applies when a CVC is provided and it fails bank verification.
        """
        @type t :: %__MODULE__{
                avs_failure: boolean() | nil,
                cvc_failure: boolean() | nil
              }
        defstruct [:avs_failure, :cvc_failure]
      end
    end

    defmodule Invoices do
      @moduledoc "Nested parameters."

      @typedoc """
      * `default_account_tax_ids` - The list of default Account Tax IDs to automatically include on invoices. Account Tax IDs get added when an invoice is finalized.
      * `hosted_payment_method_save` - Whether to save the payment method after a payment is completed for a one-time invoice or a subscription invoice when the customer already has a default payment method on the hosted invoice page. Possible values: `always`, `never`, `offer`.
      """
      @type t :: %__MODULE__{
              default_account_tax_ids: map() | nil,
              hosted_payment_method_save: String.t() | nil
            }
      defstruct [:default_account_tax_ids, :hosted_payment_method_save]
    end

    defmodule Payments do
      @moduledoc "Nested parameters."

      @typedoc """
      * `statement_descriptor` - The default text that appears on statements for non-card charges outside of Japan. For card charges, if you don't set a `statement_descriptor_prefix`, this text is also used as the statement descriptor prefix. In that case, if concatenating the statement descriptor suffix causes the combined statement descriptor to exceed 22 characters, we truncate the `statement_descriptor` text to limit the full descriptor to 22 characters. For more information about statement descriptors and their requirements, see the [account settings documentation](https://docs.stripe.com/get-started/account/statement-descriptors). Max length: 22.
      * `statement_descriptor_kana` - The Kana variation of `statement_descriptor` used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors). Max length: 22.
      * `statement_descriptor_kanji` - The Kanji variation of `statement_descriptor` used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors). Max length: 22.
      """
      @type t :: %__MODULE__{
              statement_descriptor: String.t() | nil,
              statement_descriptor_kana: String.t() | nil,
              statement_descriptor_kanji: String.t() | nil
            }
      defstruct [:statement_descriptor, :statement_descriptor_kana, :statement_descriptor_kanji]
    end

    defmodule Payouts do
      @moduledoc "Nested parameters."

      @typedoc """
      * `debit_negative_balances` - A Boolean indicating whether Stripe should try to reclaim negative balances from an attached bank account. For details, see [Understanding Connect Account Balances](https://stripe.com/connect/account-balances).
      * `schedule` - Details on when funds from charges are available, and when they are paid out to an external account. For details, see our [Setting Bank and Debit Card Payouts](https://stripe.com/connect/bank-transfers#payout-information) documentation.
      * `statement_descriptor` - The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard. Max length: 22.
      """
      @type t :: %__MODULE__{
              debit_negative_balances: boolean() | nil,
              schedule: __MODULE__.Schedule.t() | nil,
              statement_descriptor: String.t() | nil
            }
      defstruct [:debit_negative_balances, :schedule, :statement_descriptor]

      defmodule Schedule do
        @moduledoc "Nested parameters."

        @typedoc """
        * `delay_days` - The number of days charge funds are held before being paid out. May also be set to `minimum`, representing the lowest available value for the account country. Default is `minimum`. The `delay_days` parameter remains at the last configured value if `interval` is `manual`. [Learn more about controlling payout delay days](https://stripe.com/connect/manage-payout-schedule).
        * `interval` - How frequently available funds are paid out. One of: `daily`, `manual`, `weekly`, or `monthly`. Default is `daily`. Possible values: `daily`, `manual`, `monthly`, `weekly`. Max length: 5000.
        * `monthly_anchor` - The day of the month when available funds are paid out, specified as a number between 1--31. Payouts nominally scheduled between the 29th and 31st of the month are instead sent on the last day of a shorter month. Required and applicable only if `interval` is `monthly`.
        * `monthly_payout_days` - The days of the month when available funds are paid out, specified as an array of numbers between 1--31. Payouts nominally scheduled between the 29th and 31st of the month are instead sent on the last day of a shorter month. Required and applicable only if `interval` is `monthly` and `monthly_anchor` is not set.
        * `weekly_anchor` - The day of the week when available funds are paid out, specified as `monday`, `tuesday`, etc. Required and applicable only if `interval` is `weekly`. Possible values: `friday`, `monday`, `saturday`, `sunday`, `thursday`, `tuesday`, `wednesday`. Max length: 5000.
        * `weekly_payout_days` - The days of the week when available funds are paid out, specified as an array, e.g., [`monday`, `tuesday`]. Required and applicable only if `interval` is `weekly`.
        """
        @type t :: %__MODULE__{
                delay_days: map() | nil,
                interval: String.t() | nil,
                monthly_anchor: integer() | nil,
                monthly_payout_days: [integer()] | nil,
                weekly_anchor: String.t() | nil,
                weekly_payout_days: [String.t()] | nil
              }
        defstruct [
          :delay_days,
          :interval,
          :monthly_anchor,
          :monthly_payout_days,
          :weekly_anchor,
          :weekly_payout_days
        ]
      end
    end

    defmodule Treasury do
      @moduledoc "Nested parameters."

      @typedoc """
      * `tos_acceptance` - Details on the account's acceptance of the Stripe Treasury Services Agreement.
      """
      @type t :: %__MODULE__{
              tos_acceptance: __MODULE__.TosAcceptance.t() | nil
            }
      defstruct [:tos_acceptance]

      defmodule TosAcceptance do
        @moduledoc "Nested parameters."

        @typedoc """
        * `date` - The Unix timestamp marking when the account representative accepted the service agreement. Format: Unix timestamp.
        * `ip` - The IP address from which the account representative accepted the service agreement.
        * `user_agent` - The user agent of the browser from which the account representative accepted the service agreement.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: map() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end
    end
  end

  defmodule TosAcceptance do
    @moduledoc "Nested parameters."

    @typedoc """
    * `date` - The Unix timestamp marking when the account representative accepted their service agreement. Format: Unix timestamp.
    * `ip` - The IP address from which the account representative accepted their service agreement.
    * `service_agreement` - The user's service agreement type. Max length: 5000.
    * `user_agent` - The user agent of the browser from which the account representative accepted their service agreement. Max length: 5000.
    """
    @type t :: %__MODULE__{
            date: integer() | nil,
            ip: String.t() | nil,
            service_agreement: String.t() | nil,
            user_agent: String.t() | nil
          }
    defstruct [:date, :ip, :service_agreement, :user_agent]
  end
end
