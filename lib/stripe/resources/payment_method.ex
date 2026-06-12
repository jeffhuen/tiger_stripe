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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
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
  * `type` - The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type. Possible values: `acss_debit`, `affirm`, `afterpay_clearpay`, `alipay`, `alma`, `amazon_pay`, `au_becs_debit`, `bacs_debit`, `bancontact`, `billie`, `blik`, `boleto`, `card`, `card_present`, `cashapp`, `crypto`, `custom`, `customer_balance`, `eps`, `fpx`, `giropay`, `grabpay`, `ideal`, `interac_present`, `kakao_pay`, `klarna`, `konbini`, `kr_card`, `link`, `mb_way`, `mobilepay`, `multibanco`, `naver_pay`, `nz_bank_account`, `oxxo`, `p24`, `pay_by_bank`, `payco`, `paynow`, `paypal`, `payto`, `pix`, `promptpay`, `revolut_pay`, `samsung_pay`, `satispay`, `sepa_debit`, `sofort`, `swish`, `twint`, `upi`, `us_bank_account`, `wechat_pay`, `zip`.
  * `upi` - Expandable.
  * `us_bank_account` - Expandable.
  * `wechat_pay` - Expandable.
  * `zip` - Expandable.
  """
  @type t :: %__MODULE__{
          acss_debit: acss_debit() | nil,
          affirm: map() | nil,
          afterpay_clearpay: map() | nil,
          alipay: map() | nil,
          allow_redisplay: String.t() | nil,
          alma: map() | nil,
          amazon_pay: map() | nil,
          au_becs_debit: au_becs_debit() | nil,
          bacs_debit: bacs_debit() | nil,
          bancontact: map() | nil,
          billie: map() | nil,
          billing_details: billing_details(),
          blik: map() | nil,
          boleto: boleto() | nil,
          card: card() | nil,
          card_present: card_present() | nil,
          cashapp: cashapp() | nil,
          created: integer(),
          crypto: Stripe.Resources.Crypto.t() | nil,
          custom: Stripe.Resources.Custom.t() | nil,
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          customer_balance: map() | nil,
          eps: eps() | nil,
          fpx: fpx() | nil,
          giropay: map() | nil,
          grabpay: map() | nil,
          id: String.t(),
          ideal: ideal() | nil,
          interac_present: interac_present() | nil,
          kakao_pay: Stripe.Resources.KakaoPay.t() | nil,
          klarna: klarna() | nil,
          konbini: map() | nil,
          kr_card: Stripe.Resources.KrCard.t() | nil,
          link: link() | nil,
          livemode: boolean(),
          mb_way: Stripe.Resources.MbWay.t() | nil,
          metadata: %{String.t() => String.t()},
          mobilepay: map() | nil,
          multibanco: map() | nil,
          naver_pay: Stripe.Resources.NaverPay.t() | nil,
          nz_bank_account: nz_bank_account() | nil,
          object: String.t(),
          oxxo: map() | nil,
          p24: p24() | nil,
          pay_by_bank: map() | nil,
          payco: Stripe.Resources.Payco.t() | nil,
          paynow: map() | nil,
          paypal: paypal() | nil,
          payto: payto() | nil,
          pix: map() | nil,
          promptpay: map() | nil,
          radar_options: radar_options() | nil,
          revolut_pay: map() | nil,
          samsung_pay: Stripe.Resources.SamsungPay.t() | nil,
          satispay: map() | nil,
          sepa_debit: sepa_debit() | nil,
          sofort: sofort() | nil,
          swish: map() | nil,
          twint: map() | nil,
          type: String.t(),
          upi: upi() | nil,
          us_bank_account: us_bank_account() | nil,
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
    :upi,
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
      "upi",
      "us_bank_account",
      "wechat_pay",
      "zip"
    ]

  @typedoc """
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `institution_number` - Institution number of the bank account. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `transit_number` - Transit number of the bank account. Max length: 5000. Nullable.
  """
  @type acss_debit :: %{
          optional(:bank_name) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:institution_number) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:transit_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bsb_number` - Six-digit number identifying bank and branch associated with this bank account. Max length: 5000. Nullable.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  """
  @type au_becs_debit :: %{
          optional(:bsb_number) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `sort_code` - Sort code of the bank account. (e.g., `10-20-30`) Max length: 5000. Nullable.
  """
  @type bacs_debit :: %{
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:sort_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - Billing address. Nullable.
  * `email` - Email address. Max length: 5000. Nullable.
  * `name` - Full name. Max length: 5000. Nullable.
  * `phone` - Billing phone number (including extension). Max length: 5000. Nullable.
  * `tax_id` - Taxpayer identification number. Used only for transactions between LATAM buyers and non-LATAM sellers. Max length: 5000. Nullable.
  """
  @type billing_details :: %{
          optional(:address) => Stripe.Resources.Address.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(:tax_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tax_id` - Uniquely identifies the customer tax id (CNPJ or CPF) Max length: 5000.
  """
  @type boleto :: %{
          optional(:tax_id) => String.t() | nil,
          optional(String.t()) => term()
        }

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
  @type card :: %{
          optional(:brand) => String.t() | nil,
          optional(:checks) => card_checks() | nil,
          optional(:country) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:display_brand) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:funding) => String.t() | nil,
          optional(:generated_from) => card_generated_from() | nil,
          optional(:iin) => String.t() | nil,
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:networks) => card_networks() | nil,
          optional(:regulated_status) => String.t() | nil,
          optional(:three_d_secure_usage) => card_three_d_secure_usage() | nil,
          optional(:wallet) => card_wallet() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address_line1_check` - If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  * `address_postal_code_check` - If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  * `cvc_check` - If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  """
  @type card_checks :: %{
          optional(:address_line1_check) => String.t() | nil,
          optional(:address_postal_code_check) => String.t() | nil,
          optional(:cvc_check) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `charge` - The charge that created this object. Max length: 5000. Nullable.
  * `payment_method_details` - Transaction-specific details of the payment method used in the payment. Nullable.
  * `setup_attempt` - The ID of the SetupAttempt that generated this PaymentMethod, if any. Nullable.
  """
  @type card_generated_from :: %{
          optional(:charge) => String.t() | nil,
          optional(:payment_method_details) => card_generated_from_payment_method_details() | nil,
          optional(:setup_attempt) => String.t() | Stripe.Resources.SetupAttempt.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_present`
  * `type` - The type of payment method transaction-specific details from the transaction that generated this `card` payment method. Always `card_present`. Max length: 5000.
  """
  @type card_generated_from_payment_method_details :: %{
          optional(:card_present) =>
            card_generated_from_payment_method_details_card_present() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

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
  @type card_generated_from_payment_method_details_card_present :: %{
          optional(:amount_authorized) => integer() | nil,
          optional(:brand) => String.t() | nil,
          optional(:brand_product) => String.t() | nil,
          optional(:capture_before) => integer() | nil,
          optional(:cardholder_name) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:emv_auth_data) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:funding) => String.t() | nil,
          optional(:generated_card) => String.t() | nil,
          optional(:iin) => String.t() | nil,
          optional(:incremental_authorization_supported) => boolean() | nil,
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:location) => String.t() | nil,
          optional(:network) => String.t() | nil,
          optional(:network_transaction_id) => String.t() | nil,
          optional(:offline) => Stripe.Resources.Offline.t() | nil,
          optional(:overcapture_supported) => boolean() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(:reader) => String.t() | nil,
          optional(:receipt) =>
            card_generated_from_payment_method_details_card_present_receipt() | nil,
          optional(:wallet) =>
            card_generated_from_payment_method_details_card_present_wallet() | nil,
          optional(String.t()) => term()
        }

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
  @type card_generated_from_payment_method_details_card_present_receipt :: %{
          optional(:account_type) => String.t() | nil,
          optional(:application_cryptogram) => String.t() | nil,
          optional(:application_preferred_name) => String.t() | nil,
          optional(:authorization_code) => String.t() | nil,
          optional(:authorization_response_code) => String.t() | nil,
          optional(:cardholder_verification_method) => String.t() | nil,
          optional(:dedicated_file_name) => String.t() | nil,
          optional(:terminal_verification_results) => String.t() | nil,
          optional(:transaction_status_information) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The type of mobile wallet, one of `apple_pay`, `google_pay`, `samsung_pay`, or `unknown`. Possible values: `apple_pay`, `google_pay`, `samsung_pay`, `unknown`.
  """
  @type card_generated_from_payment_method_details_card_present_wallet :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
  * `preferred` - The preferred network for co-branded cards. Can be `cartes_bancaires`, `mastercard`, `visa` or `invalid_preference` if requested network is not valid for the card. Max length: 5000. Nullable.
  """
  @type card_networks :: %{
          optional(:available) => [String.t()] | nil,
          optional(:preferred) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `supported` - Whether 3D Secure is supported on this card.
  """
  @type card_three_d_secure_usage :: %{
          optional(:supported) => boolean() | nil,
          optional(String.t()) => term()
        }

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
  @type card_wallet :: %{
          optional(:amex_express_checkout) => map() | nil,
          optional(:apple_pay) => map() | nil,
          optional(:dynamic_last4) => String.t() | nil,
          optional(:google_pay) => map() | nil,
          optional(:link) => map() | nil,
          optional(:masterpass) => card_wallet_masterpass() | nil,
          optional(:samsung_pay) => map() | nil,
          optional(:type) => String.t() | nil,
          optional(:visa_checkout) => card_wallet_visa_checkout() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_address` - Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
  * `email` - Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `name` - Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `shipping_address` - Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
  """
  @type card_wallet_masterpass :: %{
          optional(:billing_address) => Stripe.Resources.Address.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:shipping_address) => Stripe.Resources.Address.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_address` - Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
  * `email` - Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `name` - Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `shipping_address` - Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
  """
  @type card_wallet_visa_checkout :: %{
          optional(:billing_address) => Stripe.Resources.Address.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:shipping_address) => Stripe.Resources.Address.t() | nil,
          optional(String.t()) => term()
        }

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
  @type card_present :: %{
          optional(:brand) => String.t() | nil,
          optional(:brand_product) => String.t() | nil,
          optional(:cardholder_name) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:funding) => String.t() | nil,
          optional(:iin) => String.t() | nil,
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:networks) => card_present_networks() | nil,
          optional(:offline) => Stripe.Resources.Offline.t() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(:wallet) => card_present_wallet() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
  * `preferred` - The preferred network for the card. Max length: 5000. Nullable.
  """
  @type card_present_networks :: %{
          optional(:available) => [String.t()] | nil,
          optional(:preferred) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The type of mobile wallet, one of `apple_pay`, `google_pay`, `samsung_pay`, or `unknown`. Possible values: `apple_pay`, `google_pay`, `samsung_pay`, `unknown`.
  """
  @type card_present_wallet :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `buyer_id` - A unique and immutable identifier assigned by Cash App to every buyer. Max length: 5000. Nullable.
  * `cashtag` - A public identifier for buyers using Cash App. Max length: 5000. Nullable.
  """
  @type cashapp :: %{
          optional(:buyer_id) => String.t() | nil,
          optional(:cashtag) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`. Possible values: `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, `vr_bank_braunau`. Nullable.
  """
  @type eps :: %{
          optional(:bank) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_type` - Account holder type, if provided. Can be one of `individual` or `company`. Possible values: `company`, `individual`. Nullable.
  * `bank` - The customer's bank, if provided. Can be one of `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, `pb_enterprise`, or `bank_of_china`. Possible values: `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_of_china`, `bank_rakyat`, `bsn`, `cimb`, `deutsche_bank`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2e`, `maybank2u`, `ocbc`, `pb_enterprise`, `public_bank`, `rhb`, `standard_chartered`, `uob`.
  """
  @type fpx :: %{
          optional(:account_holder_type) => String.t() | nil,
          optional(:bank) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank, if provided. Can be one of `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, or `yoursafe`. Possible values: `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, `yoursafe`. Nullable.
  * `bic` - The Bank Identifier Code of the customer's bank, if the bank was provided. Possible values: `ABNANL2A`, `ADYBNL2A`, `ASNBNL21`, `BITSNL2A`, `BUNQNL2A`, `BUUTNL2A`, `FNOMNL22`, `FVLBNL22`, `HANDNL2A`, `INGBNL2A`, `KNABNL2H`, `MLLENL2A`, `MOYONL21`, `NNBANL2G`, `NTSBDEB1`, `RABONL2U`, `RBRBNL21`, `REVOIE23`, `REVOLT21`, `SNSBNL2A`, `TRIONL2U`. Nullable.
  """
  @type ideal :: %{
          optional(:bank) => String.t() | nil,
          optional(:bic) => String.t() | nil,
          optional(String.t()) => term()
        }

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
  @type interac_present :: %{
          optional(:brand) => String.t() | nil,
          optional(:cardholder_name) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:funding) => String.t() | nil,
          optional(:iin) => String.t() | nil,
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:networks) => interac_present_networks() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
  * `preferred` - The preferred network for the card. Max length: 5000. Nullable.
  """
  @type interac_present_networks :: %{
          optional(:available) => [String.t()] | nil,
          optional(:preferred) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dob` - The customer's date of birth, if provided. Nullable.
  """
  @type klarna :: %{
          optional(:dob) => klarna_dob() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - The day of birth, between 1 and 31. Nullable.
  * `month` - The month of birth, between 1 and 12. Nullable.
  * `year` - The four-digit year of birth. Nullable.
  """
  @type klarna_dob :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `email` - Account owner's email address. Max length: 5000. Nullable.
  * `persistent_token` - [Deprecated] This is a legacy parameter that no longer has any function. Max length: 5000.
  """
  @type link :: %{
          optional(:email) => String.t() | nil,
          optional(:persistent_token) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_name` - The name on the bank account. Only present if the account holder name is different from the name of the authorized signatory collected in the PaymentMethod’s billing details. Max length: 5000. Nullable.
  * `bank_code` - The numeric code for the bank account's bank. Max length: 5000.
  * `bank_name` - The name of the bank. Max length: 5000.
  * `branch_code` - The numeric code for the bank account's bank branch. Max length: 5000.
  * `last4` - Last four digits of the bank account number. Max length: 5000.
  * `suffix` - The suffix of the bank account number. Max length: 5000. Nullable.
  """
  @type nz_bank_account :: %{
          optional(:account_holder_name) => String.t() | nil,
          optional(:bank_code) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:branch_code) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:suffix) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank, if provided. Possible values: `alior_bank`, `bank_millennium`, `bank_nowy_bfg_sa`, `bank_pekao_sa`, `banki_spbdzielcze`, `blik`, `bnp_paribas`, `boz`, `citi_handlowy`, `credit_agricole`, `envelobank`, `etransfer_pocztowy24`, `getin_bank`, `ideabank`, `ing`, `inteligo`, `mbank_mtransfer`, `nest_przelew`, `noble_pay`, `pbac_z_ipko`, `plus_bank`, `santander_przelew24`, `tmobile_usbugi_bankowe`, `toyota_bank`, `velobank`, `volkswagen_bank`. Nullable.
  """
  @type p24 :: %{
          optional(:bank) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter ISO code representing the buyer's country. Values are provided by PayPal directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `payer_email` - Owner's email. Values are provided by PayPal directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `payer_id` - PayPal account PayerID. This identifier uniquely identifies the PayPal customer. Max length: 5000. Nullable.
  """
  @type paypal :: %{
          optional(:country) => String.t() | nil,
          optional(:payer_email) => String.t() | nil,
          optional(:payer_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `pay_id` - The PayID alias for the bank account. Max length: 5000. Nullable.
  """
  @type payto :: %{
          optional(:bsb_number) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:pay_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `session` - A [Radar Session](https://docs.stripe.com/radar/radar-session) is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments. Max length: 5000.
  """
  @type radar_options :: %{
          optional(:session) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
  * `branch_code` - Branch code of bank associated with the bank account. Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `generated_from` - Information about the object that generated this PaymentMethod. Nullable.
  * `last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
  """
  @type sepa_debit :: %{
          optional(:bank_code) => String.t() | nil,
          optional(:branch_code) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:generated_from) => sepa_debit_generated_from() | nil,
          optional(:last4) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `charge` - The ID of the Charge that generated this PaymentMethod, if any. Nullable.
  * `setup_attempt` - The ID of the SetupAttempt that generated this PaymentMethod, if any. Nullable.
  """
  @type sepa_debit_generated_from :: %{
          optional(:charge) => String.t() | Stripe.Resources.Charge.t() | nil,
          optional(:setup_attempt) => String.t() | Stripe.Resources.SetupAttempt.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
  """
  @type sofort :: %{
          optional(:country) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `vpa` - Customer's unique Virtual Payment Address Max length: 5000. Nullable.
  """
  @type upi :: %{
          optional(:vpa) => String.t() | nil,
          optional(String.t()) => term()
        }

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
  @type us_bank_account :: %{
          optional(:account_holder_type) => String.t() | nil,
          optional(:account_type) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:financial_connections_account) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:networks) => us_bank_account_networks() | nil,
          optional(:routing_number) => String.t() | nil,
          optional(:status_details) => us_bank_account_status_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `preferred` - The preferred network. Max length: 5000. Nullable.
  * `supported` - All supported networks.
  """
  @type us_bank_account_networks :: %{
          optional(:preferred) => String.t() | nil,
          optional(:supported) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `blocked`
  """
  @type us_bank_account_status_details :: %{
          optional(:blocked) => us_bank_account_status_details_blocked() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `network_code` - The ACH network code that resulted in this block. Possible values: `R02`, `R03`, `R04`, `R05`, `R07`, `R08`, `R10`, `R11`, `R16`, `R20`, `R29`, `R31`. Nullable.
  * `reason` - The reason why this PaymentMethod's fingerprint has been blocked Possible values: `bank_account_closed`, `bank_account_frozen`, `bank_account_invalid_details`, `bank_account_restricted`, `bank_account_unusable`, `debit_not_authorized`, `tokenized_account_number_deactivated`. Nullable.
  """
  @type us_bank_account_status_details_blocked :: %{
          optional(:network_code) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "acss_debit" => %{
        fields: %{
          "bank_name" => :scalar,
          "fingerprint" => :scalar,
          "institution_number" => :scalar,
          "last4" => :scalar,
          "transit_number" => :scalar
        }
      },
      "au_becs_debit" => %{
        fields: %{
          "bsb_number" => :scalar,
          "fingerprint" => :scalar,
          "last4" => :scalar
        }
      },
      "bacs_debit" => %{
        fields: %{
          "fingerprint" => :scalar,
          "last4" => :scalar,
          "sort_code" => :scalar
        }
      },
      "billing_details" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "email" => :scalar,
          "name" => :scalar,
          "phone" => :scalar,
          "tax_id" => :scalar
        }
      },
      "boleto" => %{
        fields: %{
          "tax_id" => :scalar
        }
      },
      "card" => %{
        fields: %{
          "brand" => :scalar,
          "checks" => %{
            fields: %{
              "address_line1_check" => :scalar,
              "address_postal_code_check" => :scalar,
              "cvc_check" => :scalar
            }
          },
          "country" => :scalar,
          "description" => :scalar,
          "display_brand" => :scalar,
          "exp_month" => :scalar,
          "exp_year" => :scalar,
          "fingerprint" => :scalar,
          "funding" => :scalar,
          "generated_from" => %{
            fields: %{
              "charge" => :scalar,
              "payment_method_details" => %{
                fields: %{
                  "card_present" => %{
                    fields: %{
                      "amount_authorized" => :scalar,
                      "brand" => :scalar,
                      "brand_product" => :scalar,
                      "capture_before" => :scalar,
                      "cardholder_name" => :scalar,
                      "country" => :scalar,
                      "description" => :scalar,
                      "emv_auth_data" => :scalar,
                      "exp_month" => :scalar,
                      "exp_year" => :scalar,
                      "fingerprint" => :scalar,
                      "funding" => :scalar,
                      "generated_card" => :scalar,
                      "iin" => :scalar,
                      "incremental_authorization_supported" => :scalar,
                      "issuer" => :scalar,
                      "last4" => :scalar,
                      "location" => :scalar,
                      "network" => :scalar,
                      "network_transaction_id" => :scalar,
                      "offline" => {:resource, Stripe.Resources.Offline},
                      "overcapture_supported" => :scalar,
                      "preferred_locales" => {:list, :scalar},
                      "read_method" => :scalar,
                      "reader" => :scalar,
                      "receipt" => %{
                        fields: %{
                          "account_type" => :scalar,
                          "application_cryptogram" => :scalar,
                          "application_preferred_name" => :scalar,
                          "authorization_code" => :scalar,
                          "authorization_response_code" => :scalar,
                          "cardholder_verification_method" => :scalar,
                          "dedicated_file_name" => :scalar,
                          "terminal_verification_results" => :scalar,
                          "transaction_status_information" => :scalar
                        }
                      },
                      "wallet" => %{
                        fields: %{
                          "type" => :scalar
                        }
                      }
                    }
                  },
                  "type" => :scalar
                }
              },
              "setup_attempt" => {:resource, Stripe.Resources.SetupAttempt}
            }
          },
          "iin" => :scalar,
          "issuer" => :scalar,
          "last4" => :scalar,
          "networks" => %{
            fields: %{
              "available" => {:list, :scalar},
              "preferred" => :scalar
            }
          },
          "regulated_status" => :scalar,
          "three_d_secure_usage" => %{
            fields: %{
              "supported" => :scalar
            }
          },
          "wallet" => %{
            fields: %{
              "amex_express_checkout" => :scalar,
              "apple_pay" => :scalar,
              "dynamic_last4" => :scalar,
              "google_pay" => :scalar,
              "link" => :scalar,
              "masterpass" => %{
                fields: %{
                  "billing_address" => {:resource, Stripe.Resources.Address},
                  "email" => :scalar,
                  "name" => :scalar,
                  "shipping_address" => {:resource, Stripe.Resources.Address}
                }
              },
              "samsung_pay" => :scalar,
              "type" => :scalar,
              "visa_checkout" => %{
                fields: %{
                  "billing_address" => {:resource, Stripe.Resources.Address},
                  "email" => :scalar,
                  "name" => :scalar,
                  "shipping_address" => {:resource, Stripe.Resources.Address}
                }
              }
            }
          }
        }
      },
      "card_present" => %{
        fields: %{
          "brand" => :scalar,
          "brand_product" => :scalar,
          "cardholder_name" => :scalar,
          "country" => :scalar,
          "description" => :scalar,
          "exp_month" => :scalar,
          "exp_year" => :scalar,
          "fingerprint" => :scalar,
          "funding" => :scalar,
          "iin" => :scalar,
          "issuer" => :scalar,
          "last4" => :scalar,
          "networks" => %{
            fields: %{
              "available" => {:list, :scalar},
              "preferred" => :scalar
            }
          },
          "offline" => {:resource, Stripe.Resources.Offline},
          "preferred_locales" => {:list, :scalar},
          "read_method" => :scalar,
          "wallet" => %{
            fields: %{
              "type" => :scalar
            }
          }
        }
      },
      "cashapp" => %{
        fields: %{
          "buyer_id" => :scalar,
          "cashtag" => :scalar
        }
      },
      "eps" => %{
        fields: %{
          "bank" => :scalar
        }
      },
      "fpx" => %{
        fields: %{
          "account_holder_type" => :scalar,
          "bank" => :scalar
        }
      },
      "ideal" => %{
        fields: %{
          "bank" => :scalar,
          "bic" => :scalar
        }
      },
      "interac_present" => %{
        fields: %{
          "brand" => :scalar,
          "cardholder_name" => :scalar,
          "country" => :scalar,
          "description" => :scalar,
          "exp_month" => :scalar,
          "exp_year" => :scalar,
          "fingerprint" => :scalar,
          "funding" => :scalar,
          "iin" => :scalar,
          "issuer" => :scalar,
          "last4" => :scalar,
          "networks" => %{
            fields: %{
              "available" => {:list, :scalar},
              "preferred" => :scalar
            }
          },
          "preferred_locales" => {:list, :scalar},
          "read_method" => :scalar
        }
      },
      "klarna" => %{
        fields: %{
          "dob" => %{
            fields: %{
              "day" => :scalar,
              "month" => :scalar,
              "year" => :scalar
            }
          }
        }
      },
      "link" => %{
        fields: %{
          "email" => :scalar,
          "persistent_token" => :scalar
        }
      },
      "nz_bank_account" => %{
        fields: %{
          "account_holder_name" => :scalar,
          "bank_code" => :scalar,
          "bank_name" => :scalar,
          "branch_code" => :scalar,
          "last4" => :scalar,
          "suffix" => :scalar
        }
      },
      "p24" => %{
        fields: %{
          "bank" => :scalar
        }
      },
      "paypal" => %{
        fields: %{
          "country" => :scalar,
          "payer_email" => :scalar,
          "payer_id" => :scalar
        }
      },
      "payto" => %{
        fields: %{
          "bsb_number" => :scalar,
          "last4" => :scalar,
          "pay_id" => :scalar
        }
      },
      "radar_options" => %{
        fields: %{
          "session" => :scalar
        }
      },
      "sepa_debit" => %{
        fields: %{
          "bank_code" => :scalar,
          "branch_code" => :scalar,
          "country" => :scalar,
          "fingerprint" => :scalar,
          "generated_from" => %{
            fields: %{
              "charge" => {:resource, Stripe.Resources.Charge},
              "setup_attempt" => {:resource, Stripe.Resources.SetupAttempt}
            }
          },
          "last4" => :scalar
        }
      },
      "sofort" => %{
        fields: %{
          "country" => :scalar
        }
      },
      "upi" => %{
        fields: %{
          "vpa" => :scalar
        }
      },
      "us_bank_account" => %{
        fields: %{
          "account_holder_type" => :scalar,
          "account_type" => :scalar,
          "bank_name" => :scalar,
          "financial_connections_account" => :scalar,
          "fingerprint" => :scalar,
          "last4" => :scalar,
          "networks" => %{
            fields: %{
              "preferred" => :scalar,
              "supported" => {:list, :scalar}
            }
          },
          "routing_number" => :scalar,
          "status_details" => %{
            fields: %{
              "blocked" => %{
                fields: %{
                  "network_code" => :scalar,
                  "reason" => :scalar
                }
              }
            }
          }
        }
      },
      "crypto" => {:resource, Stripe.Resources.Crypto},
      "custom" => {:resource, Stripe.Resources.Custom},
      "kakao_pay" => {:resource, Stripe.Resources.KakaoPay},
      "kr_card" => {:resource, Stripe.Resources.KrCard},
      "mb_way" => {:resource, Stripe.Resources.MbWay},
      "naver_pay" => {:resource, Stripe.Resources.NaverPay},
      "payco" => {:resource, Stripe.Resources.Payco},
      "samsung_pay" => {:resource, Stripe.Resources.SamsungPay}
    }
  end
end
