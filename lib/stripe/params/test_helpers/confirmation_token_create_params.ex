# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.ConfirmationTokenCreateParams do
  @moduledoc "Parameters for confirmation token create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `payment_method` - ID of an existing PaymentMethod. Max length: 5000.
  * `payment_method_data` - If provided, this hash will be used to create a PaymentMethod.
  * `payment_method_options` - Payment-method-specific configuration for this ConfirmationToken.
  * `return_url` - Return URL used to confirm the Intent.
  * `setup_future_usage` - Indicates that you intend to make future payments with this ConfirmationToken's payment method.

  The presence of this property will [attach the payment method](https://docs.stripe.com/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. Possible values: `off_session`, `on_session`.
  * `shipping` - Shipping information for this ConfirmationToken.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          payment_method: String.t() | nil,
          payment_method_data: __MODULE__.PaymentMethodData.t() | nil,
          payment_method_options: __MODULE__.PaymentMethodOptions.t() | nil,
          return_url: String.t() | nil,
          setup_future_usage: String.t() | nil,
          shipping: __MODULE__.Shipping.t() | nil
        }

  defstruct [
    :expand,
    :payment_method,
    :payment_method_data,
    :payment_method_options,
    :return_url,
    :setup_future_usage,
    :shipping
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
    * `card` - Configuration for any card payments confirmed using this ConfirmationToken.
    """
    @type t :: %__MODULE__{
            card: __MODULE__.Card.t() | nil
          }
    defstruct [:card]

    defmodule Card do
      @moduledoc "Nested parameters."

      @typedoc """
      * `installments` - Installment configuration for payments confirmed using this ConfirmationToken.
      """
      @type t :: %__MODULE__{
              installments: __MODULE__.Installments.t() | nil
            }
      defstruct [:installments]

      defmodule Installments do
        @moduledoc "Nested parameters."

        @typedoc """
        * `plan` - The selected installment plan to use for this payment attempt.
        This parameter can only be provided during confirmation.
        """
        @type t :: %__MODULE__{
                plan: __MODULE__.Plan.t() | nil
              }
        defstruct [:plan]

        defmodule Plan do
          @moduledoc "Nested parameters."

          @typedoc """
          * `count` - For `fixed_count` installment plans, this is required. It represents the number of installment payments your customer will make to their credit card.
          * `interval` - For `fixed_count` installment plans, this is required. It represents the interval between installment payments your customer will make to their credit card.
          One of `month`. Possible values: `month`.
          * `type` - Type of installment plan, one of `fixed_count`, `bonus`, or `revolving`. Possible values: `bonus`, `fixed_count`, `revolving`.
          """
          @type t :: %__MODULE__{
                  count: integer() | nil,
                  interval: String.t() | nil,
                  type: String.t() | nil
                }
          defstruct [:count, :interval, :type]
        end
      end
    end
  end

  defmodule Shipping do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - Shipping address
    * `name` - Recipient name. Max length: 5000.
    * `phone` - Recipient phone (including extension)
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            name: String.t() | nil,
            phone: map() | nil
          }
    defstruct [:address, :name, :phone]

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
end
