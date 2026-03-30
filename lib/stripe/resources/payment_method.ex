# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentMethod do
  @moduledoc """
  PaymentMethod

  PaymentMethod objects represent your customer's payment instruments.
  You can use them with [PaymentIntents](https://docs.stripe.com/payments/payment-intents) to collect payments or save them to
  Customer objects to store instrument details for future payments.

  Related guides: [Payment Methods](https://docs.stripe.com/payments/payment-methods) and [More Payment Scenarios](https://docs.stripe.com/payments/more-payment-scenarios).
  """

  @typedoc """
  * `acss_debit` - Expandable.
  * `affirm` - Expandable.
  * `afterpay_clearpay` - Expandable.
  * `alipay` - Expandable.
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to “unspecified”. Possible values: `always`, `limited`, `unspecified`.
  * `alma` - Expandable.
  * `amazon_pay` - Expandable.
  * `au_becs_debit` - Expandable.
  * `bacs_debit` - Expandable.
  * `bancontact` - Expandable.
  * `billie` - Expandable.
  * `billing_details` - Expandable.
  * `blik` - Expandable.
  * `boleto` - Expandable.
  * `card` - Expandable.
  * `card_present` - Expandable.
  * `cashapp` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `crypto` - Expandable.
  * `custom` - Expandable.
  * `customer` - The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer. Nullable. Expandable.
  * `customer_account` - Max length: 5000. Nullable.
  * `customer_balance` - Expandable.
  * `eps` - Expandable.
  * `fpx` - Expandable.
  * `giropay` - Expandable.
  * `grabpay` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `ideal` - Expandable.
  * `interac_present` - Expandable.
  * `kakao_pay` - Expandable.
  * `klarna` - Expandable.
  * `konbini` - Expandable.
  * `kr_card` - Expandable.
  * `link` - Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `mb_way` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `mobilepay` - Expandable.
  * `multibanco` - Expandable.
  * `naver_pay` - Expandable.
  * `nz_bank_account` - Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_method`.
  * `oxxo` - Expandable.
  * `p24` - Expandable.
  * `pay_by_bank` - Expandable.
  * `payco` - Expandable.
  * `paynow` - Expandable.
  * `paypal` - Expandable.
  * `payto` - Expandable.
  * `pix` - Expandable.
  * `promptpay` - Expandable.
  * `radar_options` - Expandable.
  * `revolut_pay` - Expandable.
  * `samsung_pay` - Expandable.
  * `satispay` - Expandable.
  * `sepa_debit` - Expandable.
  * `sofort` - Expandable.
  * `swish` - Expandable.
  * `twint` - Expandable.
  * `type` - The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type. Possible values: `acss_debit`, `affirm`, `afterpay_clearpay`, `alipay`, `alma`, `amazon_pay`, `au_becs_debit`, `bacs_debit`, `bancontact`, `billie`, `blik`, `boleto`, `card`, `card_present`, `cashapp`, `crypto`, `custom`, `customer_balance`, `eps`, `fpx`, `giropay`, `grabpay`, `ideal`, `interac_present`, `kakao_pay`, `klarna`, `konbini`, `kr_card`, `link`, `mb_way`, `mobilepay`, `multibanco`, `naver_pay`, `nz_bank_account`, `oxxo`, `p24`, `pay_by_bank`, `payco`, `paynow`, `paypal`, `payto`, `pix`, `promptpay`, `revolut_pay`, `samsung_pay`, `satispay`, `sepa_debit`, `sofort`, `swish`, `twint`, `us_bank_account`, `wechat_pay`, `zip`.
  * `us_bank_account` - Expandable.
  * `wechat_pay` - Expandable.
  * `zip` - Expandable.
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
          billing_details: __MODULE__.BillingDetails.t(),
          blik: map() | nil,
          boleto: __MODULE__.Boleto.t() | nil,
          card: __MODULE__.Card.t() | nil,
          card_present: __MODULE__.CardPresent.t() | nil,
          cashapp: __MODULE__.Cashapp.t() | nil,
          created: integer(),
          crypto: Stripe.Resources.Crypto.t() | nil,
          custom: Stripe.Resources.Custom.t() | nil,
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          customer_balance: map() | nil,
          eps: __MODULE__.Eps.t() | nil,
          fpx: __MODULE__.Fpx.t() | nil,
          giropay: map() | nil,
          grabpay: map() | nil,
          id: String.t(),
          ideal: __MODULE__.Ideal.t() | nil,
          interac_present: __MODULE__.InteracPresent.t() | nil,
          kakao_pay: Stripe.Resources.KakaoPay.t() | nil,
          klarna: __MODULE__.Klarna.t() | nil,
          konbini: map() | nil,
          kr_card: Stripe.Resources.KrCard.t() | nil,
          link: __MODULE__.Link.t() | nil,
          livemode: boolean(),
          mb_way: Stripe.Resources.MbWay.t() | nil,
          metadata: %{String.t() => String.t()},
          mobilepay: map() | nil,
          multibanco: map() | nil,
          naver_pay: Stripe.Resources.NaverPay.t() | nil,
          nz_bank_account: __MODULE__.NzBankAccount.t() | nil,
          object: String.t(),
          oxxo: map() | nil,
          p24: __MODULE__.P24.t() | nil,
          pay_by_bank: map() | nil,
          payco: Stripe.Resources.Payco.t() | nil,
          paynow: map() | nil,
          paypal: __MODULE__.Paypal.t() | nil,
          payto: __MODULE__.Payto.t() | nil,
          pix: map() | nil,
          promptpay: map() | nil,
          radar_options: __MODULE__.RadarOptions.t() | nil,
          revolut_pay: map() | nil,
          samsung_pay: Stripe.Resources.SamsungPay.t() | nil,
          satispay: map() | nil,
          sepa_debit: __MODULE__.SepaDebit.t() | nil,
          sofort: __MODULE__.Sofort.t() | nil,
          swish: map() | nil,
          twint: map() | nil,
          type: String.t(),
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
    :card,
    :card_present,
    :cashapp,
    :created,
    :crypto,
    :custom,
    :customer,
    :customer_account,
    :customer_balance,
    :eps,
    :fpx,
    :giropay,
    :grabpay,
    :id,
    :ideal,
    :interac_present,
    :kakao_pay,
    :klarna,
    :konbini,
    :kr_card,
    :link,
    :livemode,
    :mb_way,
    :metadata,
    :mobilepay,
    :multibanco,
    :naver_pay,
    :nz_bank_account,
    :object,
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

  @object_name "payment_method"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "acss_debit",
      "affirm",
      "afterpay_clearpay",
      "alipay",
      "alma",
      "amazon_pay",
      "au_becs_debit",
      "bacs_debit",
      "bancontact",
      "billie",
      "billing_details",
      "blik",
      "boleto",
      "card",
      "card_present",
      "cashapp",
      "crypto",
      "custom",
      "customer",
      "customer_balance",
      "eps",
      "fpx",
      "giropay",
      "grabpay",
      "ideal",
      "interac_present",
      "kakao_pay",
      "klarna",
      "konbini",
      "kr_card",
      "link",
      "mb_way",
      "mobilepay",
      "multibanco",
      "naver_pay",
      "nz_bank_account",
      "oxxo",
      "p24",
      "pay_by_bank",
      "payco",
      "paynow",
      "paypal",
      "payto",
      "pix",
      "promptpay",
      "radar_options",
      "revolut_pay",
      "samsung_pay",
      "satispay",
      "sepa_debit",
      "sofort",
      "swish",
      "twint",
      "us_bank_account",
      "wechat_pay",
      "zip"
    ]

  defmodule AcssDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
    * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
    * `institution_number` - Institution number of the bank account. Max length: 5000. Nullable.
    * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
    * `transit_number` - Transit number of the bank account. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            bank_name: String.t() | nil,
            fingerprint: String.t() | nil,
            institution_number: String.t() | nil,
            last4: String.t() | nil,
            transit_number: String.t() | nil
          }
    defstruct [:bank_name, :fingerprint, :institution_number, :last4, :transit_number]
  end

  defmodule AuBecsDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bsb_number` - Six-digit number identifying bank and branch associated with this bank account. Max length: 5000. Nullable.
    * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
    * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            bsb_number: String.t() | nil,
            fingerprint: String.t() | nil,
            last4: String.t() | nil
          }
    defstruct [:bsb_number, :fingerprint, :last4]
  end

  defmodule BacsDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
    * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
    * `sort_code` - Sort code of the bank account. (e.g., `10-20-30`) Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            fingerprint: String.t() | nil,
            last4: String.t() | nil,
            sort_code: String.t() | nil
          }
    defstruct [:fingerprint, :last4, :sort_code]
  end

  defmodule BillingDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `address` - Billing address. Nullable.
    * `email` - Email address. Max length: 5000. Nullable.
    * `name` - Full name. Max length: 5000. Nullable.
    * `phone` - Billing phone number (including extension). Max length: 5000. Nullable.
    * `tax_id` - Taxpayer identification number. Used only for transactions between LATAM buyers and non-LATAM sellers. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            address: Stripe.Resources.Address.t() | nil,
            email: String.t() | nil,
            name: String.t() | nil,
            phone: String.t() | nil,
            tax_id: String.t() | nil
          }
    defstruct [:address, :email, :name, :phone, :tax_id]
  end

  defmodule Boleto do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `tax_id` - Uniquely identifies the customer tax id (CNPJ or CPF) Max length: 5000.
    """
    @type t :: %__MODULE__{
            tax_id: String.t() | nil
          }
    defstruct [:tax_id]
  end

  defmodule Card do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000.
    * `checks` - Checks on Card address and CVC if provided. Nullable.
    * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
    * `description` - A high-level description of the type of cards issued in this range. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `display_brand` - The brand to use when displaying the card, this accounts for customer's brand choice on dual-branded cards. Can be `american_express`, `cartes_bancaires`, `diners_club`, `discover`, `eftpos_australia`, `interac`, `jcb`, `mastercard`, `union_pay`, `visa`, or `other` and may contain more values in the future. Max length: 5000. Nullable.
    * `exp_month` - Two-digit number representing the card's expiration month.
    * `exp_year` - Four-digit number representing the card's expiration year.
    * `fingerprint` - Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

    *As of May 1, 2021, card fingerprint in India for Connect changed to allow two fingerprints for the same card---one for India and one for the rest of the world.* Max length: 5000. Nullable.
    * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000.
    * `generated_from` - Details of the original PaymentMethod that created this object. Nullable.
    * `iin` - Issuer identification number of the card. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `issuer` - The name of the card's issuing bank. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `last4` - The last four digits of the card. Max length: 5000.
    * `networks` - Contains information about card networks that can be used to process the payment. Nullable.
    * `regulated_status` - Status of a card based on the card issuer. Possible values: `regulated`, `unregulated`. Nullable.
    * `three_d_secure_usage` - Contains details on how this Card may be used for 3D Secure authentication. Nullable.
    * `wallet` - If this Card is part of a card wallet, this contains the details of the card wallet. Nullable.
    """
    @type t :: %__MODULE__{
            brand: String.t() | nil,
            checks: __MODULE__.Checks.t() | nil,
            country: String.t() | nil,
            description: String.t() | nil,
            display_brand: String.t() | nil,
            exp_month: integer() | nil,
            exp_year: integer() | nil,
            fingerprint: String.t() | nil,
            funding: String.t() | nil,
            generated_from: __MODULE__.GeneratedFrom.t() | nil,
            iin: String.t() | nil,
            issuer: String.t() | nil,
            last4: String.t() | nil,
            networks: __MODULE__.Networks.t() | nil,
            regulated_status: String.t() | nil,
            three_d_secure_usage: __MODULE__.ThreeDSecureUsage.t() | nil,
            wallet: __MODULE__.Wallet.t() | nil
          }
    defstruct [
      :brand,
      :checks,
      :country,
      :description,
      :display_brand,
      :exp_month,
      :exp_year,
      :fingerprint,
      :funding,
      :generated_from,
      :iin,
      :issuer,
      :last4,
      :networks,
      :regulated_status,
      :three_d_secure_usage,
      :wallet
    ]

    defmodule Checks do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `address_line1_check` - If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
      * `address_postal_code_check` - If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
      * `cvc_check` - If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              address_line1_check: String.t() | nil,
              address_postal_code_check: String.t() | nil,
              cvc_check: String.t() | nil
            }
      defstruct [:address_line1_check, :address_postal_code_check, :cvc_check]
    end

    defmodule GeneratedFrom do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `charge` - The charge that created this object. Max length: 5000. Nullable.
      * `payment_method_details` - Transaction-specific details of the payment method used in the payment. Nullable.
      * `setup_attempt` - The ID of the SetupAttempt that generated this PaymentMethod, if any. Nullable.
      """
      @type t :: %__MODULE__{
              charge: String.t() | nil,
              payment_method_details: __MODULE__.PaymentMethodDetails.t() | nil,
              setup_attempt: String.t() | Stripe.Resources.SetupAttempt.t() | nil
            }
      defstruct [:charge, :payment_method_details, :setup_attempt]

      defmodule PaymentMethodDetails do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `card_present`
        * `type` - The type of payment method transaction-specific details from the transaction that generated this `card` payment method. Always `card_present`. Max length: 5000.
        """
        @type t :: %__MODULE__{
                card_present: __MODULE__.CardPresent.t() | nil,
                type: String.t() | nil
              }
        defstruct [:card_present, :type]

        defmodule CardPresent do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `amount_authorized` - The authorized amount Nullable.
          * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000. Nullable.
          * `brand_product` - The [product code](https://stripe.com/docs/card-product-codes) that identifies the specific program or product associated with a card. Max length: 5000. Nullable.
          * `capture_before` - When using manual capture, a future timestamp after which the charge will be automatically refunded if uncaptured. Format: Unix timestamp.
          * `cardholder_name` - The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`). In some cases, the cardholder name may not be available depending on how the issuer has configured the card. Cardholder name is typically not available on swipe or contactless payments, such as those made with Apple Pay and Google Pay. Max length: 5000. Nullable.
          * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
          * `description` - A high-level description of the type of cards issued in this range. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
          * `emv_auth_data` - Authorization response cryptogram. Max length: 5000. Nullable.
          * `exp_month` - Two-digit number representing the card's expiration month.
          * `exp_year` - Four-digit number representing the card's expiration year.
          * `fingerprint` - Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

          *As of May 1, 2021, card fingerprint in India for Connect changed to allow two fingerprints for the same card---one for India and one for the rest of the world.* Max length: 5000. Nullable.
          * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
          * `generated_card` - ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod. Max length: 5000. Nullable.
          * `iin` - Issuer identification number of the card. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
          * `incremental_authorization_supported` - Whether this [PaymentIntent](https://docs.stripe.com/api/payment_intents) is eligible for incremental authorizations. Request support using [request_incremental_authorization_support](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-payment_method_options-card_present-request_incremental_authorization_support).
          * `issuer` - The name of the card's issuing bank. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
          * `last4` - The last four digits of the card. Max length: 5000. Nullable.
          * `location` - ID of the [location](https://docs.stripe.com/api/terminal/locations) that this transaction's reader is assigned to. Max length: 5000.
          * `network` - Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`. Max length: 5000. Nullable.
          * `network_transaction_id` - This is used by the financial networks to identify a transaction. Visa calls this the Transaction ID, Mastercard calls this the Trace ID, and American Express calls this the Acquirer Reference Data. This value will be present if it is returned by the financial network in the authorization response, and null otherwise. Max length: 5000. Nullable.
          * `offline` - Details about payments collected offline. Nullable.
          * `overcapture_supported` - Defines whether the authorized amount can be over-captured or not
          * `preferred_locales` - The languages that the issuing bank recommends using for localizing any customer-facing text, as read from the card. Referenced from EMV tag 5F2D, data encoded on the card's chip. Nullable.
          * `read_method` - How card details were read in this transaction. Possible values: `contact_emv`, `contactless_emv`, `contactless_magstripe_mode`, `magnetic_stripe_fallback`, `magnetic_stripe_track2`. Nullable.
          * `reader` - ID of the [reader](https://docs.stripe.com/api/terminal/readers) this transaction was made on. Max length: 5000.
          * `receipt` - A collection of fields required to be displayed on receipts. Only required for EMV transactions. Nullable.
          * `wallet`
          """
          @type t :: %__MODULE__{
                  amount_authorized: integer() | nil,
                  brand: String.t() | nil,
                  brand_product: String.t() | nil,
                  capture_before: integer() | nil,
                  cardholder_name: String.t() | nil,
                  country: String.t() | nil,
                  description: String.t() | nil,
                  emv_auth_data: String.t() | nil,
                  exp_month: integer() | nil,
                  exp_year: integer() | nil,
                  fingerprint: String.t() | nil,
                  funding: String.t() | nil,
                  generated_card: String.t() | nil,
                  iin: String.t() | nil,
                  incremental_authorization_supported: boolean() | nil,
                  issuer: String.t() | nil,
                  last4: String.t() | nil,
                  location: String.t() | nil,
                  network: String.t() | nil,
                  network_transaction_id: String.t() | nil,
                  offline: Stripe.Resources.Offline.t() | nil,
                  overcapture_supported: boolean() | nil,
                  preferred_locales: [String.t()] | nil,
                  read_method: String.t() | nil,
                  reader: String.t() | nil,
                  receipt: __MODULE__.Receipt.t() | nil,
                  wallet: __MODULE__.Wallet.t() | nil
                }
          defstruct [
            :amount_authorized,
            :brand,
            :brand_product,
            :capture_before,
            :cardholder_name,
            :country,
            :description,
            :emv_auth_data,
            :exp_month,
            :exp_year,
            :fingerprint,
            :funding,
            :generated_card,
            :iin,
            :incremental_authorization_supported,
            :issuer,
            :last4,
            :location,
            :network,
            :network_transaction_id,
            :offline,
            :overcapture_supported,
            :preferred_locales,
            :read_method,
            :reader,
            :receipt,
            :wallet
          ]

          defmodule Receipt do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `account_type` - The type of account being debited or credited Possible values: `checking`, `credit`, `prepaid`, `unknown`.
            * `application_cryptogram` - The Application Cryptogram, a unique value generated by the card to authenticate the transaction with issuers. Max length: 5000. Nullable.
            * `application_preferred_name` - The Application Identifier (AID) on the card used to determine which networks are eligible to process the transaction. Referenced from EMV tag 9F12, data encoded on the card's chip. Max length: 5000. Nullable.
            * `authorization_code` - Identifier for this transaction. Max length: 5000. Nullable.
            * `authorization_response_code` - EMV tag 8A. A code returned by the card issuer. Max length: 5000. Nullable.
            * `cardholder_verification_method` - Describes the method used by the cardholder to verify ownership of the card. One of the following: `approval`, `failure`, `none`, `offline_pin`, `offline_pin_and_signature`, `online_pin`, or `signature`. Max length: 5000. Nullable.
            * `dedicated_file_name` - Similar to the application_preferred_name, identifying the applications (AIDs) available on the card. Referenced from EMV tag 84. Max length: 5000. Nullable.
            * `terminal_verification_results` - A 5-byte string that records the checks and validations that occur between the card and the terminal. These checks determine how the terminal processes the transaction and what risk tolerance is acceptable. Referenced from EMV Tag 95. Max length: 5000. Nullable.
            * `transaction_status_information` - An indication of which steps were completed during the card read process. Referenced from EMV Tag 9B. Max length: 5000. Nullable.
            """
            @type t :: %__MODULE__{
                    account_type: String.t() | nil,
                    application_cryptogram: String.t() | nil,
                    application_preferred_name: String.t() | nil,
                    authorization_code: String.t() | nil,
                    authorization_response_code: String.t() | nil,
                    cardholder_verification_method: String.t() | nil,
                    dedicated_file_name: String.t() | nil,
                    terminal_verification_results: String.t() | nil,
                    transaction_status_information: String.t() | nil
                  }
            defstruct [
              :account_type,
              :application_cryptogram,
              :application_preferred_name,
              :authorization_code,
              :authorization_response_code,
              :cardholder_verification_method,
              :dedicated_file_name,
              :terminal_verification_results,
              :transaction_status_information
            ]
          end

          defmodule Wallet do
            @moduledoc "Nested struct within the parent resource."

            @typedoc """
            * `type` - The type of mobile wallet, one of `apple_pay`, `google_pay`, `samsung_pay`, or `unknown`. Possible values: `apple_pay`, `google_pay`, `samsung_pay`, `unknown`.
            """
            @type t :: %__MODULE__{
                    type: String.t() | nil
                  }
            defstruct [:type]
          end

          def __inner_types__ do
            %{
              "receipt" => __MODULE__.Receipt,
              "wallet" => __MODULE__.Wallet
            }
          end
        end

        def __inner_types__ do
          %{
            "card_present" => __MODULE__.CardPresent
          }
        end
      end

      def __inner_types__ do
        %{
          "payment_method_details" => __MODULE__.PaymentMethodDetails
        }
      end
    end

    defmodule Networks do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
      * `preferred` - The preferred network for co-branded cards. Can be `cartes_bancaires`, `mastercard`, `visa` or `invalid_preference` if requested network is not valid for the card. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              available: [String.t()] | nil,
              preferred: String.t() | nil
            }
      defstruct [:available, :preferred]
    end

    defmodule ThreeDSecureUsage do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `supported` - Whether 3D Secure is supported on this card.
      """
      @type t :: %__MODULE__{
              supported: boolean() | nil
            }
      defstruct [:supported]
    end

    defmodule Wallet do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amex_express_checkout`
      * `apple_pay`
      * `dynamic_last4` - (For tokenized numbers only.) The last four digits of the device account number. Max length: 5000. Nullable.
      * `google_pay`
      * `link`
      * `masterpass`
      * `samsung_pay`
      * `type` - The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`, `masterpass`, `samsung_pay`, `visa_checkout`, or `link`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type. Possible values: `amex_express_checkout`, `apple_pay`, `google_pay`, `link`, `masterpass`, `samsung_pay`, `visa_checkout`.
      * `visa_checkout`
      """
      @type t :: %__MODULE__{
              amex_express_checkout: map() | nil,
              apple_pay: map() | nil,
              dynamic_last4: String.t() | nil,
              google_pay: map() | nil,
              link: map() | nil,
              masterpass: __MODULE__.Masterpass.t() | nil,
              samsung_pay: map() | nil,
              type: String.t() | nil,
              visa_checkout: __MODULE__.VisaCheckout.t() | nil
            }
      defstruct [
        :amex_express_checkout,
        :apple_pay,
        :dynamic_last4,
        :google_pay,
        :link,
        :masterpass,
        :samsung_pay,
        :type,
        :visa_checkout
      ]

      defmodule Masterpass do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `billing_address` - Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
        * `email` - Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
        * `name` - Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
        * `shipping_address` - Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
        """
        @type t :: %__MODULE__{
                billing_address: Stripe.Resources.Address.t() | nil,
                email: String.t() | nil,
                name: String.t() | nil,
                shipping_address: Stripe.Resources.Address.t() | nil
              }
        defstruct [:billing_address, :email, :name, :shipping_address]
      end

      defmodule VisaCheckout do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `billing_address` - Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
        * `email` - Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
        * `name` - Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
        * `shipping_address` - Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
        """
        @type t :: %__MODULE__{
                billing_address: Stripe.Resources.Address.t() | nil,
                email: String.t() | nil,
                name: String.t() | nil,
                shipping_address: Stripe.Resources.Address.t() | nil
              }
        defstruct [:billing_address, :email, :name, :shipping_address]
      end

      def __inner_types__ do
        %{
          "masterpass" => __MODULE__.Masterpass,
          "visa_checkout" => __MODULE__.VisaCheckout
        }
      end
    end

    def __inner_types__ do
      %{
        "checks" => __MODULE__.Checks,
        "generated_from" => __MODULE__.GeneratedFrom,
        "networks" => __MODULE__.Networks,
        "three_d_secure_usage" => __MODULE__.ThreeDSecureUsage,
        "wallet" => __MODULE__.Wallet
      }
    end
  end

  defmodule CardPresent do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000. Nullable.
    * `brand_product` - The [product code](https://stripe.com/docs/card-product-codes) that identifies the specific program or product associated with a card. Max length: 5000. Nullable.
    * `cardholder_name` - The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`). In some cases, the cardholder name may not be available depending on how the issuer has configured the card. Cardholder name is typically not available on swipe or contactless payments, such as those made with Apple Pay and Google Pay. Max length: 5000. Nullable.
    * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
    * `description` - A high-level description of the type of cards issued in this range. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `exp_month` - Two-digit number representing the card's expiration month.
    * `exp_year` - Four-digit number representing the card's expiration year.
    * `fingerprint` - Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

    *As of May 1, 2021, card fingerprint in India for Connect changed to allow two fingerprints for the same card---one for India and one for the rest of the world.* Max length: 5000. Nullable.
    * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
    * `iin` - Issuer identification number of the card. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `issuer` - The name of the card's issuing bank. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `last4` - The last four digits of the card. Max length: 5000. Nullable.
    * `networks` - Contains information about card networks that can be used to process the payment. Nullable.
    * `offline` - Details about payment methods collected offline. Nullable.
    * `preferred_locales` - The languages that the issuing bank recommends using for localizing any customer-facing text, as read from the card. Referenced from EMV tag 5F2D, data encoded on the card's chip. Nullable.
    * `read_method` - How card details were read in this transaction. Possible values: `contact_emv`, `contactless_emv`, `contactless_magstripe_mode`, `magnetic_stripe_fallback`, `magnetic_stripe_track2`. Nullable.
    * `wallet`
    """
    @type t :: %__MODULE__{
            brand: String.t() | nil,
            brand_product: String.t() | nil,
            cardholder_name: String.t() | nil,
            country: String.t() | nil,
            description: String.t() | nil,
            exp_month: integer() | nil,
            exp_year: integer() | nil,
            fingerprint: String.t() | nil,
            funding: String.t() | nil,
            iin: String.t() | nil,
            issuer: String.t() | nil,
            last4: String.t() | nil,
            networks: __MODULE__.Networks.t() | nil,
            offline: Stripe.Resources.Offline.t() | nil,
            preferred_locales: [String.t()] | nil,
            read_method: String.t() | nil,
            wallet: __MODULE__.Wallet.t() | nil
          }
    defstruct [
      :brand,
      :brand_product,
      :cardholder_name,
      :country,
      :description,
      :exp_month,
      :exp_year,
      :fingerprint,
      :funding,
      :iin,
      :issuer,
      :last4,
      :networks,
      :offline,
      :preferred_locales,
      :read_method,
      :wallet
    ]

    defmodule Networks do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
      * `preferred` - The preferred network for the card. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              available: [String.t()] | nil,
              preferred: String.t() | nil
            }
      defstruct [:available, :preferred]
    end

    defmodule Wallet do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `type` - The type of mobile wallet, one of `apple_pay`, `google_pay`, `samsung_pay`, or `unknown`. Possible values: `apple_pay`, `google_pay`, `samsung_pay`, `unknown`.
      """
      @type t :: %__MODULE__{
              type: String.t() | nil
            }
      defstruct [:type]
    end

    def __inner_types__ do
      %{
        "networks" => __MODULE__.Networks,
        "wallet" => __MODULE__.Wallet
      }
    end
  end

  defmodule Cashapp do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `buyer_id` - A unique and immutable identifier assigned by Cash App to every buyer. Max length: 5000. Nullable.
    * `cashtag` - A public identifier for buyers using Cash App. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            buyer_id: String.t() | nil,
            cashtag: String.t() | nil
          }
    defstruct [:buyer_id, :cashtag]
  end

  defmodule Eps do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bank` - The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`. Possible values: `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, `vr_bank_braunau`. Nullable.
    """
    @type t :: %__MODULE__{
            bank: String.t() | nil
          }
    defstruct [:bank]
  end

  defmodule Fpx do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `account_holder_type` - Account holder type, if provided. Can be one of `individual` or `company`. Possible values: `company`, `individual`. Nullable.
    * `bank` - The customer's bank, if provided. Can be one of `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, `pb_enterprise`, or `bank_of_china`. Possible values: `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_of_china`, `bank_rakyat`, `bsn`, `cimb`, `deutsche_bank`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2e`, `maybank2u`, `ocbc`, `pb_enterprise`, `public_bank`, `rhb`, `standard_chartered`, `uob`.
    """
    @type t :: %__MODULE__{
            account_holder_type: String.t() | nil,
            bank: String.t() | nil
          }
    defstruct [:account_holder_type, :bank]
  end

  defmodule Ideal do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bank` - The customer's bank, if provided. Can be one of `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, or `yoursafe`. Possible values: `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, `yoursafe`. Nullable.
    * `bic` - The Bank Identifier Code of the customer's bank, if the bank was provided. Possible values: `ABNANL2A`, `ADYBNL2A`, `ASNBNL21`, `BITSNL2A`, `BUNQNL2A`, `BUUTNL2A`, `FNOMNL22`, `FVLBNL22`, `HANDNL2A`, `INGBNL2A`, `KNABNL2H`, `MLLENL2A`, `MOYONL21`, `NNBANL2G`, `NTSBDEB1`, `RABONL2U`, `RBRBNL21`, `REVOIE23`, `REVOLT21`, `SNSBNL2A`, `TRIONL2U`. Nullable.
    """
    @type t :: %__MODULE__{
            bank: String.t() | nil,
            bic: String.t() | nil
          }
    defstruct [:bank, :bic]
  end

  defmodule InteracPresent do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `brand` - Card brand. Can be `interac`, `mastercard` or `visa`. Max length: 5000. Nullable.
    * `cardholder_name` - The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`). In some cases, the cardholder name may not be available depending on how the issuer has configured the card. Cardholder name is typically not available on swipe or contactless payments, such as those made with Apple Pay and Google Pay. Max length: 5000. Nullable.
    * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
    * `description` - A high-level description of the type of cards issued in this range. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `exp_month` - Two-digit number representing the card's expiration month.
    * `exp_year` - Four-digit number representing the card's expiration year.
    * `fingerprint` - Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

    *As of May 1, 2021, card fingerprint in India for Connect changed to allow two fingerprints for the same card---one for India and one for the rest of the world.* Max length: 5000. Nullable.
    * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
    * `iin` - Issuer identification number of the card. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `issuer` - The name of the card's issuing bank. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
    * `last4` - The last four digits of the card. Max length: 5000. Nullable.
    * `networks` - Contains information about card networks that can be used to process the payment. Nullable.
    * `preferred_locales` - The languages that the issuing bank recommends using for localizing any customer-facing text, as read from the card. Referenced from EMV tag 5F2D, data encoded on the card's chip. Nullable.
    * `read_method` - How card details were read in this transaction. Possible values: `contact_emv`, `contactless_emv`, `contactless_magstripe_mode`, `magnetic_stripe_fallback`, `magnetic_stripe_track2`. Nullable.
    """
    @type t :: %__MODULE__{
            brand: String.t() | nil,
            cardholder_name: String.t() | nil,
            country: String.t() | nil,
            description: String.t() | nil,
            exp_month: integer() | nil,
            exp_year: integer() | nil,
            fingerprint: String.t() | nil,
            funding: String.t() | nil,
            iin: String.t() | nil,
            issuer: String.t() | nil,
            last4: String.t() | nil,
            networks: __MODULE__.Networks.t() | nil,
            preferred_locales: [String.t()] | nil,
            read_method: String.t() | nil
          }
    defstruct [
      :brand,
      :cardholder_name,
      :country,
      :description,
      :exp_month,
      :exp_year,
      :fingerprint,
      :funding,
      :iin,
      :issuer,
      :last4,
      :networks,
      :preferred_locales,
      :read_method
    ]

    defmodule Networks do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
      * `preferred` - The preferred network for the card. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              available: [String.t()] | nil,
              preferred: String.t() | nil
            }
      defstruct [:available, :preferred]
    end

    def __inner_types__ do
      %{
        "networks" => __MODULE__.Networks
      }
    end
  end

  defmodule Klarna do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `dob` - The customer's date of birth, if provided. Nullable.
    """
    @type t :: %__MODULE__{
            dob: __MODULE__.Dob.t() | nil
          }
    defstruct [:dob]

    defmodule Dob do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `day` - The day of birth, between 1 and 31. Nullable.
      * `month` - The month of birth, between 1 and 12. Nullable.
      * `year` - The four-digit year of birth. Nullable.
      """
      @type t :: %__MODULE__{
              day: integer() | nil,
              month: integer() | nil,
              year: integer() | nil
            }
      defstruct [:day, :month, :year]
    end

    def __inner_types__ do
      %{
        "dob" => __MODULE__.Dob
      }
    end
  end

  defmodule Link do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `email` - Account owner's email address. Max length: 5000. Nullable.
    * `persistent_token` - [Deprecated] This is a legacy parameter that no longer has any function. Max length: 5000.
    """
    @type t :: %__MODULE__{
            email: String.t() | nil,
            persistent_token: String.t() | nil
          }
    defstruct [:email, :persistent_token]
  end

  defmodule NzBankAccount do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `account_holder_name` - The name on the bank account. Only present if the account holder name is different from the name of the authorized signatory collected in the PaymentMethod’s billing details. Max length: 5000. Nullable.
    * `bank_code` - The numeric code for the bank account's bank. Max length: 5000.
    * `bank_name` - The name of the bank. Max length: 5000.
    * `branch_code` - The numeric code for the bank account's bank branch. Max length: 5000.
    * `last4` - Last four digits of the bank account number. Max length: 5000.
    * `suffix` - The suffix of the bank account number. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            account_holder_name: String.t() | nil,
            bank_code: String.t() | nil,
            bank_name: String.t() | nil,
            branch_code: String.t() | nil,
            last4: String.t() | nil,
            suffix: String.t() | nil
          }
    defstruct [:account_holder_name, :bank_code, :bank_name, :branch_code, :last4, :suffix]
  end

  defmodule P24 do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bank` - The customer's bank, if provided. Possible values: `alior_bank`, `bank_millennium`, `bank_nowy_bfg_sa`, `bank_pekao_sa`, `banki_spbdzielcze`, `blik`, `bnp_paribas`, `boz`, `citi_handlowy`, `credit_agricole`, `envelobank`, `etransfer_pocztowy24`, `getin_bank`, `ideabank`, `ing`, `inteligo`, `mbank_mtransfer`, `nest_przelew`, `noble_pay`, `pbac_z_ipko`, `plus_bank`, `santander_przelew24`, `tmobile_usbugi_bankowe`, `toyota_bank`, `velobank`, `volkswagen_bank`. Nullable.
    """
    @type t :: %__MODULE__{
            bank: String.t() | nil
          }
    defstruct [:bank]
  end

  defmodule Paypal do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `country` - Two-letter ISO code representing the buyer's country. Values are provided by PayPal directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
    * `payer_email` - Owner's email. Values are provided by PayPal directly
    (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
    * `payer_id` - PayPal account PayerID. This identifier uniquely identifies the PayPal customer. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            country: String.t() | nil,
            payer_email: String.t() | nil,
            payer_id: String.t() | nil
          }
    defstruct [:country, :payer_email, :payer_id]
  end

  defmodule Payto do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000. Nullable.
    * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
    * `pay_id` - The PayID alias for the bank account. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            bsb_number: String.t() | nil,
            last4: String.t() | nil,
            pay_id: String.t() | nil
          }
    defstruct [:bsb_number, :last4, :pay_id]
  end

  defmodule RadarOptions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `session` - A [Radar Session](https://docs.stripe.com/radar/radar-session) is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments. Max length: 5000.
    """
    @type t :: %__MODULE__{
            session: String.t() | nil
          }
    defstruct [:session]
  end

  defmodule SepaDebit do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
    * `branch_code` - Branch code of bank associated with the bank account. Max length: 5000. Nullable.
    * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
    * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
    * `generated_from` - Information about the object that generated this PaymentMethod. Nullable.
    * `last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            bank_code: String.t() | nil,
            branch_code: String.t() | nil,
            country: String.t() | nil,
            fingerprint: String.t() | nil,
            generated_from: __MODULE__.GeneratedFrom.t() | nil,
            last4: String.t() | nil
          }
    defstruct [:bank_code, :branch_code, :country, :fingerprint, :generated_from, :last4]

    defmodule GeneratedFrom do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `charge` - The ID of the Charge that generated this PaymentMethod, if any. Nullable.
      * `setup_attempt` - The ID of the SetupAttempt that generated this PaymentMethod, if any. Nullable.
      """
      @type t :: %__MODULE__{
              charge: String.t() | Stripe.Resources.Charge.t() | nil,
              setup_attempt: String.t() | Stripe.Resources.SetupAttempt.t() | nil
            }
      defstruct [:charge, :setup_attempt]
    end

    def __inner_types__ do
      %{
        "generated_from" => __MODULE__.GeneratedFrom
      }
    end
  end

  defmodule Sofort do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            country: String.t() | nil
          }
    defstruct [:country]
  end

  defmodule UsBankAccount do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `account_holder_type` - Account holder type: individual or company. Possible values: `company`, `individual`. Nullable.
    * `account_type` - Account type: checkings or savings. Defaults to checking if omitted. Possible values: `checking`, `savings`. Nullable.
    * `bank_name` - The name of the bank. Max length: 5000. Nullable.
    * `financial_connections_account` - The ID of the Financial Connections Account used to create the payment method. Max length: 5000. Nullable.
    * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
    * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
    * `networks` - Contains information about US bank account networks that can be used. Nullable.
    * `routing_number` - Routing number of the bank account. Max length: 5000. Nullable.
    * `status_details` - Contains information about the future reusability of this PaymentMethod. Nullable.
    """
    @type t :: %__MODULE__{
            account_holder_type: String.t() | nil,
            account_type: String.t() | nil,
            bank_name: String.t() | nil,
            financial_connections_account: String.t() | nil,
            fingerprint: String.t() | nil,
            last4: String.t() | nil,
            networks: __MODULE__.Networks.t() | nil,
            routing_number: String.t() | nil,
            status_details: __MODULE__.StatusDetails.t() | nil
          }
    defstruct [
      :account_holder_type,
      :account_type,
      :bank_name,
      :financial_connections_account,
      :fingerprint,
      :last4,
      :networks,
      :routing_number,
      :status_details
    ]

    defmodule Networks do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `preferred` - The preferred network. Max length: 5000. Nullable.
      * `supported` - All supported networks.
      """
      @type t :: %__MODULE__{
              preferred: String.t() | nil,
              supported: [String.t()] | nil
            }
      defstruct [:preferred, :supported]
    end

    defmodule StatusDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `blocked`
      """
      @type t :: %__MODULE__{
              blocked: __MODULE__.Blocked.t() | nil
            }
      defstruct [:blocked]

      defmodule Blocked do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `network_code` - The ACH network code that resulted in this block. Possible values: `R02`, `R03`, `R04`, `R05`, `R07`, `R08`, `R10`, `R11`, `R16`, `R20`, `R29`, `R31`. Nullable.
        * `reason` - The reason why this PaymentMethod's fingerprint has been blocked Possible values: `bank_account_closed`, `bank_account_frozen`, `bank_account_invalid_details`, `bank_account_restricted`, `bank_account_unusable`, `debit_not_authorized`, `tokenized_account_number_deactivated`. Nullable.
        """
        @type t :: %__MODULE__{
                network_code: String.t() | nil,
                reason: String.t() | nil
              }
        defstruct [:network_code, :reason]
      end

      def __inner_types__ do
        %{
          "blocked" => __MODULE__.Blocked
        }
      end
    end

    def __inner_types__ do
      %{
        "networks" => __MODULE__.Networks,
        "status_details" => __MODULE__.StatusDetails
      }
    end
  end

  def __inner_types__ do
    %{
      "acss_debit" => __MODULE__.AcssDebit,
      "au_becs_debit" => __MODULE__.AuBecsDebit,
      "bacs_debit" => __MODULE__.BacsDebit,
      "billing_details" => __MODULE__.BillingDetails,
      "boleto" => __MODULE__.Boleto,
      "card" => __MODULE__.Card,
      "card_present" => __MODULE__.CardPresent,
      "cashapp" => __MODULE__.Cashapp,
      "crypto" => Stripe.Resources.Crypto,
      "custom" => Stripe.Resources.Custom,
      "eps" => __MODULE__.Eps,
      "fpx" => __MODULE__.Fpx,
      "ideal" => __MODULE__.Ideal,
      "interac_present" => __MODULE__.InteracPresent,
      "kakao_pay" => Stripe.Resources.KakaoPay,
      "klarna" => __MODULE__.Klarna,
      "kr_card" => Stripe.Resources.KrCard,
      "link" => __MODULE__.Link,
      "mb_way" => Stripe.Resources.MbWay,
      "naver_pay" => Stripe.Resources.NaverPay,
      "nz_bank_account" => __MODULE__.NzBankAccount,
      "p24" => __MODULE__.P24,
      "payco" => Stripe.Resources.Payco,
      "paypal" => __MODULE__.Paypal,
      "payto" => __MODULE__.Payto,
      "radar_options" => __MODULE__.RadarOptions,
      "samsung_pay" => Stripe.Resources.SamsungPay,
      "sepa_debit" => __MODULE__.SepaDebit,
      "sofort" => __MODULE__.Sofort,
      "us_bank_account" => __MODULE__.UsBankAccount
    }
  end
end
