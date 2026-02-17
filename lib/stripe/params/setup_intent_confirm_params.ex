# File generated from our OpenAPI spec
defmodule Stripe.Params.SetupIntentConfirmParams do
  @moduledoc "Parameters for setup intent confirm."

  @typedoc """
  * `confirmation_token` - ID of the ConfirmationToken used to confirm this SetupIntent.

  If the provided ConfirmationToken contains properties that are also being provided in this request, such as `payment_method`, then the values in this request will take precedence. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `mandate_data`
  * `payment_method` - ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this SetupIntent. Max length: 5000.
  * `payment_method_data` - When included, this hash creates a PaymentMethod that is set as the [`payment_method`](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-payment_method)
  value in the SetupIntent.
  * `payment_method_options` - Payment method-specific configuration for this SetupIntent.
  * `return_url` - The URL to redirect your customer back to after they authenticate on the payment method's app or site.
  If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme.
  This parameter is only used for cards and other redirect-based payment methods.
  * `use_stripe_sdk` - Set to `true` when confirming server-side and using Stripe.js, iOS, or Android client-side SDKs to handle the next actions.
  """
  @type t :: %__MODULE__{
          confirmation_token: String.t() | nil,
          expand: [String.t()] | nil,
          mandate_data: map() | nil,
          payment_method: String.t() | nil,
          payment_method_data: __MODULE__.PaymentMethodData.t() | nil,
          payment_method_options: __MODULE__.PaymentMethodOptions.t() | nil,
          return_url: String.t() | nil,
          use_stripe_sdk: boolean() | nil
        }

  defstruct [
    :confirmation_token,
    :expand,
    :mandate_data,
    :payment_method,
    :payment_method_data,
    :payment_method_options,
    :return_url,
    :use_stripe_sdk
  ]

  defmodule PaymentMethodData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `acss_debit` - If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
    * `affirm` - If this is an `affirm` PaymentMethod, this hash contains details about the Affirm payment method.
    * `afterpay_clearpay` - If this is an `AfterpayClearpay` PaymentMethod, this hash contains details about the AfterpayClearpay payment method.
    * `alipay` - If this is an `Alipay` PaymentMethod, this hash contains details about the Alipay payment method.
    * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to `unspecified`. Possible values: `always`, `limited`, `unspecified`.
    * `alma` - If this is a Alma PaymentMethod, this hash contains details about the Alma payment method.
    * `amazon_pay` - If this is a AmazonPay PaymentMethod, this hash contains details about the AmazonPay payment method.
    * `au_becs_debit` - If this is an `au_becs_debit` PaymentMethod, this hash contains details about the bank account.
    * `bacs_debit` - If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
    * `bancontact` - If this is a `bancontact` PaymentMethod, this hash contains details about the Bancontact payment method.
    * `billie` - If this is a `billie` PaymentMethod, this hash contains details about the Billie payment method.
    * `billing_details` - Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
    * `blik` - If this is a `blik` PaymentMethod, this hash contains details about the BLIK payment method.
    * `boleto` - If this is a `boleto` PaymentMethod, this hash contains details about the Boleto payment method.
    * `cashapp` - If this is a `cashapp` PaymentMethod, this hash contains details about the Cash App Pay payment method.
    * `crypto` - If this is a Crypto PaymentMethod, this hash contains details about the Crypto payment method.
    * `customer_balance` - If this is a `customer_balance` PaymentMethod, this hash contains details about the CustomerBalance payment method.
    * `eps` - If this is an `eps` PaymentMethod, this hash contains details about the EPS payment method.
    * `fpx` - If this is an `fpx` PaymentMethod, this hash contains details about the FPX payment method.
    * `giropay` - If this is a `giropay` PaymentMethod, this hash contains details about the Giropay payment method.
    * `grabpay` - If this is a `grabpay` PaymentMethod, this hash contains details about the GrabPay payment method.
    * `ideal` - If this is an `ideal` PaymentMethod, this hash contains details about the iDEAL payment method.
    * `interac_present` - If this is an `interac_present` PaymentMethod, this hash contains details about the Interac Present payment method.
    * `kakao_pay` - If this is a `kakao_pay` PaymentMethod, this hash contains details about the Kakao Pay payment method.
    * `klarna` - If this is a `klarna` PaymentMethod, this hash contains details about the Klarna payment method.
    * `konbini` - If this is a `konbini` PaymentMethod, this hash contains details about the Konbini payment method.
    * `kr_card` - If this is a `kr_card` PaymentMethod, this hash contains details about the Korean Card payment method.
    * `link` - If this is an `Link` PaymentMethod, this hash contains details about the Link payment method.
    * `mb_way` - If this is a MB WAY PaymentMethod, this hash contains details about the MB WAY payment method.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    * `mobilepay` - If this is a `mobilepay` PaymentMethod, this hash contains details about the MobilePay payment method.
    * `multibanco` - If this is a `multibanco` PaymentMethod, this hash contains details about the Multibanco payment method.
    * `naver_pay` - If this is a `naver_pay` PaymentMethod, this hash contains details about the Naver Pay payment method.
    * `nz_bank_account` - If this is an nz_bank_account PaymentMethod, this hash contains details about the nz_bank_account payment method.
    * `oxxo` - If this is an `oxxo` PaymentMethod, this hash contains details about the OXXO payment method.
    * `p24` - If this is a `p24` PaymentMethod, this hash contains details about the P24 payment method.
    * `pay_by_bank` - If this is a `pay_by_bank` PaymentMethod, this hash contains details about the PayByBank payment method.
    * `payco` - If this is a `payco` PaymentMethod, this hash contains details about the PAYCO payment method.
    * `paynow` - If this is a `paynow` PaymentMethod, this hash contains details about the PayNow payment method.
    * `paypal` - If this is a `paypal` PaymentMethod, this hash contains details about the PayPal payment method.
    * `payto` - If this is a `payto` PaymentMethod, this hash contains details about the PayTo payment method.
    * `pix` - If this is a `pix` PaymentMethod, this hash contains details about the Pix payment method.
    * `promptpay` - If this is a `promptpay` PaymentMethod, this hash contains details about the PromptPay payment method.
    * `radar_options` - Options to configure Radar. See [Radar Session](https://docs.stripe.com/radar/radar-session) for more information.
    * `revolut_pay` - If this is a `revolut_pay` PaymentMethod, this hash contains details about the Revolut Pay payment method.
    * `samsung_pay` - If this is a `samsung_pay` PaymentMethod, this hash contains details about the SamsungPay payment method.
    * `satispay` - If this is a `satispay` PaymentMethod, this hash contains details about the Satispay payment method.
    * `sepa_debit` - If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
    * `sofort` - If this is a `sofort` PaymentMethod, this hash contains details about the SOFORT payment method.
    * `swish` - If this is a `swish` PaymentMethod, this hash contains details about the Swish payment method.
    * `twint` - If this is a TWINT PaymentMethod, this hash contains details about the TWINT payment method.
    * `type` - The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type. Possible values: `acss_debit`, `affirm`, `afterpay_clearpay`, `alipay`, `alma`, `amazon_pay`, `au_becs_debit`, `bacs_debit`, `bancontact`, `billie`, `blik`, `boleto`, `cashapp`, `crypto`, `customer_balance`, `eps`, `fpx`, `giropay`, `grabpay`, `ideal`, `kakao_pay`, `klarna`, `konbini`, `kr_card`, `link`, `mb_way`, `mobilepay`, `multibanco`, `naver_pay`, `nz_bank_account`, `oxxo`, `p24`, `pay_by_bank`, `payco`, `paynow`, `paypal`, `payto`, `pix`, `promptpay`, `revolut_pay`, `samsung_pay`, `satispay`, `sepa_debit`, `sofort`, `swish`, `twint`, `us_bank_account`, `wechat_pay`, `zip`.
    * `us_bank_account` - If this is an `us_bank_account` PaymentMethod, this hash contains details about the US bank account payment method.
    * `wechat_pay` - If this is an `wechat_pay` PaymentMethod, this hash contains details about the wechat_pay payment method.
    * `zip` - If this is a `zip` PaymentMethod, this hash contains details about the Zip payment method.
    """
    @type t :: %__MODULE__{
            acss_debit: __MODULE__.AcssDebit.t() | nil,
            affirm: map() | nil,
            afterpay_clearpay: map() | nil,
            alipay: map() | nil,
            allow_redisplay: String.t() | nil,
            alma: map() | nil,
            amazon_pay: map() | nil,
            au_becs_debit: __MODULE__.AuBecsDebit.t() | nil,
            bacs_debit: __MODULE__.BacsDebit.t() | nil,
            bancontact: map() | nil,
            billie: map() | nil,
            billing_details: __MODULE__.BillingDetails.t() | nil,
            blik: map() | nil,
            boleto: __MODULE__.Boleto.t() | nil,
            cashapp: map() | nil,
            crypto: map() | nil,
            customer_balance: map() | nil,
            eps: __MODULE__.Eps.t() | nil,
            fpx: __MODULE__.Fpx.t() | nil,
            giropay: map() | nil,
            grabpay: map() | nil,
            ideal: __MODULE__.Ideal.t() | nil,
            interac_present: map() | nil,
            kakao_pay: map() | nil,
            klarna: __MODULE__.Klarna.t() | nil,
            konbini: map() | nil,
            kr_card: map() | nil,
            link: map() | nil,
            mb_way: map() | nil,
            metadata: %{String.t() => String.t()} | nil,
            mobilepay: map() | nil,
            multibanco: map() | nil,
            naver_pay: __MODULE__.NaverPay.t() | nil,
            nz_bank_account: __MODULE__.NzBankAccount.t() | nil,
            oxxo: map() | nil,
            p24: __MODULE__.P24.t() | nil,
            pay_by_bank: map() | nil,
            payco: map() | nil,
            paynow: map() | nil,
            paypal: map() | nil,
            payto: __MODULE__.Payto.t() | nil,
            pix: map() | nil,
            promptpay: map() | nil,
            radar_options: __MODULE__.RadarOptions.t() | nil,
            revolut_pay: map() | nil,
            samsung_pay: map() | nil,
            satispay: map() | nil,
            sepa_debit: __MODULE__.SepaDebit.t() | nil,
            sofort: __MODULE__.Sofort.t() | nil,
            swish: map() | nil,
            twint: map() | nil,
            type: String.t() | nil,
            us_bank_account: __MODULE__.UsBankAccount.t() | nil,
            wechat_pay: map() | nil,
            zip: map() | nil
          }
    defstruct [
      :acss_debit,
      :affirm,
      :afterpay_clearpay,
      :alipay,
      :allow_redisplay,
      :alma,
      :amazon_pay,
      :au_becs_debit,
      :bacs_debit,
      :bancontact,
      :billie,
      :billing_details,
      :blik,
      :boleto,
      :cashapp,
      :crypto,
      :customer_balance,
      :eps,
      :fpx,
      :giropay,
      :grabpay,
      :ideal,
      :interac_present,
      :kakao_pay,
      :klarna,
      :konbini,
      :kr_card,
      :link,
      :mb_way,
      :metadata,
      :mobilepay,
      :multibanco,
      :naver_pay,
      :nz_bank_account,
      :oxxo,
      :p24,
      :pay_by_bank,
      :payco,
      :paynow,
      :paypal,
      :payto,
      :pix,
      :promptpay,
      :radar_options,
      :revolut_pay,
      :samsung_pay,
      :satispay,
      :sepa_debit,
      :sofort,
      :swish,
      :twint,
      :type,
      :us_bank_account,
      :wechat_pay,
      :zip
    ]

    defmodule AcssDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_number` - Customer's bank account number. Max length: 5000.
      * `institution_number` - Institution number of the customer's bank. Max length: 5000.
      * `transit_number` - Transit number of the customer's bank. Max length: 5000.
      """
      @type t :: %__MODULE__{
              account_number: String.t() | nil,
              institution_number: String.t() | nil,
              transit_number: String.t() | nil
            }
      defstruct [:account_number, :institution_number, :transit_number]
    end

    defmodule AuBecsDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_number` - The account number for the bank account. Max length: 5000.
      * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000.
      """
      @type t :: %__MODULE__{
              account_number: String.t() | nil,
              bsb_number: String.t() | nil
            }
      defstruct [:account_number, :bsb_number]
    end

    defmodule BacsDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_number` - Account number of the bank account that the funds will be debited from. Max length: 5000.
      * `sort_code` - Sort code of the bank account. (e.g., `10-20-30`) Max length: 5000.
      """
      @type t :: %__MODULE__{
              account_number: String.t() | nil,
              sort_code: String.t() | nil
            }
      defstruct [:account_number, :sort_code]
    end

    defmodule BillingDetails do
      @moduledoc "Nested parameters."

      @typedoc """
      * `address` - Billing address.
      * `email` - Email address.
      * `name` - Full name.
      * `phone` - Billing phone number (including extension).
      * `tax_id` - Taxpayer identification number. Used only for transactions between LATAM buyers and non-LATAM sellers. Max length: 5000.
      """
      @type t :: %__MODULE__{
              address: map() | nil,
              email: map() | nil,
              name: map() | nil,
              phone: map() | nil,
              tax_id: String.t() | nil
            }
      defstruct [:address, :email, :name, :phone, :tax_id]
    end

    defmodule Boleto do
      @moduledoc "Nested parameters."

      @typedoc """
      * `tax_id` - The tax ID of the customer (CPF for individual consumers or CNPJ for businesses consumers) Max length: 5000.
      """
      @type t :: %__MODULE__{
              tax_id: String.t() | nil
            }
      defstruct [:tax_id]
    end

    defmodule Eps do
      @moduledoc "Nested parameters."

      @typedoc """
      * `bank` - The customer's bank. Possible values: `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, `vr_bank_braunau`. Max length: 5000.
      """
      @type t :: %__MODULE__{
              bank: String.t() | nil
            }
      defstruct [:bank]
    end

    defmodule Fpx do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_holder_type` - Account holder type for FPX transaction Possible values: `company`, `individual`. Max length: 5000.
      * `bank` - The customer's bank. Possible values: `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_of_china`, `bank_rakyat`, `bsn`, `cimb`, `deutsche_bank`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2e`, `maybank2u`, `ocbc`, `pb_enterprise`, `public_bank`, `rhb`, `standard_chartered`, `uob`. Max length: 5000.
      """
      @type t :: %__MODULE__{
              account_holder_type: String.t() | nil,
              bank: String.t() | nil
            }
      defstruct [:account_holder_type, :bank]
    end

    defmodule Ideal do
      @moduledoc "Nested parameters."

      @typedoc """
      * `bank` - The customer's bank. Only use this parameter for existing customers. Don't use it for new customers. Possible values: `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, `yoursafe`. Max length: 5000.
      """
      @type t :: %__MODULE__{
              bank: String.t() | nil
            }
      defstruct [:bank]
    end

    defmodule Klarna do
      @moduledoc "Nested parameters."

      @typedoc """
      * `dob` - Customer's date of birth
      """
      @type t :: %__MODULE__{
              dob: __MODULE__.Dob.t() | nil
            }
      defstruct [:dob]

      defmodule Dob do
        @moduledoc "Nested parameters."

        @typedoc """
        * `day` - The day of birth, between 1 and 31.
        * `month` - The month of birth, between 1 and 12.
        * `year` - The four-digit year of birth.
        """
        @type t :: %__MODULE__{
                day: integer() | nil,
                month: integer() | nil,
                year: integer() | nil
              }
        defstruct [:day, :month, :year]
      end
    end

    defmodule NaverPay do
      @moduledoc "Nested parameters."

      @typedoc """
      * `funding` - Whether to use Naver Pay points or a card to fund this transaction. If not provided, this defaults to `card`. Possible values: `card`, `points`.
      """
      @type t :: %__MODULE__{
              funding: String.t() | nil
            }
      defstruct [:funding]
    end

    defmodule NzBankAccount do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_holder_name` - The name on the bank account. Only required if the account holder name is different from the name of the authorized signatory collected in the PaymentMethod’s billing details. Max length: 5000.
      * `account_number` - The account number for the bank account. Max length: 5000.
      * `bank_code` - The numeric code for the bank account's bank. Max length: 5000.
      * `branch_code` - The numeric code for the bank account's bank branch. Max length: 5000.
      * `reference` - Max length: 128.
      * `suffix` - The suffix of the bank account number. Max length: 5000.
      """
      @type t :: %__MODULE__{
              account_holder_name: String.t() | nil,
              account_number: String.t() | nil,
              bank_code: String.t() | nil,
              branch_code: String.t() | nil,
              reference: String.t() | nil,
              suffix: String.t() | nil
            }
      defstruct [
        :account_holder_name,
        :account_number,
        :bank_code,
        :branch_code,
        :reference,
        :suffix
      ]
    end

    defmodule P24 do
      @moduledoc "Nested parameters."

      @typedoc """
      * `bank` - The customer's bank. Possible values: `alior_bank`, `bank_millennium`, `bank_nowy_bfg_sa`, `bank_pekao_sa`, `banki_spbdzielcze`, `blik`, `bnp_paribas`, `boz`, `citi_handlowy`, `credit_agricole`, `envelobank`, `etransfer_pocztowy24`, `getin_bank`, `ideabank`, `ing`, `inteligo`, `mbank_mtransfer`, `nest_przelew`, `noble_pay`, `pbac_z_ipko`, `plus_bank`, `santander_przelew24`, `tmobile_usbugi_bankowe`, `toyota_bank`, `velobank`, `volkswagen_bank`.
      """
      @type t :: %__MODULE__{
              bank: String.t() | nil
            }
      defstruct [:bank]
    end

    defmodule Payto do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_number` - The account number for the bank account. Max length: 5000.
      * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000.
      * `pay_id` - The PayID alias for the bank account. Max length: 5000.
      """
      @type t :: %__MODULE__{
              account_number: String.t() | nil,
              bsb_number: String.t() | nil,
              pay_id: String.t() | nil
            }
      defstruct [:account_number, :bsb_number, :pay_id]
    end

    defmodule RadarOptions do
      @moduledoc "Nested parameters."

      @typedoc """
      * `session` - A [Radar Session](https://docs.stripe.com/radar/radar-session) is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments. Max length: 5000.
      """
      @type t :: %__MODULE__{
              session: String.t() | nil
            }
      defstruct [:session]
    end

    defmodule SepaDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `iban` - IBAN of the bank account. Max length: 5000.
      """
      @type t :: %__MODULE__{
              iban: String.t() | nil
            }
      defstruct [:iban]
    end

    defmodule Sofort do
      @moduledoc "Nested parameters."

      @typedoc """
      * `country` - Two-letter ISO code representing the country the bank account is located in. Possible values: `AT`, `BE`, `DE`, `ES`, `IT`, `NL`.
      """
      @type t :: %__MODULE__{
              country: String.t() | nil
            }
      defstruct [:country]
    end

    defmodule UsBankAccount do
      @moduledoc "Nested parameters."

      @typedoc """
      * `account_holder_type` - Account holder type: individual or company. Possible values: `company`, `individual`.
      * `account_number` - Account number of the bank account. Max length: 5000.
      * `account_type` - Account type: checkings or savings. Defaults to checking if omitted. Possible values: `checking`, `savings`.
      * `financial_connections_account` - The ID of a Financial Connections Account to use as a payment method. Max length: 5000.
      * `routing_number` - Routing number of the bank account. Max length: 5000.
      """
      @type t :: %__MODULE__{
              account_holder_type: String.t() | nil,
              account_number: String.t() | nil,
              account_type: String.t() | nil,
              financial_connections_account: String.t() | nil,
              routing_number: String.t() | nil
            }
      defstruct [
        :account_holder_type,
        :account_number,
        :account_type,
        :financial_connections_account,
        :routing_number
      ]
    end
  end

  defmodule PaymentMethodOptions do
    @moduledoc "Nested parameters."

    @typedoc """
    * `acss_debit` - If this is a `acss_debit` SetupIntent, this sub-hash contains details about the ACSS Debit payment method options.
    * `amazon_pay` - If this is a `amazon_pay` SetupIntent, this sub-hash contains details about the AmazonPay payment method options.
    * `bacs_debit` - If this is a `bacs_debit` SetupIntent, this sub-hash contains details about the Bacs Debit payment method options.
    * `card` - Configuration for any card setup attempted on this SetupIntent.
    * `card_present` - If this is a `card_present` PaymentMethod, this sub-hash contains details about the card-present payment method options.
    * `klarna` - If this is a `klarna` PaymentMethod, this hash contains details about the Klarna payment method options.
    * `link` - If this is a `link` PaymentMethod, this sub-hash contains details about the Link payment method options.
    * `paypal` - If this is a `paypal` PaymentMethod, this sub-hash contains details about the PayPal payment method options.
    * `payto` - If this is a `payto` SetupIntent, this sub-hash contains details about the PayTo payment method options.
    * `sepa_debit` - If this is a `sepa_debit` SetupIntent, this sub-hash contains details about the SEPA Debit payment method options.
    * `us_bank_account` - If this is a `us_bank_account` SetupIntent, this sub-hash contains details about the US bank account payment method options.
    """
    @type t :: %__MODULE__{
            acss_debit: __MODULE__.AcssDebit.t() | nil,
            amazon_pay: map() | nil,
            bacs_debit: __MODULE__.BacsDebit.t() | nil,
            card: __MODULE__.Card.t() | nil,
            card_present: map() | nil,
            klarna: __MODULE__.Klarna.t() | nil,
            link: __MODULE__.Link.t() | nil,
            paypal: __MODULE__.Paypal.t() | nil,
            payto: __MODULE__.Payto.t() | nil,
            sepa_debit: __MODULE__.SepaDebit.t() | nil,
            us_bank_account: __MODULE__.UsBankAccount.t() | nil
          }
    defstruct [
      :acss_debit,
      :amazon_pay,
      :bacs_debit,
      :card,
      :card_present,
      :klarna,
      :link,
      :paypal,
      :payto,
      :sepa_debit,
      :us_bank_account
    ]

    defmodule AcssDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Possible values: `cad`, `usd`.
      * `mandate_options` - Additional fields for Mandate creation
      * `verification_method` - Bank account verification method. Possible values: `automatic`, `instant`, `microdeposits`.
      """
      @type t :: %__MODULE__{
              currency: String.t() | nil,
              mandate_options: __MODULE__.MandateOptions.t() | nil,
              verification_method: String.t() | nil
            }
      defstruct [:currency, :mandate_options, :verification_method]

      defmodule MandateOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `custom_mandate_url` - A URL for custom mandate text to render during confirmation step.
        The URL will be rendered with additional GET parameters `payment_intent` and `payment_intent_client_secret` when confirming a Payment Intent,
        or `setup_intent` and `setup_intent_client_secret` when confirming a Setup Intent.
        * `default_for` - List of Stripe products where this mandate can be selected automatically.
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

    defmodule BacsDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `mandate_options` - Additional fields for Mandate creation
      """
      @type t :: %__MODULE__{
              mandate_options: __MODULE__.MandateOptions.t() | nil
            }
      defstruct [:mandate_options]

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

    defmodule Card do
      @moduledoc "Nested parameters."

      @typedoc """
      * `mandate_options` - Configuration options for setting up an eMandate for cards issued in India.
      * `moto` - When specified, this parameter signals that a card has been collected
      as MOTO (Mail Order Telephone Order) and thus out of scope for SCA. This
      parameter can only be provided during confirmation.
      * `network` - Selected network to process this SetupIntent on. Depends on the available networks of the card attached to the SetupIntent. Can be only set confirm-time. Possible values: `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `girocard`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `unknown`, `visa`. Max length: 5000.
      * `request_three_d_secure` - We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://docs.stripe.com/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. If not provided, this value defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://docs.stripe.com/payments/3d-secure/authentication-flow#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine. Possible values: `any`, `automatic`, `challenge`.
      * `three_d_secure` - If 3D Secure authentication was performed with a third-party provider,
      the authentication details to use for this setup.
      """
      @type t :: %__MODULE__{
              mandate_options: __MODULE__.MandateOptions.t() | nil,
              moto: boolean() | nil,
              network: String.t() | nil,
              request_three_d_secure: String.t() | nil,
              three_d_secure: __MODULE__.ThreeDSecure.t() | nil
            }
      defstruct [:mandate_options, :moto, :network, :request_three_d_secure, :three_d_secure]

      defmodule MandateOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `amount` - Amount to be charged for future payments.
        * `amount_type` - One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be charged in future payments. If `maximum`, the amount charged can be up to the value passed for the `amount` param. Possible values: `fixed`, `maximum`.
        * `currency` - Currency in which future payments will be charged. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
        * `description` - A description of the mandate or subscription that is meant to be displayed to the customer. Max length: 200.
        * `end_date` - End date of the mandate or subscription. If not provided, the mandate will be active until canceled. If provided, end date should be after start date. Format: Unix timestamp.
        * `interval` - Specifies payment frequency. One of `day`, `week`, `month`, `year`, or `sporadic`. Possible values: `day`, `month`, `sporadic`, `week`, `year`.
        * `interval_count` - The number of intervals between payments. For example, `interval=month` and `interval_count=3` indicates one payment every three months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks). This parameter is optional when `interval=sporadic`.
        * `reference` - Unique identifier for the mandate or subscription. Max length: 80.
        * `start_date` - Start date of the mandate or subscription. Start date should not be lesser than yesterday. Format: Unix timestamp.
        * `supported_types` - Specifies the type of mandates supported. Possible values are `india`.
        """
        @type t :: %__MODULE__{
                amount: integer() | nil,
                amount_type: String.t() | nil,
                currency: String.t() | nil,
                description: String.t() | nil,
                end_date: integer() | nil,
                interval: String.t() | nil,
                interval_count: integer() | nil,
                reference: String.t() | nil,
                start_date: integer() | nil,
                supported_types: [String.t()] | nil
              }
        defstruct [
          :amount,
          :amount_type,
          :currency,
          :description,
          :end_date,
          :interval,
          :interval_count,
          :reference,
          :start_date,
          :supported_types
        ]
      end

      defmodule ThreeDSecure do
        @moduledoc "Nested parameters."

        @typedoc """
        * `ares_trans_status` - The `transStatus` returned from the card Issuer’s ACS in the ARes. Possible values: `A`, `C`, `I`, `N`, `R`, `U`, `Y`.
        * `cryptogram` - The cryptogram, also known as the "authentication value" (AAV, CAVV or
        AEVV). This value is 20 bytes, base64-encoded into a 28-character string.
        (Most 3D Secure providers will return the base64-encoded version, which
        is what you should specify here.) Max length: 5000.
        * `electronic_commerce_indicator` - The Electronic Commerce Indicator (ECI) is returned by your 3D Secure
        provider and indicates what degree of authentication was performed. Possible values: `01`, `02`, `05`, `06`, `07`.
        * `network_options` - Network specific 3DS fields. Network specific arguments require an
        explicit card brand choice. The parameter `payment_method_options.card.network`
        must be populated accordingly
        * `requestor_challenge_indicator` - The challenge indicator (`threeDSRequestorChallengeInd`) which was requested in the
        AReq sent to the card Issuer's ACS. A string containing 2 digits from 01-99. Max length: 2.
        * `transaction_id` - For 3D Secure 1, the XID. For 3D Secure 2, the Directory Server
        Transaction ID (dsTransID). Max length: 5000.
        * `version` - The version of 3D Secure that was performed. Possible values: `1.0.2`, `2.1.0`, `2.2.0`, `2.3.0`, `2.3.1`.
        """
        @type t :: %__MODULE__{
                ares_trans_status: String.t() | nil,
                cryptogram: String.t() | nil,
                electronic_commerce_indicator: String.t() | nil,
                network_options: __MODULE__.NetworkOptions.t() | nil,
                requestor_challenge_indicator: String.t() | nil,
                transaction_id: String.t() | nil,
                version: String.t() | nil
              }
        defstruct [
          :ares_trans_status,
          :cryptogram,
          :electronic_commerce_indicator,
          :network_options,
          :requestor_challenge_indicator,
          :transaction_id,
          :version
        ]

        defmodule NetworkOptions do
          @moduledoc "Nested parameters."

          @typedoc """
          * `cartes_bancaires` - Cartes Bancaires-specific 3DS fields.
          """
          @type t :: %__MODULE__{
                  cartes_bancaires: __MODULE__.CartesBancaires.t() | nil
                }
          defstruct [:cartes_bancaires]

          defmodule CartesBancaires do
            @moduledoc "Nested parameters."

            @typedoc """
            * `cb_avalgo` - The cryptogram calculation algorithm used by the card Issuer's ACS
            to calculate the Authentication cryptogram. Also known as `cavvAlgorithm`.
            messageExtension: CB-AVALGO Possible values: `0`, `1`, `2`, `3`, `4`, `A`.
            * `cb_exemption` - The exemption indicator returned from Cartes Bancaires in the ARes.
            message extension: CB-EXEMPTION; string (4 characters)
            This is a 3 byte bitmap (low significant byte first and most significant
            bit first) that has been Base64 encoded Max length: 4.
            * `cb_score` - The risk score returned from Cartes Bancaires in the ARes.
            message extension: CB-SCORE; numeric value 0-99
            """
            @type t :: %__MODULE__{
                    cb_avalgo: String.t() | nil,
                    cb_exemption: String.t() | nil,
                    cb_score: integer() | nil
                  }
            defstruct [:cb_avalgo, :cb_exemption, :cb_score]
          end
        end
      end
    end

    defmodule Klarna do
      @moduledoc "Nested parameters."

      @typedoc """
      * `currency` - The currency of the SetupIntent. Three letter ISO currency code. Format: ISO 4217 currency code.
      * `on_demand` - On-demand details if setting up a payment method for on-demand payments.
      * `preferred_locale` - Preferred language of the Klarna authorization page that the customer is redirected to Possible values: `cs-CZ`, `da-DK`, `de-AT`, `de-CH`, `de-DE`, `el-GR`, `en-AT`, `en-AU`, `en-BE`, `en-CA`, `en-CH`, `en-CZ`, `en-DE`, `en-DK`, `en-ES`, `en-FI`, `en-FR`, `en-GB`, `en-GR`, `en-IE`, `en-IT`, `en-NL`, `en-NO`, `en-NZ`, `en-PL`, `en-PT`, `en-RO`, `en-SE`, `en-US`, `es-ES`, `es-US`, `fi-FI`, `fr-BE`, `fr-CA`, `fr-CH`, `fr-FR`, `it-CH`, `it-IT`, `nb-NO`, `nl-BE`, `nl-NL`, `pl-PL`, `pt-PT`, `ro-RO`, `sv-FI`, `sv-SE`.
      * `subscriptions` - Subscription details if setting up or charging a subscription
      """
      @type t :: %__MODULE__{
              currency: String.t() | nil,
              on_demand: __MODULE__.OnDemand.t() | nil,
              preferred_locale: String.t() | nil,
              subscriptions: map() | nil
            }
      defstruct [:currency, :on_demand, :preferred_locale, :subscriptions]

      defmodule OnDemand do
        @moduledoc "Nested parameters."

        @typedoc """
        * `average_amount` - Your average amount value. You can use a value across your customer base, or segment based on customer type, country, etc.
        * `maximum_amount` - The maximum value you may charge a customer per purchase. You can use a value across your customer base, or segment based on customer type, country, etc.
        * `minimum_amount` - The lowest or minimum value you may charge a customer per purchase. You can use a value across your customer base, or segment based on customer type, country, etc.
        * `purchase_interval` - Interval at which the customer is making purchases Possible values: `day`, `month`, `week`, `year`.
        * `purchase_interval_count` - The number of `purchase_interval` between charges
        """
        @type t :: %__MODULE__{
                average_amount: integer() | nil,
                maximum_amount: integer() | nil,
                minimum_amount: integer() | nil,
                purchase_interval: String.t() | nil,
                purchase_interval_count: integer() | nil
              }
        defstruct [
          :average_amount,
          :maximum_amount,
          :minimum_amount,
          :purchase_interval,
          :purchase_interval_count
        ]
      end
    end

    defmodule Link do
      @moduledoc "Nested parameters."

      @typedoc """
      * `persistent_token` - [Deprecated] This is a legacy parameter that no longer has any function. Max length: 5000.
      """
      @type t :: %__MODULE__{
              persistent_token: String.t() | nil
            }
      defstruct [:persistent_token]
    end

    defmodule Paypal do
      @moduledoc "Nested parameters."

      @typedoc """
      * `billing_agreement_id` - The PayPal Billing Agreement ID (BAID). This is an ID generated by PayPal which represents the mandate between the merchant and the customer. Max length: 5000.
      """
      @type t :: %__MODULE__{
              billing_agreement_id: String.t() | nil
            }
      defstruct [:billing_agreement_id]
    end

    defmodule Payto do
      @moduledoc "Nested parameters."

      @typedoc """
      * `mandate_options` - Additional fields for Mandate creation.
      """
      @type t :: %__MODULE__{
              mandate_options: __MODULE__.MandateOptions.t() | nil
            }
      defstruct [:mandate_options]

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

    defmodule SepaDebit do
      @moduledoc "Nested parameters."

      @typedoc """
      * `mandate_options` - Additional fields for Mandate creation
      """
      @type t :: %__MODULE__{
              mandate_options: __MODULE__.MandateOptions.t() | nil
            }
      defstruct [:mandate_options]

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

    defmodule UsBankAccount do
      @moduledoc "Nested parameters."

      @typedoc """
      * `financial_connections` - Additional fields for Financial Connections Session creation
      * `mandate_options` - Additional fields for Mandate creation
      * `networks` - Additional fields for network related functions
      * `verification_method` - Bank account verification method. Possible values: `automatic`, `instant`, `microdeposits`.
      """
      @type t :: %__MODULE__{
              financial_connections: __MODULE__.FinancialConnections.t() | nil,
              mandate_options: __MODULE__.MandateOptions.t() | nil,
              networks: __MODULE__.Networks.t() | nil,
              verification_method: String.t() | nil
            }
      defstruct [:financial_connections, :mandate_options, :networks, :verification_method]

      defmodule FinancialConnections do
        @moduledoc "Nested parameters."

        @typedoc """
        * `filters` - Provide filters for the linked accounts that the customer can select for the payment method.
        * `permissions` - The list of permissions to request. If this parameter is passed, the `payment_method` permission must be included. Valid permissions include: `balances`, `ownership`, `payment_method`, and `transactions`.
        * `prefetch` - List of data features that you would like to retrieve upon account creation.
        * `return_url` - For webview integrations only. Upon completing OAuth login in the native browser, the user will be redirected to this URL to return to your app. Max length: 5000.
        """
        @type t :: %__MODULE__{
                filters: __MODULE__.Filters.t() | nil,
                permissions: [String.t()] | nil,
                prefetch: [String.t()] | nil,
                return_url: String.t() | nil
              }
        defstruct [:filters, :permissions, :prefetch, :return_url]

        defmodule Filters do
          @moduledoc "Nested parameters."

          @typedoc """
          * `account_subcategories` - The account subcategories to use to filter for selectable accounts. Valid subcategories are `checking` and `savings`.
          """
          @type t :: %__MODULE__{
                  account_subcategories: [String.t()] | nil
                }
          defstruct [:account_subcategories]
        end
      end

      defmodule MandateOptions do
        @moduledoc "Nested parameters."

        @typedoc """
        * `collection_method` - The method used to collect offline mandate customer acceptance. Possible values: `paper`.
        """
        @type t :: %__MODULE__{
                collection_method: String.t() | nil
              }
        defstruct [:collection_method]
      end

      defmodule Networks do
        @moduledoc "Nested parameters."

        @typedoc """
        * `requested` - Triggers validations to run across the selected networks
        """
        @type t :: %__MODULE__{
                requested: [String.t()] | nil
              }
        defstruct [:requested]
      end
    end
  end
end
