# File generated from our OpenAPI spec
defmodule Stripe.Resources.Account do
  @moduledoc """
  Account

  For new integrations, we recommend using the [Accounts v2 API](https://docs.stripe.com/api/v2/core/accounts), in place of /v1/accounts and /v1/customers to represent a user.

  This is an object representing a Stripe account. You can retrieve it to see
  properties on the account like its current requirements or if the account is
  enabled to make live charges or receive payouts.

  For accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  is `application`, which includes Custom accounts, the properties below are always
  returned.

  For accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  is `stripe`, which includes Standard and Express accounts, some properties are only returned
  until you create an [Account Link](https://docs.stripe.com/api/account_links) or [Account Session](https://docs.stripe.com/api/account_sessions)
  to start Connect Onboarding. Learn about the [differences between accounts](https://stripe.com/connect/accounts).
  """

  @typedoc """
  * `business_profile` - Business information about the account. Nullable. Expandable.
  * `business_type` - The business type. Possible values: `company`, `government_entity`, `individual`, `non_profit`. Nullable.
  * `capabilities` - Expandable.
  * `charges_enabled` - Whether the account can process charges.
  * `company` - Expandable.
  * `controller` - Expandable.
  * `country` - The account's country. Max length: 5000.
  * `created` - Time at which the account was connected. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `default_currency` - Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://stripe.com/docs/payouts). Max length: 5000.
  * `details_submitted` - Whether account details have been submitted. Accounts with Stripe Dashboard access, which includes Standard accounts, cannot receive payouts before this is true. Accounts where this is false should be directed to [an onboarding flow](https://stripe.com/connect/onboarding) to finish submitting account details.
  * `email` - An email address associated with the account. It's not used for authentication and Stripe doesn't market to this field without explicit approval from the platform. Max length: 5000. Nullable.
  * `external_accounts` - External accounts (bank accounts and debit cards) currently attached to this account. External accounts are only returned for requests where `controller[is_controller]` is true. Expandable.
  * `future_requirements` - Expandable.
  * `groups` - The groups associated with the account. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `individual` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `account`.
  * `payouts_enabled` - Whether the funds in this account can be paid out.
  * `requirements` - Expandable.
  * `settings` - Options for customizing how the account functions within Stripe. Nullable. Expandable.
  * `tos_acceptance` - Expandable.
  * `type` - The Stripe account type. Can be `standard`, `express`, `custom`, or `none`. Possible values: `custom`, `express`, `none`, `standard`.
  """
  @type t :: %__MODULE__{
          business_profile: __MODULE__.BusinessProfile.t() | nil,
          business_type: String.t() | nil,
          capabilities: __MODULE__.Capabilities.t() | nil,
          charges_enabled: boolean() | nil,
          company: __MODULE__.Company.t() | nil,
          controller: __MODULE__.Controller.t() | nil,
          country: String.t() | nil,
          created: integer() | nil,
          default_currency: String.t() | nil,
          details_submitted: boolean() | nil,
          email: String.t() | nil,
          external_accounts: __MODULE__.ExternalAccounts.t() | nil,
          future_requirements: __MODULE__.FutureRequirements.t() | nil,
          groups: __MODULE__.Groups.t() | nil,
          id: String.t(),
          individual: Stripe.Resources.Person.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          object: String.t(),
          payouts_enabled: boolean() | nil,
          requirements: __MODULE__.Requirements.t() | nil,
          settings: __MODULE__.Settings.t() | nil,
          tos_acceptance: __MODULE__.TosAcceptance.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :business_profile,
    :business_type,
    :capabilities,
    :charges_enabled,
    :company,
    :controller,
    :country,
    :created,
    :default_currency,
    :details_submitted,
    :email,
    :external_accounts,
    :future_requirements,
    :groups,
    :id,
    :individual,
    :metadata,
    :object,
    :payouts_enabled,
    :requirements,
    :settings,
    :tos_acceptance,
    :type
  ]

  @object_name "account"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "business_profile",
      "capabilities",
      "company",
      "controller",
      "external_accounts",
      "future_requirements",
      "groups",
      "individual",
      "requirements",
      "settings",
      "tos_acceptance"
    ]

  defmodule BusinessProfile do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `annual_revenue` - The applicant's gross annual revenue for its preceding fiscal year. Nullable.
    * `estimated_worker_count` - An estimated upper bound of employees, contractors, vendors, etc. currently working for the business. Nullable.
    * `mcc` - [The merchant category code for the account](https://stripe.com/connect/setting-mcc). MCCs are used to classify businesses based on the goods or services they provide. Max length: 5000. Nullable.
    * `minority_owned_business_designation` - Whether the business is a minority-owned, women-owned, and/or LGBTQI+ -owned business. Nullable.
    * `monthly_estimated_revenue`
    * `name` - The customer-facing business name. Max length: 5000. Nullable.
    * `product_description` - Internal-only description of the product sold or service provided by the business. It's used by Stripe for risk and underwriting purposes. Max length: 40000. Nullable.
    * `support_address` - A publicly available mailing address for sending support issues to. Nullable.
    * `support_email` - A publicly available email address for sending support issues to. Max length: 5000. Nullable.
    * `support_phone` - A publicly available phone number to call with support issues. Max length: 5000. Nullable.
    * `support_url` - A publicly available website for handling support issues. Max length: 5000. Nullable.
    * `url` - The business's publicly available website. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            annual_revenue: __MODULE__.AnnualRevenue.t() | nil,
            estimated_worker_count: integer() | nil,
            mcc: String.t() | nil,
            minority_owned_business_designation: [String.t()] | nil,
            monthly_estimated_revenue: __MODULE__.MonthlyEstimatedRevenue.t() | nil,
            name: String.t() | nil,
            product_description: String.t() | nil,
            support_address: Stripe.Resources.Address.t() | nil,
            support_email: String.t() | nil,
            support_phone: String.t() | nil,
            support_url: String.t() | nil,
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
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - A non-negative integer representing the amount in the [smallest currency unit](https://stripe.com/currencies#zero-decimal). Nullable.
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code. Nullable.
      * `fiscal_year_end` - The close-out date of the preceding fiscal year in ISO 8601 format. E.g. 2023-12-31 for the 31st of December, 2023. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              fiscal_year_end: String.t() | nil
            }
      defstruct [:amount, :currency, :fiscal_year_end]
    end

    defmodule MonthlyEstimatedRevenue do
      @moduledoc "Nested struct within the parent resource."

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

    def __inner_types__ do
      %{
        "annual_revenue" => __MODULE__.AnnualRevenue,
        "monthly_estimated_revenue" => __MODULE__.MonthlyEstimatedRevenue
      }
    end
  end

  defmodule Capabilities do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `acss_debit_payments` - The status of the Canadian pre-authorized debits payments capability of the account, or whether the account can directly process Canadian pre-authorized debits charges. Possible values: `active`, `inactive`, `pending`.
    * `affirm_payments` - The status of the Affirm capability of the account, or whether the account can directly process Affirm charges. Possible values: `active`, `inactive`, `pending`.
    * `afterpay_clearpay_payments` - The status of the Afterpay Clearpay capability of the account, or whether the account can directly process Afterpay Clearpay charges. Possible values: `active`, `inactive`, `pending`.
    * `alma_payments` - The status of the Alma capability of the account, or whether the account can directly process Alma payments. Possible values: `active`, `inactive`, `pending`.
    * `amazon_pay_payments` - The status of the AmazonPay capability of the account, or whether the account can directly process AmazonPay payments. Possible values: `active`, `inactive`, `pending`.
    * `au_becs_debit_payments` - The status of the BECS Direct Debit (AU) payments capability of the account, or whether the account can directly process BECS Direct Debit (AU) charges. Possible values: `active`, `inactive`, `pending`.
    * `bacs_debit_payments` - The status of the Bacs Direct Debits payments capability of the account, or whether the account can directly process Bacs Direct Debits charges. Possible values: `active`, `inactive`, `pending`.
    * `bancontact_payments` - The status of the Bancontact payments capability of the account, or whether the account can directly process Bancontact charges. Possible values: `active`, `inactive`, `pending`.
    * `bank_transfer_payments` - The status of the customer_balance payments capability of the account, or whether the account can directly process customer_balance charges. Possible values: `active`, `inactive`, `pending`.
    * `billie_payments` - The status of the Billie capability of the account, or whether the account can directly process Billie payments. Possible values: `active`, `inactive`, `pending`.
    * `blik_payments` - The status of the blik payments capability of the account, or whether the account can directly process blik charges. Possible values: `active`, `inactive`, `pending`.
    * `boleto_payments` - The status of the boleto payments capability of the account, or whether the account can directly process boleto charges. Possible values: `active`, `inactive`, `pending`.
    * `card_issuing` - The status of the card issuing capability of the account, or whether you can use Issuing to distribute funds on cards Possible values: `active`, `inactive`, `pending`.
    * `card_payments` - The status of the card payments capability of the account, or whether the account can directly process credit and debit card charges. Possible values: `active`, `inactive`, `pending`.
    * `cartes_bancaires_payments` - The status of the Cartes Bancaires payments capability of the account, or whether the account can directly process Cartes Bancaires card charges in EUR currency. Possible values: `active`, `inactive`, `pending`.
    * `cashapp_payments` - The status of the Cash App Pay capability of the account, or whether the account can directly process Cash App Pay payments. Possible values: `active`, `inactive`, `pending`.
    * `crypto_payments` - The status of the Crypto capability of the account, or whether the account can directly process Crypto payments. Possible values: `active`, `inactive`, `pending`.
    * `eps_payments` - The status of the EPS payments capability of the account, or whether the account can directly process EPS charges. Possible values: `active`, `inactive`, `pending`.
    * `fpx_payments` - The status of the FPX payments capability of the account, or whether the account can directly process FPX charges. Possible values: `active`, `inactive`, `pending`.
    * `gb_bank_transfer_payments` - The status of the GB customer_balance payments (GBP currency) capability of the account, or whether the account can directly process GB customer_balance charges. Possible values: `active`, `inactive`, `pending`.
    * `giropay_payments` - The status of the giropay payments capability of the account, or whether the account can directly process giropay charges. Possible values: `active`, `inactive`, `pending`.
    * `grabpay_payments` - The status of the GrabPay payments capability of the account, or whether the account can directly process GrabPay charges. Possible values: `active`, `inactive`, `pending`.
    * `ideal_payments` - The status of the iDEAL payments capability of the account, or whether the account can directly process iDEAL charges. Possible values: `active`, `inactive`, `pending`.
    * `india_international_payments` - The status of the india_international_payments capability of the account, or whether the account can process international charges (non INR) in India. Possible values: `active`, `inactive`, `pending`.
    * `jcb_payments` - The status of the JCB payments capability of the account, or whether the account (Japan only) can directly process JCB credit card charges in JPY currency. Possible values: `active`, `inactive`, `pending`.
    * `jp_bank_transfer_payments` - The status of the Japanese customer_balance payments (JPY currency) capability of the account, or whether the account can directly process Japanese customer_balance charges. Possible values: `active`, `inactive`, `pending`.
    * `kakao_pay_payments` - The status of the KakaoPay capability of the account, or whether the account can directly process KakaoPay payments. Possible values: `active`, `inactive`, `pending`.
    * `klarna_payments` - The status of the Klarna payments capability of the account, or whether the account can directly process Klarna charges. Possible values: `active`, `inactive`, `pending`.
    * `konbini_payments` - The status of the konbini payments capability of the account, or whether the account can directly process konbini charges. Possible values: `active`, `inactive`, `pending`.
    * `kr_card_payments` - The status of the KrCard capability of the account, or whether the account can directly process KrCard payments. Possible values: `active`, `inactive`, `pending`.
    * `legacy_payments` - The status of the legacy payments capability of the account. Possible values: `active`, `inactive`, `pending`.
    * `link_payments` - The status of the link_payments capability of the account, or whether the account can directly process Link charges. Possible values: `active`, `inactive`, `pending`.
    * `mb_way_payments` - The status of the MB WAY payments capability of the account, or whether the account can directly process MB WAY charges. Possible values: `active`, `inactive`, `pending`.
    * `mobilepay_payments` - The status of the MobilePay capability of the account, or whether the account can directly process MobilePay charges. Possible values: `active`, `inactive`, `pending`.
    * `multibanco_payments` - The status of the Multibanco payments capability of the account, or whether the account can directly process Multibanco charges. Possible values: `active`, `inactive`, `pending`.
    * `mx_bank_transfer_payments` - The status of the Mexican customer_balance payments (MXN currency) capability of the account, or whether the account can directly process Mexican customer_balance charges. Possible values: `active`, `inactive`, `pending`.
    * `naver_pay_payments` - The status of the NaverPay capability of the account, or whether the account can directly process NaverPay payments. Possible values: `active`, `inactive`, `pending`.
    * `nz_bank_account_becs_debit_payments` - The status of the New Zealand BECS Direct Debit payments capability of the account, or whether the account can directly process New Zealand BECS Direct Debit charges. Possible values: `active`, `inactive`, `pending`.
    * `oxxo_payments` - The status of the OXXO payments capability of the account, or whether the account can directly process OXXO charges. Possible values: `active`, `inactive`, `pending`.
    * `p24_payments` - The status of the P24 payments capability of the account, or whether the account can directly process P24 charges. Possible values: `active`, `inactive`, `pending`.
    * `pay_by_bank_payments` - The status of the pay_by_bank payments capability of the account, or whether the account can directly process pay_by_bank charges. Possible values: `active`, `inactive`, `pending`.
    * `payco_payments` - The status of the Payco capability of the account, or whether the account can directly process Payco payments. Possible values: `active`, `inactive`, `pending`.
    * `paynow_payments` - The status of the paynow payments capability of the account, or whether the account can directly process paynow charges. Possible values: `active`, `inactive`, `pending`.
    * `payto_payments` - The status of the PayTo capability of the account, or whether the account can directly process PayTo charges. Possible values: `active`, `inactive`, `pending`.
    * `pix_payments` - The status of the pix payments capability of the account, or whether the account can directly process pix charges. Possible values: `active`, `inactive`, `pending`.
    * `promptpay_payments` - The status of the promptpay payments capability of the account, or whether the account can directly process promptpay charges. Possible values: `active`, `inactive`, `pending`.
    * `revolut_pay_payments` - The status of the RevolutPay capability of the account, or whether the account can directly process RevolutPay payments. Possible values: `active`, `inactive`, `pending`.
    * `samsung_pay_payments` - The status of the SamsungPay capability of the account, or whether the account can directly process SamsungPay payments. Possible values: `active`, `inactive`, `pending`.
    * `satispay_payments` - The status of the Satispay capability of the account, or whether the account can directly process Satispay payments. Possible values: `active`, `inactive`, `pending`.
    * `sepa_bank_transfer_payments` - The status of the SEPA customer_balance payments (EUR currency) capability of the account, or whether the account can directly process SEPA customer_balance charges. Possible values: `active`, `inactive`, `pending`.
    * `sepa_debit_payments` - The status of the SEPA Direct Debits payments capability of the account, or whether the account can directly process SEPA Direct Debits charges. Possible values: `active`, `inactive`, `pending`.
    * `sofort_payments` - The status of the Sofort payments capability of the account, or whether the account can directly process Sofort charges. Possible values: `active`, `inactive`, `pending`.
    * `swish_payments` - The status of the Swish capability of the account, or whether the account can directly process Swish payments. Possible values: `active`, `inactive`, `pending`.
    * `tax_reporting_us_1099_k` - The status of the tax reporting 1099-K (US) capability of the account. Possible values: `active`, `inactive`, `pending`.
    * `tax_reporting_us_1099_misc` - The status of the tax reporting 1099-MISC (US) capability of the account. Possible values: `active`, `inactive`, `pending`.
    * `transfers` - The status of the transfers capability of the account, or whether your platform can transfer funds to the account. Possible values: `active`, `inactive`, `pending`.
    * `treasury` - The status of the banking capability, or whether the account can have bank accounts. Possible values: `active`, `inactive`, `pending`.
    * `twint_payments` - The status of the TWINT capability of the account, or whether the account can directly process TWINT charges. Possible values: `active`, `inactive`, `pending`.
    * `upi_payments` - The status of the upi payments capability of the account, or whether the account can directly process upi charges. Possible values: `active`, `inactive`, `pending`.
    * `us_bank_account_ach_payments` - The status of the US bank account ACH payments capability of the account, or whether the account can directly process US bank account charges. Possible values: `active`, `inactive`, `pending`.
    * `us_bank_transfer_payments` - The status of the US customer_balance payments (USD currency) capability of the account, or whether the account can directly process US customer_balance charges. Possible values: `active`, `inactive`, `pending`.
    * `zip_payments` - The status of the Zip capability of the account, or whether the account can directly process Zip charges. Possible values: `active`, `inactive`, `pending`.
    """
    @type t :: %__MODULE__{
            acss_debit_payments: String.t() | nil,
            affirm_payments: String.t() | nil,
            afterpay_clearpay_payments: String.t() | nil,
            alma_payments: String.t() | nil,
            amazon_pay_payments: String.t() | nil,
            au_becs_debit_payments: String.t() | nil,
            bacs_debit_payments: String.t() | nil,
            bancontact_payments: String.t() | nil,
            bank_transfer_payments: String.t() | nil,
            billie_payments: String.t() | nil,
            blik_payments: String.t() | nil,
            boleto_payments: String.t() | nil,
            card_issuing: String.t() | nil,
            card_payments: String.t() | nil,
            cartes_bancaires_payments: String.t() | nil,
            cashapp_payments: String.t() | nil,
            crypto_payments: String.t() | nil,
            eps_payments: String.t() | nil,
            fpx_payments: String.t() | nil,
            gb_bank_transfer_payments: String.t() | nil,
            giropay_payments: String.t() | nil,
            grabpay_payments: String.t() | nil,
            ideal_payments: String.t() | nil,
            india_international_payments: String.t() | nil,
            jcb_payments: String.t() | nil,
            jp_bank_transfer_payments: String.t() | nil,
            kakao_pay_payments: String.t() | nil,
            klarna_payments: String.t() | nil,
            konbini_payments: String.t() | nil,
            kr_card_payments: String.t() | nil,
            legacy_payments: String.t() | nil,
            link_payments: String.t() | nil,
            mb_way_payments: String.t() | nil,
            mobilepay_payments: String.t() | nil,
            multibanco_payments: String.t() | nil,
            mx_bank_transfer_payments: String.t() | nil,
            naver_pay_payments: String.t() | nil,
            nz_bank_account_becs_debit_payments: String.t() | nil,
            oxxo_payments: String.t() | nil,
            p24_payments: String.t() | nil,
            pay_by_bank_payments: String.t() | nil,
            payco_payments: String.t() | nil,
            paynow_payments: String.t() | nil,
            payto_payments: String.t() | nil,
            pix_payments: String.t() | nil,
            promptpay_payments: String.t() | nil,
            revolut_pay_payments: String.t() | nil,
            samsung_pay_payments: String.t() | nil,
            satispay_payments: String.t() | nil,
            sepa_bank_transfer_payments: String.t() | nil,
            sepa_debit_payments: String.t() | nil,
            sofort_payments: String.t() | nil,
            swish_payments: String.t() | nil,
            tax_reporting_us_1099_k: String.t() | nil,
            tax_reporting_us_1099_misc: String.t() | nil,
            transfers: String.t() | nil,
            treasury: String.t() | nil,
            twint_payments: String.t() | nil,
            upi_payments: String.t() | nil,
            us_bank_account_ach_payments: String.t() | nil,
            us_bank_transfer_payments: String.t() | nil,
            zip_payments: String.t() | nil
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
      :upi_payments,
      :us_bank_account_ach_payments,
      :us_bank_transfer_payments,
      :zip_payments
    ]
  end

  defmodule Company do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `address`
    * `address_kana` - The Kana variation of the company's primary address (Japan only). Nullable.
    * `address_kanji` - The Kanji variation of the company's primary address (Japan only). Nullable.
    * `directors_provided` - Whether the company's directors have been provided. This Boolean will be `true` if you've manually indicated that all directors are provided via [the `directors_provided` parameter](https://docs.stripe.com/api/accounts/update#update_account-company-directors_provided).
    * `directorship_declaration` - This hash is used to attest that the director information provided to Stripe is both current and correct. Nullable.
    * `executives_provided` - Whether the company's executives have been provided. This Boolean will be `true` if you've manually indicated that all executives are provided via [the `executives_provided` parameter](https://docs.stripe.com/api/accounts/update#update_account-company-executives_provided), or if Stripe determined that sufficient executives were provided.
    * `export_license_id` - The export license ID number of the company, also referred as Import Export Code (India only). Max length: 5000.
    * `export_purpose_code` - The purpose code to use for export transactions (India only). Max length: 5000.
    * `name` - The company's legal name. Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
    * `name_kana` - The Kana variation of the company's legal name (Japan only). Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
    * `name_kanji` - The Kanji variation of the company's legal name (Japan only). Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. Max length: 5000. Nullable.
    * `owners_provided` - Whether the company's owners have been provided. This Boolean will be `true` if you've manually indicated that all owners are provided via [the `owners_provided` parameter](https://docs.stripe.com/api/accounts/update#update_account-company-owners_provided), or if Stripe determined that sufficient owners were provided. Stripe determines ownership requirements using both the number of owners provided and their total percent ownership (calculated by adding the `percent_ownership` of each owner together).
    * `ownership_declaration` - This hash is used to attest that the beneficial owner information provided to Stripe is both current and correct. Nullable.
    * `ownership_exemption_reason` - This value is used to determine if a business is exempt from providing ultimate beneficial owners. See [this support article](https://support.stripe.com/questions/exemption-from-providing-ownership-details) and [changelog](https://docs.stripe.com/changelog/acacia/2025-01-27/ownership-exemption-reason-accounts-api) for more details. Possible values: `qualified_entity_exceeds_ownership_threshold`, `qualifies_as_financial_institution`.
    * `phone` - The company's phone number (used for verification). Max length: 5000. Nullable.
    * `registration_date`
    * `representative_declaration` - This hash is used to attest that the representative is authorized to act as the representative of their legal entity. Nullable.
    * `structure` - The category identifying the legal structure of the company or legal entity. Also available for accounts where [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `stripe`. See [Business structure](https://docs.stripe.com/connect/identity-verification#business-structure) for more details. Possible values: `free_zone_establishment`, `free_zone_llc`, `government_instrumentality`, `governmental_unit`, `incorporated_non_profit`, `incorporated_partnership`, `limited_liability_partnership`, `llc`, `multi_member_llc`, `private_company`, `private_corporation`, `private_partnership`, `public_company`, `public_corporation`, `public_partnership`, `registered_charity`, `single_member_llc`, `sole_establishment`, `sole_proprietorship`, `tax_exempt_government_instrumentality`, `unincorporated_association`, `unincorporated_non_profit`, `unincorporated_partnership`.
    * `tax_id_provided` - Whether the company's business ID number was provided.
    * `tax_id_registrar` - The jurisdiction in which the `tax_id` is registered (Germany-based companies only). Max length: 5000.
    * `vat_id_provided` - Whether the company's business VAT number was provided.
    * `verification` - Information on the verification state of the company. Nullable.
    """
    @type t :: %__MODULE__{
            address: Stripe.Resources.Address.t() | nil,
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
            registration_date: __MODULE__.RegistrationDate.t() | nil,
            representative_declaration: __MODULE__.RepresentativeDeclaration.t() | nil,
            structure: String.t() | nil,
            tax_id_provided: boolean() | nil,
            tax_id_registrar: String.t() | nil,
            vat_id_provided: boolean() | nil,
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
      :representative_declaration,
      :structure,
      :tax_id_provided,
      :tax_id_registrar,
      :vat_id_provided,
      :verification
    ]

    defmodule AddressKana do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `city` - City/Ward. Max length: 5000. Nullable.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
      * `line1` - Block/Building number. Max length: 5000. Nullable.
      * `line2` - Building details. Max length: 5000. Nullable.
      * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
      * `state` - Prefecture. Max length: 5000. Nullable.
      * `town` - Town/cho-me. Max length: 5000. Nullable.
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
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `city` - City/Ward. Max length: 5000. Nullable.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
      * `line1` - Block/Building number. Max length: 5000. Nullable.
      * `line2` - Building details. Max length: 5000. Nullable.
      * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
      * `state` - Prefecture. Max length: 5000. Nullable.
      * `town` - Town/cho-me. Max length: 5000. Nullable.
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
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `date` - The Unix timestamp marking when the directorship declaration attestation was made. Format: Unix timestamp. Nullable.
      * `ip` - The IP address from which the directorship declaration attestation was made. Max length: 5000. Nullable.
      * `user_agent` - The user-agent string from the browser where the directorship declaration attestation was made. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              date: integer() | nil,
              ip: String.t() | nil,
              user_agent: String.t() | nil
            }
      defstruct [:date, :ip, :user_agent]
    end

    defmodule OwnershipDeclaration do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `date` - The Unix timestamp marking when the beneficial owner attestation was made. Format: Unix timestamp. Nullable.
      * `ip` - The IP address from which the beneficial owner attestation was made. Max length: 5000. Nullable.
      * `user_agent` - The user-agent string from the browser where the beneficial owner attestation was made. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              date: integer() | nil,
              ip: String.t() | nil,
              user_agent: String.t() | nil
            }
      defstruct [:date, :ip, :user_agent]
    end

    defmodule RegistrationDate do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `day` - The day of registration, between 1 and 31. Nullable.
      * `month` - The month of registration, between 1 and 12. Nullable.
      * `year` - The four-digit year of registration. Nullable.
      """
      @type t :: %__MODULE__{
              day: integer() | nil,
              month: integer() | nil,
              year: integer() | nil
            }
      defstruct [:day, :month, :year]
    end

    defmodule RepresentativeDeclaration do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `date` - The Unix timestamp marking when the representative declaration attestation was made. Format: Unix timestamp. Nullable.
      * `ip` - The IP address from which the representative declaration attestation was made. Max length: 5000. Nullable.
      * `user_agent` - The user-agent string from the browser where the representative declaration attestation was made. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              date: integer() | nil,
              ip: String.t() | nil,
              user_agent: String.t() | nil
            }
      defstruct [:date, :ip, :user_agent]
    end

    defmodule Verification do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `document`
      """
      @type t :: %__MODULE__{
              document: __MODULE__.Document.t() | nil
            }
      defstruct [:document]

      defmodule Document do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `back` - The back of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `additional_verification`. Note that `additional_verification` files are [not downloadable](https://stripe.com/file-upload#uploading-a-file). Nullable.
        * `details` - A user-displayable string describing the verification state of this document. Max length: 5000. Nullable.
        * `details_code` - One of `document_corrupt`, `document_expired`, `document_failed_copy`, `document_failed_greyscale`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_not_readable`, `document_not_uploaded`, `document_type_not_supported`, or `document_too_large`. A machine-readable code specifying the verification state for this document. Max length: 5000. Nullable.
        * `front` - The front of a document returned by a [file upload](https://api.stripe.com#create_file) with a `purpose` value of `additional_verification`. Note that `additional_verification` files are [not downloadable](https://stripe.com/file-upload#uploading-a-file). Nullable.
        """
        @type t :: %__MODULE__{
                back: String.t() | Stripe.Resources.File.t() | nil,
                details: String.t() | nil,
                details_code: String.t() | nil,
                front: String.t() | Stripe.Resources.File.t() | nil
              }
        defstruct [:back, :details, :details_code, :front]
      end

      def __inner_types__ do
        %{
          "document" => __MODULE__.Document
        }
      end
    end

    def __inner_types__ do
      %{
        "address_kana" => __MODULE__.AddressKana,
        "address_kanji" => __MODULE__.AddressKanji,
        "directorship_declaration" => __MODULE__.DirectorshipDeclaration,
        "ownership_declaration" => __MODULE__.OwnershipDeclaration,
        "registration_date" => __MODULE__.RegistrationDate,
        "representative_declaration" => __MODULE__.RepresentativeDeclaration,
        "verification" => __MODULE__.Verification
      }
    end
  end

  defmodule Controller do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `fees`
    * `is_controller` - `true` if the Connect application retrieving the resource controls the account and can therefore exercise [platform controls](https://docs.stripe.com/connect/platform-controls-for-standard-accounts). Otherwise, this field is null.
    * `losses`
    * `requirement_collection` - A value indicating responsibility for collecting requirements on this account. Only returned when the Connect application retrieving the resource controls the account. Possible values: `application`, `stripe`.
    * `stripe_dashboard`
    * `type` - The controller type. Can be `application`, if a Connect application controls the account, or `account`, if the account controls itself. Possible values: `account`, `application`.
    """
    @type t :: %__MODULE__{
            fees: __MODULE__.Fees.t() | nil,
            is_controller: boolean() | nil,
            losses: __MODULE__.Losses.t() | nil,
            requirement_collection: String.t() | nil,
            stripe_dashboard: __MODULE__.StripeDashboard.t() | nil,
            type: String.t() | nil
          }
    defstruct [:fees, :is_controller, :losses, :requirement_collection, :stripe_dashboard, :type]

    defmodule Fees do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `payer` - A value indicating the responsible payer of a bundle of Stripe fees for pricing-control eligible products on this account. Learn more about [fee behavior on connected accounts](https://docs.stripe.com/connect/direct-charges-fee-payer-behavior). Possible values: `account`, `application`, `application_custom`, `application_express`.
      """
      @type t :: %__MODULE__{
              payer: String.t() | nil
            }
      defstruct [:payer]
    end

    defmodule Losses do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `payments` - A value indicating who is liable when this account can't pay back negative balances from payments. Possible values: `application`, `stripe`.
      """
      @type t :: %__MODULE__{
              payments: String.t() | nil
            }
      defstruct [:payments]
    end

    defmodule StripeDashboard do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - A value indicating the Stripe dashboard this account has access to independent of the Connect application. Possible values: `express`, `full`, `none`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    def __inner_types__ do
      %{
        "fees" => __MODULE__.Fees,
        "losses" => __MODULE__.Losses,
        "stripe_dashboard" => __MODULE__.StripeDashboard
      }
    end
  end

  defmodule ExternalAccounts do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - The list contains all external accounts that have been attached to the Stripe account. These may be bank accounts or cards.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.ExternalAccount.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  defmodule FutureRequirements do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `alternatives` - Fields that are due and can be resolved by providing the corresponding alternative fields instead. Many alternatives can list the same `original_fields_due`, and any of these alternatives can serve as a pathway for attempting to resolve the fields again. Re-providing `original_fields_due` also serves as a pathway for attempting to resolve the fields again. Nullable.
    * `current_deadline` - Date on which `future_requirements` becomes the main `requirements` hash and `future_requirements` becomes empty. After the transition, `currently_due` requirements may immediately become `past_due`, but the account may also be given a grace period depending on its enablement state prior to transitioning. Format: Unix timestamp. Nullable.
    * `currently_due` - Fields that need to be resolved to keep the account enabled. If not resolved by `future_requirements[current_deadline]`, these fields will transition to the main `requirements` hash. Nullable.
    * `disabled_reason` - This is typed as an enum for consistency with `requirements.disabled_reason`. Possible values: `action_required.requested_capabilities`, `listed`, `other`, `platform_paused`, `rejected.fraud`, `rejected.incomplete_verification`, `rejected.listed`, `rejected.other`, `rejected.platform_fraud`, `rejected.platform_other`, `rejected.platform_terms_of_service`, `rejected.terms_of_service`, `requirements.past_due`, `requirements.pending_verification`, `under_review`. Nullable.
    * `errors` - Details about validation and verification failures for `due` requirements that must be resolved. Nullable.
    * `eventually_due` - Fields you must collect when all thresholds are reached. As they become required, they appear in `currently_due` as well. Nullable.
    * `past_due` - Fields that haven't been resolved by `requirements.current_deadline`. These fields need to be resolved to enable the capability on the account. `future_requirements.past_due` is a subset of `requirements.past_due`. Nullable.
    * `pending_verification` - Fields that are being reviewed, or might become required depending on the results of a review. If the review fails, these fields can move to `eventually_due`, `currently_due`, `past_due` or `alternatives`. Fields might appear in `eventually_due`, `currently_due`, `past_due` or `alternatives` and in `pending_verification` if one verification fails but another is still pending. Nullable.
    """
    @type t :: %__MODULE__{
            alternatives: [__MODULE__.Alternatives.t()] | nil,
            current_deadline: integer() | nil,
            currently_due: [String.t()] | nil,
            disabled_reason: String.t() | nil,
            errors: [__MODULE__.Errors.t()] | nil,
            eventually_due: [String.t()] | nil,
            past_due: [String.t()] | nil,
            pending_verification: [String.t()] | nil
          }
    defstruct [
      :alternatives,
      :current_deadline,
      :currently_due,
      :disabled_reason,
      :errors,
      :eventually_due,
      :past_due,
      :pending_verification
    ]

    defmodule Alternatives do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `alternative_fields_due` - Fields that can be provided to resolve all fields in `original_fields_due`.
      * `original_fields_due` - Fields that are due and can be resolved by providing all fields in `alternative_fields_due`.
      """
      @type t :: %__MODULE__{
              alternative_fields_due: [String.t()] | nil,
              original_fields_due: [String.t()] | nil
            }
      defstruct [:alternative_fields_due, :original_fields_due]
    end

    defmodule Errors do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `code` - The code for the type of error. Possible values: `external_request`, `information_missing`, `invalid_address_city_state_postal_code`, `invalid_address_highway_contract_box`, `invalid_address_private_mailbox`, `invalid_business_profile_name`, `invalid_business_profile_name_denylisted`, `invalid_company_name_denylisted`, `invalid_dob_age_over_maximum`, `invalid_dob_age_under_18`, `invalid_dob_age_under_minimum`, `invalid_product_description_length`, `invalid_product_description_url_match`, `invalid_representative_country`, `invalid_signator`, `invalid_statement_descriptor_business_mismatch`, `invalid_statement_descriptor_denylisted`, `invalid_statement_descriptor_length`, `invalid_statement_descriptor_prefix_denylisted`, `invalid_statement_descriptor_prefix_mismatch`, `invalid_street_address`, `invalid_tax_id`, `invalid_tax_id_format`, `invalid_tos_acceptance`, `invalid_url_denylisted`, `invalid_url_format`, `invalid_url_length`, `invalid_url_web_presence_detected`, `invalid_url_website_business_information_mismatch`, `invalid_url_website_empty`, `invalid_url_website_inaccessible`, `invalid_url_website_inaccessible_geoblocked`, `invalid_url_website_inaccessible_password_protected`, `invalid_url_website_incomplete`, `invalid_url_website_incomplete_cancellation_policy`, `invalid_url_website_incomplete_customer_service_details`, `invalid_url_website_incomplete_legal_restrictions`, `invalid_url_website_incomplete_refund_policy`, `invalid_url_website_incomplete_return_policy`, `invalid_url_website_incomplete_terms_and_conditions`, `invalid_url_website_incomplete_under_construction`, `invalid_url_website_other`, `invalid_value_other`, `unsupported_business_type`, `verification_directors_mismatch`, `verification_document_address_mismatch`, `verification_document_address_missing`, `verification_document_corrupt`, `verification_document_country_not_supported`, `verification_document_directors_mismatch`, `verification_document_dob_mismatch`, `verification_document_duplicate_type`, `verification_document_expired`, `verification_document_failed_copy`, `verification_document_failed_greyscale`, `verification_document_failed_other`, `verification_document_failed_test_mode`, `verification_document_fraudulent`, `verification_document_id_number_mismatch`, `verification_document_id_number_missing`, `verification_document_incomplete`, `verification_document_invalid`, `verification_document_issue_or_expiry_date_missing`, `verification_document_manipulated`, `verification_document_missing_back`, `verification_document_missing_front`, `verification_document_name_mismatch`, `verification_document_name_missing`, `verification_document_nationality_mismatch`, `verification_document_not_readable`, `verification_document_not_signed`, `verification_document_not_uploaded`, `verification_document_photo_mismatch`, `verification_document_too_large`, `verification_document_type_not_supported`, `verification_extraneous_directors`, `verification_failed_address_match`, `verification_failed_authorizer_authority`, `verification_failed_business_iec_number`, `verification_failed_document_match`, `verification_failed_id_number_match`, `verification_failed_keyed_identity`, `verification_failed_keyed_match`, `verification_failed_name_match`, `verification_failed_other`, `verification_failed_representative_authority`, `verification_failed_residential_address`, `verification_failed_tax_id_match`, `verification_failed_tax_id_not_issued`, `verification_legal_entity_structure_mismatch`, `verification_missing_directors`, `verification_missing_executives`, `verification_missing_owners`, `verification_rejected_ownership_exemption_reason`, `verification_requires_additional_memorandum_of_associations`, `verification_requires_additional_proof_of_registration`, `verification_supportability`.
      * `reason` - An informative message that indicates the error type and provides additional details about the error. Max length: 5000.
      * `requirement` - The specific user onboarding requirement field (in the requirements hash) that needs to be resolved. Max length: 5000.
      """
      @type t :: %__MODULE__{
              code: String.t() | nil,
              reason: String.t() | nil,
              requirement: String.t() | nil
            }
      defstruct [:code, :reason, :requirement]
    end

    def __inner_types__ do
      %{
        "alternatives" => __MODULE__.Alternatives,
        "errors" => __MODULE__.Errors
      }
    end
  end

  defmodule Groups do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `payments_pricing` - The group the account is in to determine their payments pricing, and null if the account is on customized pricing. [See the Platform pricing tool documentation](https://docs.stripe.com/connect/platform-pricing-tools) for details. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            payments_pricing: String.t() | nil
          }
    defstruct [:payments_pricing]
  end

  defmodule Requirements do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `alternatives` - Fields that are due and can be resolved by providing the corresponding alternative fields instead. Many alternatives can list the same `original_fields_due`, and any of these alternatives can serve as a pathway for attempting to resolve the fields again. Re-providing `original_fields_due` also serves as a pathway for attempting to resolve the fields again. Nullable.
    * `current_deadline` - Date by which the fields in `currently_due` must be collected to keep the account enabled. These fields may disable the account sooner if the next threshold is reached before they are collected. Format: Unix timestamp. Nullable.
    * `currently_due` - Fields that need to be resolved to keep the account enabled. If not resolved by `current_deadline`, these fields will appear in `past_due` as well, and the account is disabled. Nullable.
    * `disabled_reason` - If the account is disabled, this enum describes why. [Learn more about handling verification issues](https://docs.stripe.com/connect/handling-api-verification). Possible values: `action_required.requested_capabilities`, `listed`, `other`, `platform_paused`, `rejected.fraud`, `rejected.incomplete_verification`, `rejected.listed`, `rejected.other`, `rejected.platform_fraud`, `rejected.platform_other`, `rejected.platform_terms_of_service`, `rejected.terms_of_service`, `requirements.past_due`, `requirements.pending_verification`, `under_review`. Nullable.
    * `errors` - Details about validation and verification failures for `due` requirements that must be resolved. Nullable.
    * `eventually_due` - Fields you must collect when all thresholds are reached. As they become required, they appear in `currently_due` as well, and `current_deadline` becomes set. Nullable.
    * `past_due` - Fields that haven't been resolved by `current_deadline`. These fields need to be resolved to enable the account. Nullable.
    * `pending_verification` - Fields that are being reviewed, or might become required depending on the results of a review. If the review fails, these fields can move to `eventually_due`, `currently_due`, `past_due` or `alternatives`. Fields might appear in `eventually_due`, `currently_due`, `past_due` or `alternatives` and in `pending_verification` if one verification fails but another is still pending. Nullable.
    """
    @type t :: %__MODULE__{
            alternatives: [__MODULE__.Alternatives.t()] | nil,
            current_deadline: integer() | nil,
            currently_due: [String.t()] | nil,
            disabled_reason: String.t() | nil,
            errors: [__MODULE__.Errors.t()] | nil,
            eventually_due: [String.t()] | nil,
            past_due: [String.t()] | nil,
            pending_verification: [String.t()] | nil
          }
    defstruct [
      :alternatives,
      :current_deadline,
      :currently_due,
      :disabled_reason,
      :errors,
      :eventually_due,
      :past_due,
      :pending_verification
    ]

    defmodule Alternatives do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `alternative_fields_due` - Fields that can be provided to resolve all fields in `original_fields_due`.
      * `original_fields_due` - Fields that are due and can be resolved by providing all fields in `alternative_fields_due`.
      """
      @type t :: %__MODULE__{
              alternative_fields_due: [String.t()] | nil,
              original_fields_due: [String.t()] | nil
            }
      defstruct [:alternative_fields_due, :original_fields_due]
    end

    defmodule Errors do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `code` - The code for the type of error. Possible values: `external_request`, `information_missing`, `invalid_address_city_state_postal_code`, `invalid_address_highway_contract_box`, `invalid_address_private_mailbox`, `invalid_business_profile_name`, `invalid_business_profile_name_denylisted`, `invalid_company_name_denylisted`, `invalid_dob_age_over_maximum`, `invalid_dob_age_under_18`, `invalid_dob_age_under_minimum`, `invalid_product_description_length`, `invalid_product_description_url_match`, `invalid_representative_country`, `invalid_signator`, `invalid_statement_descriptor_business_mismatch`, `invalid_statement_descriptor_denylisted`, `invalid_statement_descriptor_length`, `invalid_statement_descriptor_prefix_denylisted`, `invalid_statement_descriptor_prefix_mismatch`, `invalid_street_address`, `invalid_tax_id`, `invalid_tax_id_format`, `invalid_tos_acceptance`, `invalid_url_denylisted`, `invalid_url_format`, `invalid_url_length`, `invalid_url_web_presence_detected`, `invalid_url_website_business_information_mismatch`, `invalid_url_website_empty`, `invalid_url_website_inaccessible`, `invalid_url_website_inaccessible_geoblocked`, `invalid_url_website_inaccessible_password_protected`, `invalid_url_website_incomplete`, `invalid_url_website_incomplete_cancellation_policy`, `invalid_url_website_incomplete_customer_service_details`, `invalid_url_website_incomplete_legal_restrictions`, `invalid_url_website_incomplete_refund_policy`, `invalid_url_website_incomplete_return_policy`, `invalid_url_website_incomplete_terms_and_conditions`, `invalid_url_website_incomplete_under_construction`, `invalid_url_website_other`, `invalid_value_other`, `unsupported_business_type`, `verification_directors_mismatch`, `verification_document_address_mismatch`, `verification_document_address_missing`, `verification_document_corrupt`, `verification_document_country_not_supported`, `verification_document_directors_mismatch`, `verification_document_dob_mismatch`, `verification_document_duplicate_type`, `verification_document_expired`, `verification_document_failed_copy`, `verification_document_failed_greyscale`, `verification_document_failed_other`, `verification_document_failed_test_mode`, `verification_document_fraudulent`, `verification_document_id_number_mismatch`, `verification_document_id_number_missing`, `verification_document_incomplete`, `verification_document_invalid`, `verification_document_issue_or_expiry_date_missing`, `verification_document_manipulated`, `verification_document_missing_back`, `verification_document_missing_front`, `verification_document_name_mismatch`, `verification_document_name_missing`, `verification_document_nationality_mismatch`, `verification_document_not_readable`, `verification_document_not_signed`, `verification_document_not_uploaded`, `verification_document_photo_mismatch`, `verification_document_too_large`, `verification_document_type_not_supported`, `verification_extraneous_directors`, `verification_failed_address_match`, `verification_failed_authorizer_authority`, `verification_failed_business_iec_number`, `verification_failed_document_match`, `verification_failed_id_number_match`, `verification_failed_keyed_identity`, `verification_failed_keyed_match`, `verification_failed_name_match`, `verification_failed_other`, `verification_failed_representative_authority`, `verification_failed_residential_address`, `verification_failed_tax_id_match`, `verification_failed_tax_id_not_issued`, `verification_legal_entity_structure_mismatch`, `verification_missing_directors`, `verification_missing_executives`, `verification_missing_owners`, `verification_rejected_ownership_exemption_reason`, `verification_requires_additional_memorandum_of_associations`, `verification_requires_additional_proof_of_registration`, `verification_supportability`.
      * `reason` - An informative message that indicates the error type and provides additional details about the error. Max length: 5000.
      * `requirement` - The specific user onboarding requirement field (in the requirements hash) that needs to be resolved. Max length: 5000.
      """
      @type t :: %__MODULE__{
              code: String.t() | nil,
              reason: String.t() | nil,
              requirement: String.t() | nil
            }
      defstruct [:code, :reason, :requirement]
    end

    def __inner_types__ do
      %{
        "alternatives" => __MODULE__.Alternatives,
        "errors" => __MODULE__.Errors
      }
    end
  end

  defmodule Settings do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bacs_debit_payments`
    * `branding`
    * `card_issuing`
    * `card_payments`
    * `dashboard`
    * `invoices`
    * `payments`
    * `payouts`
    * `sepa_debit_payments`
    * `treasury`
    """
    @type t :: %__MODULE__{
            bacs_debit_payments: __MODULE__.BacsDebitPayments.t() | nil,
            branding: __MODULE__.Branding.t() | nil,
            card_issuing: __MODULE__.CardIssuing.t() | nil,
            card_payments: __MODULE__.CardPayments.t() | nil,
            dashboard: __MODULE__.Dashboard.t() | nil,
            invoices: __MODULE__.Invoices.t() | nil,
            payments: __MODULE__.Payments.t() | nil,
            payouts: __MODULE__.Payouts.t() | nil,
            sepa_debit_payments: __MODULE__.SepaDebitPayments.t() | nil,
            treasury: __MODULE__.Treasury.t() | nil
          }
    defstruct [
      :bacs_debit_payments,
      :branding,
      :card_issuing,
      :card_payments,
      :dashboard,
      :invoices,
      :payments,
      :payouts,
      :sepa_debit_payments,
      :treasury
    ]

    defmodule BacsDebitPayments do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `display_name` - The Bacs Direct Debit display name for this account. For payments made with Bacs Direct Debit, this name appears on the mandate as the statement descriptor. Mobile banking apps display it as the name of the business. To use custom branding, set the Bacs Direct Debit Display Name during or right after creation. Custom branding incurs an additional monthly fee for the platform. The fee appears 5 business days after requesting Bacs. If you don't set the display name before requesting Bacs capability, it's automatically set as "Stripe" and the account is onboarded to Stripe branding, which is free. Max length: 5000. Nullable.
      * `service_user_number` - The Bacs Direct Debit Service user number for this account. For payments made with Bacs Direct Debit, this number is a unique identifier of the account with our banking partners. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              display_name: String.t() | nil,
              service_user_number: String.t() | nil
            }
      defstruct [:display_name, :service_user_number]
    end

    defmodule Branding do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `icon` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) An icon for the account. Must be square and at least 128px x 128px. Nullable.
      * `logo` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A logo for the account that will be used in Checkout instead of the icon and without the account's name next to it if provided. Must be at least 128px x 128px. Nullable.
      * `primary_color` - A CSS hex color value representing the primary branding color for this account Max length: 5000. Nullable.
      * `secondary_color` - A CSS hex color value representing the secondary branding color for this account Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              icon: String.t() | Stripe.Resources.File.t() | nil,
              logo: String.t() | Stripe.Resources.File.t() | nil,
              primary_color: String.t() | nil,
              secondary_color: String.t() | nil
            }
      defstruct [:icon, :logo, :primary_color, :secondary_color]
    end

    defmodule CardIssuing do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `tos_acceptance`
      """
      @type t :: %__MODULE__{
              tos_acceptance: __MODULE__.TosAcceptance.t() | nil
            }
      defstruct [:tos_acceptance]

      defmodule TosAcceptance do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `date` - The Unix timestamp marking when the account representative accepted the service agreement. Nullable.
        * `ip` - The IP address from which the account representative accepted the service agreement. Max length: 5000. Nullable.
        * `user_agent` - The user agent of the browser from which the account representative accepted the service agreement. Max length: 5000.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end

      def __inner_types__ do
        %{
          "tos_acceptance" => __MODULE__.TosAcceptance
        }
      end
    end

    defmodule CardPayments do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `decline_on`
      * `statement_descriptor_prefix` - The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. `statement_descriptor_prefix` is useful for maximizing descriptor space for the dynamic portion. Max length: 5000. Nullable.
      * `statement_descriptor_prefix_kana` - The Kana variation of the default text that appears on credit card statements when a charge is made (Japan only). This field prefixes any dynamic `statement_descriptor_suffix_kana` specified on the charge. `statement_descriptor_prefix_kana` is useful for maximizing descriptor space for the dynamic portion. Max length: 5000. Nullable.
      * `statement_descriptor_prefix_kanji` - The Kanji variation of the default text that appears on credit card statements when a charge is made (Japan only). This field prefixes any dynamic `statement_descriptor_suffix_kanji` specified on the charge. `statement_descriptor_prefix_kanji` is useful for maximizing descriptor space for the dynamic portion. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              decline_on: __MODULE__.DeclineOn.t() | nil,
              statement_descriptor_prefix: String.t() | nil,
              statement_descriptor_prefix_kana: String.t() | nil,
              statement_descriptor_prefix_kanji: String.t() | nil
            }
      defstruct [
        :decline_on,
        :statement_descriptor_prefix,
        :statement_descriptor_prefix_kana,
        :statement_descriptor_prefix_kanji
      ]

      defmodule DeclineOn do
        @moduledoc "Nested struct within the parent resource."

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

      def __inner_types__ do
        %{
          "decline_on" => __MODULE__.DeclineOn
        }
      end
    end

    defmodule Dashboard do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `display_name` - The display name for this account. This is used on the Stripe Dashboard to differentiate between accounts. Max length: 5000. Nullable.
      * `timezone` - The timezone used in the Stripe Dashboard for this account. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones). Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              display_name: String.t() | nil,
              timezone: String.t() | nil
            }
      defstruct [:display_name, :timezone]
    end

    defmodule Invoices do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `default_account_tax_ids` - The list of default Account Tax IDs to automatically include on invoices. Account Tax IDs get added when an invoice is finalized. Nullable.
      * `hosted_payment_method_save` - Whether to save the payment method after a payment is completed for a one-time invoice or a subscription invoice when the customer already has a default payment method on the hosted invoice page. Possible values: `always`, `never`, `offer`. Nullable.
      """
      @type t :: %__MODULE__{
              default_account_tax_ids: [String.t() | Stripe.Resources.TaxId.t()] | nil,
              hosted_payment_method_save: String.t() | nil
            }
      defstruct [:default_account_tax_ids, :hosted_payment_method_save]
    end

    defmodule Payments do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `statement_descriptor` - The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. Max length: 5000. Nullable.
      * `statement_descriptor_kana` - The Kana variation of `statement_descriptor` used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors). Max length: 5000. Nullable.
      * `statement_descriptor_kanji` - The Kanji variation of `statement_descriptor` used for charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors). Max length: 5000. Nullable.
      * `statement_descriptor_prefix_kana` - The Kana variation of `statement_descriptor_prefix` used for card charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors). Max length: 5000. Nullable.
      * `statement_descriptor_prefix_kanji` - The Kanji variation of `statement_descriptor_prefix` used for card charges in Japan. Japanese statement descriptors have [special requirements](https://docs.stripe.com/get-started/account/statement-descriptors#set-japanese-statement-descriptors). Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              statement_descriptor: String.t() | nil,
              statement_descriptor_kana: String.t() | nil,
              statement_descriptor_kanji: String.t() | nil,
              statement_descriptor_prefix_kana: String.t() | nil,
              statement_descriptor_prefix_kanji: String.t() | nil
            }
      defstruct [
        :statement_descriptor,
        :statement_descriptor_kana,
        :statement_descriptor_kanji,
        :statement_descriptor_prefix_kana,
        :statement_descriptor_prefix_kanji
      ]
    end

    defmodule Payouts do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `debit_negative_balances` - A Boolean indicating if Stripe should try to reclaim negative balances from an attached bank account. See [Understanding Connect account balances](https://stripe.com/connect/account-balances) for details. The default value is `false` when [controller.requirement_collection](https://docs.stripe.com/api/accounts/object#account_object-controller-requirement_collection) is `application`, which includes Custom accounts, otherwise `true`.
      * `schedule`
      * `statement_descriptor` - The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              debit_negative_balances: boolean() | nil,
              schedule: __MODULE__.Schedule.t() | nil,
              statement_descriptor: String.t() | nil
            }
      defstruct [:debit_negative_balances, :schedule, :statement_descriptor]

      defmodule Schedule do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `delay_days` - The number of days charges for the account will be held before being paid out.
        * `interval` - How frequently funds will be paid out. One of `manual` (payouts only created via API call), `daily`, `weekly`, or `monthly`. Max length: 5000.
        * `monthly_anchor` - The day of the month funds will be paid out. Only shown if `interval` is monthly. Payouts scheduled between the 29th and 31st of the month are sent on the last day of shorter months.
        * `monthly_payout_days` - The days of the month funds will be paid out. Only shown if `interval` is monthly. Payouts scheduled between the 29th and 31st of the month are sent on the last day of shorter months.
        * `weekly_anchor` - The day of the week funds will be paid out, of the style 'monday', 'tuesday', etc. Only shown if `interval` is weekly. Max length: 5000.
        * `weekly_payout_days` - The days of the week when available funds are paid out, specified as an array, for example, [`monday`, `tuesday`]. Only shown if `interval` is weekly.
        """
        @type t :: %__MODULE__{
                delay_days: integer() | nil,
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

      def __inner_types__ do
        %{
          "schedule" => __MODULE__.Schedule
        }
      end
    end

    defmodule SepaDebitPayments do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `creditor_id` - SEPA creditor identifier that identifies the company making the payment. Max length: 5000.
      """
      @type t :: %__MODULE__{
              creditor_id: String.t() | nil
            }
      defstruct [:creditor_id]
    end

    defmodule Treasury do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `tos_acceptance`
      """
      @type t :: %__MODULE__{
              tos_acceptance: __MODULE__.TosAcceptance.t() | nil
            }
      defstruct [:tos_acceptance]

      defmodule TosAcceptance do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `date` - The Unix timestamp marking when the account representative accepted the service agreement. Nullable.
        * `ip` - The IP address from which the account representative accepted the service agreement. Max length: 5000. Nullable.
        * `user_agent` - The user agent of the browser from which the account representative accepted the service agreement. Max length: 5000.
        """
        @type t :: %__MODULE__{
                date: integer() | nil,
                ip: String.t() | nil,
                user_agent: String.t() | nil
              }
        defstruct [:date, :ip, :user_agent]
      end

      def __inner_types__ do
        %{
          "tos_acceptance" => __MODULE__.TosAcceptance
        }
      end
    end

    def __inner_types__ do
      %{
        "bacs_debit_payments" => __MODULE__.BacsDebitPayments,
        "branding" => __MODULE__.Branding,
        "card_issuing" => __MODULE__.CardIssuing,
        "card_payments" => __MODULE__.CardPayments,
        "dashboard" => __MODULE__.Dashboard,
        "invoices" => __MODULE__.Invoices,
        "payments" => __MODULE__.Payments,
        "payouts" => __MODULE__.Payouts,
        "sepa_debit_payments" => __MODULE__.SepaDebitPayments,
        "treasury" => __MODULE__.Treasury
      }
    end
  end

  defmodule TosAcceptance do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `date` - The Unix timestamp marking when the account representative accepted their service agreement Format: Unix timestamp. Nullable.
    * `ip` - The IP address from which the account representative accepted their service agreement Max length: 5000. Nullable.
    * `service_agreement` - The user's service agreement type Max length: 5000.
    * `user_agent` - The user agent of the browser from which the account representative accepted their service agreement Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            date: integer() | nil,
            ip: String.t() | nil,
            service_agreement: String.t() | nil,
            user_agent: String.t() | nil
          }
    defstruct [:date, :ip, :service_agreement, :user_agent]
  end

  def __inner_types__ do
    %{
      "business_profile" => __MODULE__.BusinessProfile,
      "capabilities" => __MODULE__.Capabilities,
      "company" => __MODULE__.Company,
      "controller" => __MODULE__.Controller,
      "external_accounts" => __MODULE__.ExternalAccounts,
      "future_requirements" => __MODULE__.FutureRequirements,
      "groups" => __MODULE__.Groups,
      "individual" => Stripe.Resources.Person,
      "requirements" => __MODULE__.Requirements,
      "settings" => __MODULE__.Settings,
      "tos_acceptance" => __MODULE__.TosAcceptance
    }
  end
end
