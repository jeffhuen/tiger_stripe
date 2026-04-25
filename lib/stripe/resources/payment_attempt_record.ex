# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentAttemptRecord do
  @moduledoc """
  PaymentAttemptRecord

  A Payment Attempt Record represents an individual attempt at making a payment, on or off Stripe.
  Each payment attempt tries to collect a fixed amount of money from a fixed customer and payment
  method. Payment Attempt Records are attached to Payment Records. Only one attempt per Payment Record
  can have guaranteed funds.
  """

  @typedoc """
  * `amount` - Expandable.
  * `amount_authorized` - Expandable.
  * `amount_canceled` - Expandable.
  * `amount_failed` - Expandable.
  * `amount_guaranteed` - Expandable.
  * `amount_refunded` - Expandable.
  * `amount_requested` - Expandable.
  * `application` - ID of the Connect application that created the PaymentAttemptRecord. Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer_details` - Customer information for this payment. Nullable. Expandable.
  * `customer_presence` - Indicates whether the customer was present in your checkout flow during this payment. Possible values: `off_session`, `on_session`. Nullable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_attempt_record`.
  * `payment_method_details` - Information about the Payment Method debited for this payment. Nullable. Expandable.
  * `payment_record` - ID of the Payment Record this Payment Attempt Record belongs to. Max length: 5000. Nullable.
  * `processor_details` - Expandable.
  * `reported_by` - Indicates who reported the payment. Possible values: `self`, `stripe`.
  * `shipping_details` - Shipping information for this payment. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          amount: amount(),
          amount_authorized: amount_authorized(),
          amount_canceled: amount_canceled(),
          amount_failed: amount_failed(),
          amount_guaranteed: amount_guaranteed(),
          amount_refunded: amount_refunded(),
          amount_requested: amount_requested(),
          application: String.t(),
          created: integer(),
          customer_details: customer_details(),
          customer_presence: String.t(),
          description: String.t(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          payment_method_details: payment_method_details(),
          payment_record: String.t(),
          processor_details: processor_details(),
          reported_by: String.t(),
          shipping_details: shipping_details()
        }

  defstruct [
    :amount,
    :amount_authorized,
    :amount_canceled,
    :amount_failed,
    :amount_guaranteed,
    :amount_refunded,
    :amount_requested,
    :application,
    :created,
    :customer_details,
    :customer_presence,
    :description,
    :id,
    :livemode,
    :metadata,
    :object,
    :payment_method_details,
    :payment_record,
    :processor_details,
    :reported_by,
    :shipping_details
  ]

  @object_name "payment_attempt_record"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "amount",
      "amount_authorized",
      "amount_canceled",
      "amount_failed",
      "amount_guaranteed",
      "amount_refunded",
      "amount_requested",
      "customer_details",
      "payment_method_details",
      "processor_details",
      "shipping_details"
    ]

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
  """
  @type amount :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
  """
  @type amount_authorized :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
  """
  @type amount_canceled :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
  """
  @type amount_failed :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
  """
  @type amount_guaranteed :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
  """
  @type amount_refunded :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `value` - A positive integer representing the amount in the currency's [minor unit](https://docs.stripe.com/currencies#zero-decimal). For example, `100` can represent 1 USD or 100 JPY.
  """
  @type amount_requested :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer` - ID of the Stripe Customer associated with this payment. Max length: 5000. Nullable.
  * `email` - The customer's email address. Max length: 5000. Nullable.
  * `name` - The customer's name. Max length: 5000. Nullable.
  * `phone` - The customer's phone number. Max length: 5000. Nullable.
  """
  @type customer_details :: %{
          optional(:customer) => String.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach_credit_transfer`
  * `ach_debit`
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
  * `billing_details` - The billing details associated with the method of payment. Nullable.
  * `blik`
  * `boleto`
  * `card`
  * `card_present`
  * `cashapp`
  * `crypto`
  * `custom`
  * `customer_balance`
  * `eps`
  * `fpx`
  * `giropay`
  * `grabpay`
  * `ideal`
  * `interac_present`
  * `kakao_pay`
  * `klarna`
  * `konbini`
  * `kr_card`
  * `link`
  * `mb_way`
  * `mobilepay`
  * `multibanco`
  * `naver_pay`
  * `nz_bank_account`
  * `oxxo`
  * `p24`
  * `pay_by_bank`
  * `payco`
  * `payment_method` - ID of the Stripe PaymentMethod used to make this payment. Max length: 5000. Nullable.
  * `paynow`
  * `paypal`
  * `payto`
  * `pix`
  * `promptpay`
  * `revolut_pay`
  * `samsung_pay`
  * `satispay`
  * `sepa_credit_transfer`
  * `sepa_debit`
  * `sofort`
  * `stripe_account`
  * `swish`
  * `twint`
  * `type` - The type of transaction-specific details of the payment method used in the payment. See [PaymentMethod.type](https://docs.stripe.com/api/payment_methods/object#payment_method_object-type) for the full list of possible types.
  An additional hash is included on `payment_method_details` with a name matching this value.
  It contains information specific to the payment method. Max length: 5000.
  * `us_bank_account`
  * `wechat`
  * `wechat_pay`
  * `zip`
  """
  @type payment_method_details :: %{
          optional(:ach_credit_transfer) => payment_method_details_ach_credit_transfer() | nil,
          optional(:ach_debit) => payment_method_details_ach_debit() | nil,
          optional(:acss_debit) => payment_method_details_acss_debit() | nil,
          optional(:affirm) => payment_method_details_affirm() | nil,
          optional(:afterpay_clearpay) => payment_method_details_afterpay_clearpay() | nil,
          optional(:alipay) => payment_method_details_alipay() | nil,
          optional(:alma) => payment_method_details_alma() | nil,
          optional(:amazon_pay) => payment_method_details_amazon_pay() | nil,
          optional(:au_becs_debit) => payment_method_details_au_becs_debit() | nil,
          optional(:bacs_debit) => payment_method_details_bacs_debit() | nil,
          optional(:bancontact) => payment_method_details_bancontact() | nil,
          optional(:billie) => payment_method_details_billie() | nil,
          optional(:billing_details) => payment_method_details_billing_details() | nil,
          optional(:blik) => payment_method_details_blik() | nil,
          optional(:boleto) => payment_method_details_boleto() | nil,
          optional(:card) => payment_method_details_card() | nil,
          optional(:card_present) => payment_method_details_card_present() | nil,
          optional(:cashapp) => payment_method_details_cashapp() | nil,
          optional(:crypto) => Stripe.Resources.Crypto.t() | nil,
          optional(:custom) => payment_method_details_custom() | nil,
          optional(:customer_balance) => map() | nil,
          optional(:eps) => payment_method_details_eps() | nil,
          optional(:fpx) => payment_method_details_fpx() | nil,
          optional(:giropay) => payment_method_details_giropay() | nil,
          optional(:grabpay) => payment_method_details_grabpay() | nil,
          optional(:ideal) => payment_method_details_ideal() | nil,
          optional(:interac_present) => payment_method_details_interac_present() | nil,
          optional(:kakao_pay) => Stripe.Resources.KakaoPay.t() | nil,
          optional(:klarna) => payment_method_details_klarna() | nil,
          optional(:konbini) => payment_method_details_konbini() | nil,
          optional(:kr_card) => Stripe.Resources.KrCard.t() | nil,
          optional(:link) => payment_method_details_link() | nil,
          optional(:mb_way) => Stripe.Resources.MbWay.t() | nil,
          optional(:mobilepay) => payment_method_details_mobilepay() | nil,
          optional(:multibanco) => payment_method_details_multibanco() | nil,
          optional(:naver_pay) => Stripe.Resources.NaverPay.t() | nil,
          optional(:nz_bank_account) => payment_method_details_nz_bank_account() | nil,
          optional(:oxxo) => payment_method_details_oxxo() | nil,
          optional(:p24) => payment_method_details_p24() | nil,
          optional(:pay_by_bank) => map() | nil,
          optional(:payco) => Stripe.Resources.Payco.t() | nil,
          optional(:payment_method) => String.t() | nil,
          optional(:paynow) => payment_method_details_paynow() | nil,
          optional(:paypal) => payment_method_details_paypal() | nil,
          optional(:payto) => payment_method_details_payto() | nil,
          optional(:pix) => payment_method_details_pix() | nil,
          optional(:promptpay) => payment_method_details_promptpay() | nil,
          optional(:revolut_pay) => payment_method_details_revolut_pay() | nil,
          optional(:samsung_pay) => Stripe.Resources.SamsungPay.t() | nil,
          optional(:satispay) => payment_method_details_satispay() | nil,
          optional(:sepa_credit_transfer) => payment_method_details_sepa_credit_transfer() | nil,
          optional(:sepa_debit) => payment_method_details_sepa_debit() | nil,
          optional(:sofort) => payment_method_details_sofort() | nil,
          optional(:stripe_account) => map() | nil,
          optional(:swish) => payment_method_details_swish() | nil,
          optional(:twint) => map() | nil,
          optional(:type) => String.t() | nil,
          optional(:us_bank_account) => payment_method_details_us_bank_account() | nil,
          optional(:wechat) => map() | nil,
          optional(:wechat_pay) => payment_method_details_wechat_pay() | nil,
          optional(:zip) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_number` - Account number to transfer funds to. Max length: 5000. Nullable.
  * `bank_name` - Name of the bank associated with the routing number. Max length: 5000. Nullable.
  * `routing_number` - Routing transit number for the bank account to transfer funds to. Max length: 5000. Nullable.
  * `swift_code` - SWIFT code of the bank associated with the routing number. Max length: 5000. Nullable.
  """
  @type payment_method_details_ach_credit_transfer :: %{
          optional(:account_number) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:routing_number) => String.t() | nil,
          optional(:swift_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_type` - Type of entity that holds the account. This can be either `individual` or `company`. Possible values: `company`, `individual`. Nullable.
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `routing_number` - Routing transit number of the bank account. Max length: 5000. Nullable.
  """
  @type payment_method_details_ach_debit :: %{
          optional(:account_holder_type) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:routing_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `institution_number` - Institution number of the bank account Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `mandate` - ID of the mandate used to make this payment. Max length: 5000.
  * `transit_number` - Transit number of the bank account. Max length: 5000. Nullable.
  """
  @type payment_method_details_acss_debit :: %{
          optional(:bank_name) => String.t() | nil,
          optional(:expected_debit_date) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:institution_number) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:mandate) => String.t() | nil,
          optional(:transit_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `location` - ID of the [location](https://docs.stripe.com/api/terminal/locations) that this transaction's reader is assigned to. Max length: 5000.
  * `reader` - ID of the [reader](https://docs.stripe.com/api/terminal/readers) this transaction was made on. Max length: 5000.
  * `transaction_id` - The Affirm transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_affirm :: %{
          optional(:location) => String.t() | nil,
          optional(:reader) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `order_id` - The Afterpay order ID associated with this payment intent. Max length: 5000. Nullable.
  * `reference` - Order identifier shown to the merchant in Afterpay’s online portal. Max length: 5000. Nullable.
  """
  @type payment_method_details_afterpay_clearpay :: %{
          optional(:order_id) => String.t() | nil,
          optional(:reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `buyer_id` - Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same. Max length: 5000.
  * `fingerprint` - Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same. Max length: 5000. Nullable.
  * `transaction_id` - Transaction ID of this particular Alipay transaction. Max length: 5000. Nullable.
  """
  @type payment_method_details_alipay :: %{
          optional(:buyer_id) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `installments`
  * `transaction_id` - The Alma transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_alma :: %{
          optional(:installments) => payment_method_details_alma_installments() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `count` - The number of installments.
  """
  @type payment_method_details_alma_installments :: %{
          optional(:count) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `funding`
  * `transaction_id` - The Amazon Pay transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_amazon_pay :: %{
          optional(:funding) => payment_method_details_amazon_pay_funding() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card`
  * `type` - funding type of the underlying payment method. Possible values: `card`. Nullable.
  """
  @type payment_method_details_amazon_pay_funding :: %{
          optional(:card) => payment_method_details_amazon_pay_funding_card() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
  * `exp_month` - Two-digit number representing the card's expiration month. Nullable.
  * `exp_year` - Four-digit number representing the card's expiration year. Nullable.
  * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
  * `last4` - The last four digits of the card. Max length: 5000. Nullable.
  """
  @type payment_method_details_amazon_pay_funding_card :: %{
          optional(:brand) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:funding) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000. Nullable.
  * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `mandate` - ID of the mandate used to make this payment. Max length: 5000.
  """
  @type payment_method_details_au_becs_debit :: %{
          optional(:bsb_number) => String.t() | nil,
          optional(:expected_debit_date) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:mandate) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `mandate` - ID of the mandate used to make this payment. Max length: 5000. Nullable.
  * `sort_code` - Sort code of the bank account. (e.g., `10-20-30`) Max length: 5000. Nullable.
  """
  @type payment_method_details_bacs_debit :: %{
          optional(:expected_debit_date) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:mandate) => String.t() | nil,
          optional(:sort_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `bic` - Bank Identifier Code of the bank associated with the bank account. Max length: 5000. Nullable.
  * `generated_sepa_debit` - The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge. Nullable.
  * `generated_sepa_debit_mandate` - The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge. Nullable.
  * `iban_last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
  * `preferred_language` - Preferred language of the Bancontact authorization page that the customer is redirected to.
  Can be one of `en`, `de`, `fr`, or `nl` Possible values: `de`, `en`, `fr`, `nl`. Nullable.
  * `verified_name` - Owner's verified full name. Values are verified or provided by Bancontact directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  """
  @type payment_method_details_bancontact :: %{
          optional(:bank_code) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:bic) => String.t() | nil,
          optional(:generated_sepa_debit) =>
            String.t() | Stripe.Resources.PaymentMethod.t() | nil,
          optional(:generated_sepa_debit_mandate) =>
            String.t() | Stripe.Resources.Mandate.t() | nil,
          optional(:iban_last4) => String.t() | nil,
          optional(:preferred_language) => String.t() | nil,
          optional(:verified_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `transaction_id` - The Billie transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_billie :: %{
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address`
  * `email` - The billing email associated with the method of payment. Max length: 5000. Nullable.
  * `name` - The billing name associated with the method of payment. Max length: 5000. Nullable.
  * `phone` - The billing phone number associated with the method of payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_billing_details :: %{
          optional(:address) => payment_method_details_billing_details_address() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
  """
  @type payment_method_details_billing_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `buyer_id` - A unique and immutable identifier assigned by BLIK to every buyer. Max length: 5000. Nullable.
  """
  @type payment_method_details_blik :: %{
          optional(:buyer_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tax_id` - The tax ID of the customer (CPF for individuals consumers or CNPJ for businesses consumers) Max length: 5000.
  """
  @type payment_method_details_boleto :: %{
          optional(:tax_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `authorization_code` - The authorization code of the payment. Max length: 5000. Nullable.
  * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Possible values: `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `unknown`, `visa`.
  * `capture_before` - When using manual capture, a future timestamp at which the charge will be automatically refunded if uncaptured. Format: Unix timestamp.
  * `checks` - Check results by Card networks on Card address and CVC at time of payment. Nullable.
  * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
  * `description` - A high-level description of the type of cards issued in this range. Max length: 5000. Nullable.
  * `exp_month` - Two-digit number representing the card's expiration month.
  * `exp_year` - Four-digit number representing the card's expiration year.
  * `fingerprint` - Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

  *As of May 1, 2021, card fingerprint in India for Connect changed to allow two fingerprints for the same card---one for India and one for the rest of the world.* Max length: 5000. Nullable.
  * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Possible values: `credit`, `debit`, `prepaid`, `unknown`.
  * `iin` - Issuer identification number of the card. Max length: 5000. Nullable.
  * `installments` - Installment details for this payment. Nullable.
  * `issuer` - The name of the card's issuing bank. Max length: 5000. Nullable.
  * `last4` - The last four digits of the card. Max length: 5000.
  * `moto` - True if this payment was marked as MOTO and out of scope for SCA.
  * `network` - Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`. Possible values: `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `unknown`, `visa`. Nullable.
  * `network_advice_code` - Advice code from the card network for the failed payment. Max length: 5000. Nullable.
  * `network_decline_code` - Decline code from the card network for the failed payment. Max length: 5000. Nullable.
  * `network_token` - If this card has network token credentials, this contains the details of the network token credentials. Nullable.
  * `network_transaction_id` - This is used by the financial networks to identify a transaction. Visa calls this the Transaction ID, Mastercard calls this the Trace ID, and American Express calls this the Acquirer Reference Data. This value will be present if it is returned by the financial network in the authorization response, and null otherwise. Max length: 5000. Nullable.
  * `stored_credential_usage` - The transaction type that was passed for an off-session, Merchant-Initiated transaction, one of `recurring` or `unscheduled`. Possible values: `recurring`, `unscheduled`. Nullable.
  * `three_d_secure` - Populated if this transaction used 3D Secure authentication. Nullable.
  * `wallet` - If this Card is part of a card wallet, this contains the details of the card wallet. Nullable.
  """
  @type payment_method_details_card :: %{
          optional(:authorization_code) => String.t() | nil,
          optional(:brand) => String.t() | nil,
          optional(:capture_before) => integer() | nil,
          optional(:checks) => payment_method_details_card_checks() | nil,
          optional(:country) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:funding) => String.t() | nil,
          optional(:iin) => String.t() | nil,
          optional(:installments) => payment_method_details_card_installments() | nil,
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:moto) => boolean() | nil,
          optional(:network) => String.t() | nil,
          optional(:network_advice_code) => String.t() | nil,
          optional(:network_decline_code) => String.t() | nil,
          optional(:network_token) => payment_method_details_card_network_token() | nil,
          optional(:network_transaction_id) => String.t() | nil,
          optional(:stored_credential_usage) => String.t() | nil,
          optional(:three_d_secure) => payment_method_details_card_three_d_secure() | nil,
          optional(:wallet) => payment_method_details_card_wallet() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address_line1_check` - Possible values: `fail`, `pass`, `unavailable`, `unchecked`. Nullable.
  * `address_postal_code_check` - Possible values: `fail`, `pass`, `unavailable`, `unchecked`. Nullable.
  * `cvc_check` - Possible values: `fail`, `pass`, `unavailable`, `unchecked`. Nullable.
  """
  @type payment_method_details_card_checks :: %{
          optional(:address_line1_check) => String.t() | nil,
          optional(:address_postal_code_check) => String.t() | nil,
          optional(:cvc_check) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `plan` - Nullable.
  """
  @type payment_method_details_card_installments :: %{
          optional(:plan) => payment_method_details_card_installments_plan() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `count` - For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card. Nullable.
  * `interval` - For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card. One of `month`. Possible values: `month`. Nullable.
  * `type` - Type of installment plan, one of `fixed_count`, `revolving`, or `bonus`. Possible values: `bonus`, `fixed_count`, `revolving`.
  """
  @type payment_method_details_card_installments_plan :: %{
          optional(:count) => integer() | nil,
          optional(:interval) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `used` - Indicates if Stripe used a network token, either user provided or Stripe managed when processing the transaction.
  """
  @type payment_method_details_card_network_token :: %{
          optional(:used) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `authentication_flow` - Possible values: `challenge`, `frictionless`. Nullable.
  * `result` - Possible values: `attempt_acknowledged`, `authenticated`, `exempted`, `failed`, `not_supported`, `processing_error`. Nullable.
  * `result_reason` - Possible values: `abandoned`, `bypassed`, `canceled`, `card_not_enrolled`, `network_not_supported`, `protocol_error`, `rejected`. Nullable.
  * `version` - Possible values: `1.0.2`, `2.1.0`, `2.2.0`. Nullable.
  """
  @type payment_method_details_card_three_d_secure :: %{
          optional(:authentication_flow) => String.t() | nil,
          optional(:result) => String.t() | nil,
          optional(:result_reason) => String.t() | nil,
          optional(:version) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `apple_pay`
  * `dynamic_last4` - (For tokenized numbers only.) The last four digits of the device account number. Max length: 5000.
  * `google_pay`
  * `type` - The type of the card wallet, one of `apple_pay` or `google_pay`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type. Max length: 5000.
  """
  @type payment_method_details_card_wallet :: %{
          optional(:apple_pay) => payment_method_details_card_wallet_apple_pay() | nil,
          optional(:dynamic_last4) => String.t() | nil,
          optional(:google_pay) => map() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Type of the apple_pay transaction, one of `apple_pay` or `apple_pay_later`. Max length: 5000.
  """
  @type payment_method_details_card_wallet_apple_pay :: %{
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
  * `network` - Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`. Max length: 5000. Nullable.
  * `network_transaction_id` - This is used by the financial networks to identify a transaction. Visa calls this the Transaction ID, Mastercard calls this the Trace ID, and American Express calls this the Acquirer Reference Data. This value will be present if it is returned by the financial network in the authorization response, and null otherwise. Max length: 5000. Nullable.
  * `offline` - Details about payments collected offline. Nullable.
  * `overcapture_supported` - Defines whether the authorized amount can be over-captured or not
  * `preferred_locales` - The languages that the issuing bank recommends using for localizing any customer-facing text, as read from the card. Referenced from EMV tag 5F2D, data encoded on the card's chip. Nullable.
  * `read_method` - How card details were read in this transaction. Possible values: `contact_emv`, `contactless_emv`, `contactless_magstripe_mode`, `magnetic_stripe_fallback`, `magnetic_stripe_track2`. Nullable.
  * `receipt` - A collection of fields required to be displayed on receipts. Only required for EMV transactions. Nullable.
  * `wallet`
  """
  @type payment_method_details_card_present :: %{
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
          optional(:network) => String.t() | nil,
          optional(:network_transaction_id) => String.t() | nil,
          optional(:offline) => Stripe.Resources.Offline.t() | nil,
          optional(:overcapture_supported) => boolean() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(:receipt) => payment_method_details_card_present_receipt() | nil,
          optional(:wallet) => payment_method_details_card_present_wallet() | nil,
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
  @type payment_method_details_card_present_receipt :: %{
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
  @type payment_method_details_card_present_wallet :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `buyer_id` - A unique and immutable identifier assigned by Cash App to every buyer. Max length: 5000. Nullable.
  * `cashtag` - A public identifier for buyers using Cash App. Max length: 5000. Nullable.
  * `transaction_id` - A unique and immutable identifier of payments assigned by Cash App Max length: 5000. Nullable.
  """
  @type payment_method_details_cashapp :: %{
          optional(:buyer_id) => String.t() | nil,
          optional(:cashtag) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `display_name` - Display name for the custom (user-defined) payment method type used to make this payment. Max length: 5000.
  * `type` - The custom payment method type associated with this payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_custom :: %{
          optional(:display_name) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`. Possible values: `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, `vr_bank_braunau`. Nullable.
  * `verified_name` - Owner's verified full name. Values are verified or provided by EPS directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated.
  EPS rarely provides this information so the attribute is usually empty. Max length: 5000. Nullable.
  """
  @type payment_method_details_eps :: %{
          optional(:bank) => String.t() | nil,
          optional(:verified_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_type` - Account holder type, if provided. Can be one of `individual` or `company`. Possible values: `company`, `individual`. Nullable.
  * `bank` - The customer's bank. Can be one of `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, `pb_enterprise`, or `bank_of_china`. Possible values: `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_of_china`, `bank_rakyat`, `bsn`, `cimb`, `deutsche_bank`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2e`, `maybank2u`, `ocbc`, `pb_enterprise`, `public_bank`, `rhb`, `standard_chartered`, `uob`.
  * `transaction_id` - Unique transaction id generated by FPX for every request from the merchant Max length: 5000. Nullable.
  """
  @type payment_method_details_fpx :: %{
          optional(:account_holder_type) => String.t() | nil,
          optional(:bank) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `bic` - Bank Identifier Code of the bank associated with the bank account. Max length: 5000. Nullable.
  * `verified_name` - Owner's verified full name. Values are verified or provided by Giropay directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated.
  Giropay rarely provides this information so the attribute is usually empty. Max length: 5000. Nullable.
  """
  @type payment_method_details_giropay :: %{
          optional(:bank_code) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:bic) => String.t() | nil,
          optional(:verified_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `transaction_id` - Unique transaction id generated by GrabPay Max length: 5000. Nullable.
  """
  @type payment_method_details_grabpay :: %{
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank. Can be one of `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, or `yoursafe`. Possible values: `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, `yoursafe`. Nullable.
  * `bic` - The Bank Identifier Code of the customer's bank. Possible values: `ABNANL2A`, `ADYBNL2A`, `ASNBNL21`, `BITSNL2A`, `BUNQNL2A`, `BUUTNL2A`, `FNOMNL22`, `FVLBNL22`, `HANDNL2A`, `INGBNL2A`, `KNABNL2H`, `MLLENL2A`, `MOYONL21`, `NNBANL2G`, `NTSBDEB1`, `RABONL2U`, `RBRBNL21`, `REVOIE23`, `REVOLT21`, `SNSBNL2A`, `TRIONL2U`. Nullable.
  * `generated_sepa_debit` - The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge. Nullable.
  * `generated_sepa_debit_mandate` - The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge. Nullable.
  * `iban_last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
  * `transaction_id` - Unique transaction ID generated by iDEAL. Max length: 5000. Nullable.
  * `verified_name` - Owner's verified full name. Values are verified or provided by iDEAL directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  """
  @type payment_method_details_ideal :: %{
          optional(:bank) => String.t() | nil,
          optional(:bic) => String.t() | nil,
          optional(:generated_sepa_debit) =>
            String.t() | Stripe.Resources.PaymentMethod.t() | nil,
          optional(:generated_sepa_debit_mandate) =>
            String.t() | Stripe.Resources.Mandate.t() | nil,
          optional(:iban_last4) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(:verified_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `brand` - Card brand. Can be `interac`, `mastercard` or `visa`. Max length: 5000. Nullable.
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
  * `issuer` - The name of the card's issuing bank. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
  * `last4` - The last four digits of the card. Max length: 5000. Nullable.
  * `network` - Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`. Max length: 5000. Nullable.
  * `network_transaction_id` - This is used by the financial networks to identify a transaction. Visa calls this the Transaction ID, Mastercard calls this the Trace ID, and American Express calls this the Acquirer Reference Data. This value will be present if it is returned by the financial network in the authorization response, and null otherwise. Max length: 5000. Nullable.
  * `preferred_locales` - The languages that the issuing bank recommends using for localizing any customer-facing text, as read from the card. Referenced from EMV tag 5F2D, data encoded on the card's chip. Nullable.
  * `read_method` - How card details were read in this transaction. Possible values: `contact_emv`, `contactless_emv`, `contactless_magstripe_mode`, `magnetic_stripe_fallback`, `magnetic_stripe_track2`. Nullable.
  * `receipt` - A collection of fields required to be displayed on receipts. Only required for EMV transactions. Nullable.
  """
  @type payment_method_details_interac_present :: %{
          optional(:brand) => String.t() | nil,
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
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:network) => String.t() | nil,
          optional(:network_transaction_id) => String.t() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(:receipt) => Stripe.Resources.Receipt.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payer_details` - The payer details for this transaction. Nullable.
  * `payment_method_category` - The Klarna payment method used for this transaction.
  Can be one of `pay_later`, `pay_now`, `pay_with_financing`, or `pay_in_installments` Max length: 5000. Nullable.
  * `preferred_locale` - Preferred language of the Klarna authorization page that the customer is redirected to.
  Can be one of `de-AT`, `en-AT`, `nl-BE`, `fr-BE`, `en-BE`, `de-DE`, `en-DE`, `da-DK`, `en-DK`, `es-ES`, `en-ES`, `fi-FI`, `sv-FI`, `en-FI`, `en-GB`, `en-IE`, `it-IT`, `en-IT`, `nl-NL`, `en-NL`, `nb-NO`, `en-NO`, `sv-SE`, `en-SE`, `en-US`, `es-US`, `fr-FR`, `en-FR`, `cs-CZ`, `en-CZ`, `ro-RO`, `en-RO`, `el-GR`, `en-GR`, `en-AU`, `en-NZ`, `en-CA`, `fr-CA`, `pl-PL`, `en-PL`, `pt-PT`, `en-PT`, `de-CH`, `fr-CH`, `it-CH`, or `en-CH` Max length: 5000. Nullable.
  """
  @type payment_method_details_klarna :: %{
          optional(:payer_details) => payment_method_details_klarna_payer_details() | nil,
          optional(:payment_method_category) => String.t() | nil,
          optional(:preferred_locale) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The payer's address Nullable.
  """
  @type payment_method_details_klarna_payer_details :: %{
          optional(:address) => payment_method_details_klarna_payer_details_address() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - The payer address country Max length: 5000. Nullable.
  """
  @type payment_method_details_klarna_payer_details_address :: %{
          optional(:country) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `store` - If the payment succeeded, this contains the details of the convenience store where the payment was completed. Nullable.
  """
  @type payment_method_details_konbini :: %{
          optional(:store) => payment_method_details_konbini_store() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `chain` - The name of the convenience store chain where the payment was completed. Possible values: `familymart`, `lawson`, `ministop`, `seicomart`. Nullable.
  """
  @type payment_method_details_konbini_store :: %{
          optional(:chain) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter ISO code representing the funding source country beneath the Link payment.
  You could use this attribute to get a sense of international fees. Max length: 5000. Nullable.
  """
  @type payment_method_details_link :: %{
          optional(:country) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card` - Internal card details Nullable.
  """
  @type payment_method_details_mobilepay :: %{
          optional(:card) => payment_method_details_mobilepay_card() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `brand` - Brand of the card used in the transaction Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country of the card Max length: 5000. Nullable.
  * `exp_month` - Two digit number representing the card's expiration month Nullable.
  * `exp_year` - Two digit number representing the card's expiration year Nullable.
  * `last4` - The last 4 digits of the card Max length: 5000. Nullable.
  """
  @type payment_method_details_mobilepay_card :: %{
          optional(:brand) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:last4) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `entity` - Entity number associated with this Multibanco payment. Max length: 5000. Nullable.
  * `reference` - Reference number associated with this Multibanco payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_multibanco :: %{
          optional(:entity) => String.t() | nil,
          optional(:reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_name` - The name on the bank account. Only present if the account holder name is different from the name of the authorized signatory collected in the PaymentMethod’s billing details. Max length: 5000. Nullable.
  * `bank_code` - The numeric code for the bank account's bank. Max length: 5000.
  * `bank_name` - The name of the bank. Max length: 5000.
  * `branch_code` - The numeric code for the bank account's bank branch. Max length: 5000.
  * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
  * `last4` - Last four digits of the bank account number. Max length: 5000.
  * `suffix` - The suffix of the bank account number. Max length: 5000. Nullable.
  """
  @type payment_method_details_nz_bank_account :: %{
          optional(:account_holder_name) => String.t() | nil,
          optional(:bank_code) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:branch_code) => String.t() | nil,
          optional(:expected_debit_date) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:suffix) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `number` - OXXO reference number Max length: 5000. Nullable.
  """
  @type payment_method_details_oxxo :: %{
          optional(:number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank. Can be one of `ing`, `citi_handlowy`, `tmobile_usbugi_bankowe`, `plus_bank`, `etransfer_pocztowy24`, `banki_spbdzielcze`, `bank_nowy_bfg_sa`, `getin_bank`, `velobank`, `blik`, `noble_pay`, `ideabank`, `envelobank`, `santander_przelew24`, `nest_przelew`, `mbank_mtransfer`, `inteligo`, `pbac_z_ipko`, `bnp_paribas`, `credit_agricole`, `toyota_bank`, `bank_pekao_sa`, `volkswagen_bank`, `bank_millennium`, `alior_bank`, or `boz`. Possible values: `alior_bank`, `bank_millennium`, `bank_nowy_bfg_sa`, `bank_pekao_sa`, `banki_spbdzielcze`, `blik`, `bnp_paribas`, `boz`, `citi_handlowy`, `credit_agricole`, `envelobank`, `etransfer_pocztowy24`, `getin_bank`, `ideabank`, `ing`, `inteligo`, `mbank_mtransfer`, `nest_przelew`, `noble_pay`, `pbac_z_ipko`, `plus_bank`, `santander_przelew24`, `tmobile_usbugi_bankowe`, `toyota_bank`, `velobank`, `volkswagen_bank`. Nullable.
  * `reference` - Unique reference for this Przelewy24 payment. Max length: 5000. Nullable.
  * `verified_name` - Owner's verified full name. Values are verified or provided by Przelewy24 directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated.
  Przelewy24 rarely provides this information so the attribute is usually empty. Max length: 5000. Nullable.
  """
  @type payment_method_details_p24 :: %{
          optional(:bank) => String.t() | nil,
          optional(:reference) => String.t() | nil,
          optional(:verified_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `location` - ID of the [location](https://docs.stripe.com/api/terminal/locations) that this transaction's reader is assigned to. Max length: 5000.
  * `reader` - ID of the [reader](https://docs.stripe.com/api/terminal/readers) this transaction was made on. Max length: 5000.
  * `reference` - Reference number associated with this PayNow payment Max length: 5000. Nullable.
  """
  @type payment_method_details_paynow :: %{
          optional(:location) => String.t() | nil,
          optional(:reader) => String.t() | nil,
          optional(:reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter ISO code representing the buyer's country. Values are provided by PayPal directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `payer_email` - Owner's email. Values are provided by PayPal directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `payer_id` - PayPal account PayerID. This identifier uniquely identifies the PayPal customer. Max length: 5000. Nullable.
  * `payer_name` - Owner's full name. Values provided by PayPal directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `seller_protection` - The level of protection offered as defined by PayPal Seller Protection for Merchants, for this transaction. Nullable.
  * `transaction_id` - A unique ID generated by PayPal for this transaction. Max length: 5000. Nullable.
  """
  @type payment_method_details_paypal :: %{
          optional(:country) => String.t() | nil,
          optional(:payer_email) => String.t() | nil,
          optional(:payer_id) => String.t() | nil,
          optional(:payer_name) => String.t() | nil,
          optional(:seller_protection) => payment_method_details_paypal_seller_protection() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dispute_categories` - An array of conditions that are covered for the transaction, if applicable. Nullable.
  * `status` - Indicates whether the transaction is eligible for PayPal's seller protection. Possible values: `eligible`, `not_eligible`, `partially_eligible`.
  """
  @type payment_method_details_paypal_seller_protection :: %{
          optional(:dispute_categories) => [String.t()] | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `mandate` - ID of the mandate used to make this payment. Max length: 5000.
  * `pay_id` - The PayID alias for the bank account. Max length: 5000. Nullable.
  """
  @type payment_method_details_payto :: %{
          optional(:bsb_number) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:mandate) => String.t() | nil,
          optional(:pay_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_transaction_id` - Unique transaction id generated by BCB Max length: 5000. Nullable.
  """
  @type payment_method_details_pix :: %{
          optional(:bank_transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `reference` - Bill reference generated by PromptPay Max length: 5000. Nullable.
  """
  @type payment_method_details_promptpay :: %{
          optional(:reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `funding`
  * `transaction_id` - The Revolut Pay transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_revolut_pay :: %{
          optional(:funding) => payment_method_details_revolut_pay_funding() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card`
  * `type` - funding type of the underlying payment method. Possible values: `card`. Nullable.
  """
  @type payment_method_details_revolut_pay_funding :: %{
          optional(:card) => payment_method_details_revolut_pay_funding_card() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
  * `exp_month` - Two-digit number representing the card's expiration month. Nullable.
  * `exp_year` - Four-digit number representing the card's expiration year. Nullable.
  * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
  * `last4` - The last four digits of the card. Max length: 5000. Nullable.
  """
  @type payment_method_details_revolut_pay_funding_card :: %{
          optional(:brand) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:funding) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `transaction_id` - The Satispay transaction ID associated with this payment. Max length: 5000. Nullable.
  """
  @type payment_method_details_satispay :: %{
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `bic` - Bank Identifier Code of the bank associated with the bank account. Max length: 5000. Nullable.
  * `iban` - IBAN of the bank account to transfer funds to. Max length: 5000. Nullable.
  """
  @type payment_method_details_sepa_credit_transfer :: %{
          optional(:bank_name) => String.t() | nil,
          optional(:bic) => String.t() | nil,
          optional(:iban) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
  * `branch_code` - Branch code of bank associated with the bank account. Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
  * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
  * `mandate` - Find the ID of the mandate used for this payment under the [payment_method_details.sepa_debit.mandate](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-sepa_debit-mandate) property on the Charge. Use this mandate ID to [retrieve the Mandate](https://docs.stripe.com/api/mandates/retrieve). Max length: 5000. Nullable.
  """
  @type payment_method_details_sepa_debit :: %{
          optional(:bank_code) => String.t() | nil,
          optional(:branch_code) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:expected_debit_date) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:mandate) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `bic` - Bank Identifier Code of the bank associated with the bank account. Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
  * `generated_sepa_debit` - The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge. Nullable.
  * `generated_sepa_debit_mandate` - The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge. Nullable.
  * `iban_last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
  * `preferred_language` - Preferred language of the SOFORT authorization page that the customer is redirected to.
  Can be one of `de`, `en`, `es`, `fr`, `it`, `nl`, or `pl` Possible values: `de`, `en`, `es`, `fr`, `it`, `nl`, `pl`. Nullable.
  * `verified_name` - Owner's verified full name. Values are verified or provided by SOFORT directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  """
  @type payment_method_details_sofort :: %{
          optional(:bank_code) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:bic) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:generated_sepa_debit) =>
            String.t() | Stripe.Resources.PaymentMethod.t() | nil,
          optional(:generated_sepa_debit_mandate) =>
            String.t() | Stripe.Resources.Mandate.t() | nil,
          optional(:iban_last4) => String.t() | nil,
          optional(:preferred_language) => String.t() | nil,
          optional(:verified_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fingerprint` - Uniquely identifies the payer's Swish account. You can use this attribute to check whether two Swish transactions were paid for by the same payer Max length: 5000. Nullable.
  * `payment_reference` - Payer bank reference number for the payment Max length: 5000. Nullable.
  * `verified_phone_last4` - The last four digits of the Swish account phone number Max length: 5000. Nullable.
  """
  @type payment_method_details_swish :: %{
          optional(:fingerprint) => String.t() | nil,
          optional(:payment_reference) => String.t() | nil,
          optional(:verified_phone_last4) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_type` - The type of entity that holds the account. This can be either 'individual' or 'company'. Possible values: `company`, `individual`. Nullable.
  * `account_type` - The type of the bank account. This can be either 'checking' or 'savings'. Possible values: `checking`, `savings`. Nullable.
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000. Nullable.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `mandate` - ID of the mandate used to make this payment.
  * `payment_reference` - The ACH payment reference for this transaction. Max length: 5000. Nullable.
  * `routing_number` - The routing number for the bank account. Max length: 5000. Nullable.
  """
  @type payment_method_details_us_bank_account :: %{
          optional(:account_holder_type) => String.t() | nil,
          optional(:account_type) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:expected_debit_date) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:mandate) => String.t() | Stripe.Resources.Mandate.t() | nil,
          optional(:payment_reference) => String.t() | nil,
          optional(:routing_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fingerprint` - Uniquely identifies this particular WeChat Pay account. You can use this attribute to check whether two WeChat accounts are the same. Max length: 5000. Nullable.
  * `location` - ID of the [location](https://docs.stripe.com/api/terminal/locations) that this transaction's reader is assigned to. Max length: 5000.
  * `reader` - ID of the [reader](https://docs.stripe.com/api/terminal/readers) this transaction was made on. Max length: 5000.
  * `transaction_id` - Transaction ID of this particular WeChat Pay transaction. Max length: 5000. Nullable.
  """
  @type payment_method_details_wechat_pay :: %{
          optional(:fingerprint) => String.t() | nil,
          optional(:location) => String.t() | nil,
          optional(:reader) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom`
  * `type` - The processor used for this payment attempt. Possible values: `custom`.
  """
  @type processor_details :: %{
          optional(:custom) => processor_details_custom() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_reference` - An opaque string for manual reconciliation of this payment, for example a check number or a payment processor ID. Max length: 5000. Nullable.
  """
  @type processor_details_custom :: %{
          optional(:payment_reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address`
  * `name` - The shipping recipient's name. Max length: 5000. Nullable.
  * `phone` - The shipping recipient's phone number. Max length: 5000. Nullable.
  """
  @type shipping_details :: %{
          optional(:address) => shipping_details_address() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
  """
  @type shipping_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "amount" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_authorized" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_canceled" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_failed" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_guaranteed" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_refunded" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_requested" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "customer_details" => %{
        fields: %{
          "customer" => :scalar,
          "email" => :scalar,
          "name" => :scalar,
          "phone" => :scalar
        }
      },
      "payment_method_details" => %{
        fields: %{
          "ach_credit_transfer" => %{
            fields: %{
              "account_number" => :scalar,
              "bank_name" => :scalar,
              "routing_number" => :scalar,
              "swift_code" => :scalar
            }
          },
          "ach_debit" => %{
            fields: %{
              "account_holder_type" => :scalar,
              "bank_name" => :scalar,
              "country" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "routing_number" => :scalar
            }
          },
          "acss_debit" => %{
            fields: %{
              "bank_name" => :scalar,
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "institution_number" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar,
              "transit_number" => :scalar
            }
          },
          "affirm" => %{
            fields: %{
              "location" => :scalar,
              "reader" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "afterpay_clearpay" => %{
            fields: %{
              "order_id" => :scalar,
              "reference" => :scalar
            }
          },
          "alipay" => %{
            fields: %{
              "buyer_id" => :scalar,
              "fingerprint" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "alma" => %{
            fields: %{
              "installments" => %{
                fields: %{
                  "count" => :scalar
                }
              },
              "transaction_id" => :scalar
            }
          },
          "amazon_pay" => %{
            fields: %{
              "funding" => %{
                fields: %{
                  "card" => %{
                    fields: %{
                      "brand" => :scalar,
                      "country" => :scalar,
                      "exp_month" => :scalar,
                      "exp_year" => :scalar,
                      "funding" => :scalar,
                      "last4" => :scalar
                    }
                  },
                  "type" => :scalar
                }
              },
              "transaction_id" => :scalar
            }
          },
          "au_becs_debit" => %{
            fields: %{
              "bsb_number" => :scalar,
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar
            }
          },
          "bacs_debit" => %{
            fields: %{
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar,
              "sort_code" => :scalar
            }
          },
          "bancontact" => %{
            fields: %{
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "bic" => :scalar,
              "generated_sepa_debit" => {:resource, Stripe.Resources.PaymentMethod},
              "generated_sepa_debit_mandate" => {:resource, Stripe.Resources.Mandate},
              "iban_last4" => :scalar,
              "preferred_language" => :scalar,
              "verified_name" => :scalar
            }
          },
          "billie" => %{
            fields: %{
              "transaction_id" => :scalar
            }
          },
          "billing_details" => %{
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
              "email" => :scalar,
              "name" => :scalar,
              "phone" => :scalar
            }
          },
          "blik" => %{
            fields: %{
              "buyer_id" => :scalar
            }
          },
          "boleto" => %{
            fields: %{
              "tax_id" => :scalar
            }
          },
          "card" => %{
            fields: %{
              "authorization_code" => :scalar,
              "brand" => :scalar,
              "capture_before" => :scalar,
              "checks" => %{
                fields: %{
                  "address_line1_check" => :scalar,
                  "address_postal_code_check" => :scalar,
                  "cvc_check" => :scalar
                }
              },
              "country" => :scalar,
              "description" => :scalar,
              "exp_month" => :scalar,
              "exp_year" => :scalar,
              "fingerprint" => :scalar,
              "funding" => :scalar,
              "iin" => :scalar,
              "installments" => %{
                fields: %{
                  "plan" => %{
                    fields: %{
                      "count" => :scalar,
                      "interval" => :scalar,
                      "type" => :scalar
                    }
                  }
                }
              },
              "issuer" => :scalar,
              "last4" => :scalar,
              "moto" => :scalar,
              "network" => :scalar,
              "network_advice_code" => :scalar,
              "network_decline_code" => :scalar,
              "network_token" => %{
                fields: %{
                  "used" => :scalar
                }
              },
              "network_transaction_id" => :scalar,
              "stored_credential_usage" => :scalar,
              "three_d_secure" => %{
                fields: %{
                  "authentication_flow" => :scalar,
                  "result" => :scalar,
                  "result_reason" => :scalar,
                  "version" => :scalar
                }
              },
              "wallet" => %{
                fields: %{
                  "apple_pay" => %{
                    fields: %{
                      "type" => :scalar
                    }
                  },
                  "dynamic_last4" => :scalar,
                  "google_pay" => :scalar,
                  "type" => :scalar
                }
              }
            }
          },
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
              "network" => :scalar,
              "network_transaction_id" => :scalar,
              "offline" => {:resource, Stripe.Resources.Offline},
              "overcapture_supported" => :scalar,
              "preferred_locales" => {:list, :scalar},
              "read_method" => :scalar,
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
          "cashapp" => %{
            fields: %{
              "buyer_id" => :scalar,
              "cashtag" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "crypto" => {:resource, Stripe.Resources.Crypto},
          "custom" => %{
            fields: %{
              "display_name" => :scalar,
              "type" => :scalar
            }
          },
          "customer_balance" => :scalar,
          "eps" => %{
            fields: %{
              "bank" => :scalar,
              "verified_name" => :scalar
            }
          },
          "fpx" => %{
            fields: %{
              "account_holder_type" => :scalar,
              "bank" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "giropay" => %{
            fields: %{
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "bic" => :scalar,
              "verified_name" => :scalar
            }
          },
          "grabpay" => %{
            fields: %{
              "transaction_id" => :scalar
            }
          },
          "ideal" => %{
            fields: %{
              "bank" => :scalar,
              "bic" => :scalar,
              "generated_sepa_debit" => {:resource, Stripe.Resources.PaymentMethod},
              "generated_sepa_debit_mandate" => {:resource, Stripe.Resources.Mandate},
              "iban_last4" => :scalar,
              "transaction_id" => :scalar,
              "verified_name" => :scalar
            }
          },
          "interac_present" => %{
            fields: %{
              "brand" => :scalar,
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
              "issuer" => :scalar,
              "last4" => :scalar,
              "network" => :scalar,
              "network_transaction_id" => :scalar,
              "preferred_locales" => {:list, :scalar},
              "read_method" => :scalar,
              "receipt" => {:resource, Stripe.Resources.Receipt}
            }
          },
          "kakao_pay" => {:resource, Stripe.Resources.KakaoPay},
          "klarna" => %{
            fields: %{
              "payer_details" => %{
                fields: %{
                  "address" => %{
                    fields: %{
                      "country" => :scalar
                    }
                  }
                }
              },
              "payment_method_category" => :scalar,
              "preferred_locale" => :scalar
            }
          },
          "konbini" => %{
            fields: %{
              "store" => %{
                fields: %{
                  "chain" => :scalar
                }
              }
            }
          },
          "kr_card" => {:resource, Stripe.Resources.KrCard},
          "link" => %{
            fields: %{
              "country" => :scalar
            }
          },
          "mb_way" => {:resource, Stripe.Resources.MbWay},
          "mobilepay" => %{
            fields: %{
              "card" => %{
                fields: %{
                  "brand" => :scalar,
                  "country" => :scalar,
                  "exp_month" => :scalar,
                  "exp_year" => :scalar,
                  "last4" => :scalar
                }
              }
            }
          },
          "multibanco" => %{
            fields: %{
              "entity" => :scalar,
              "reference" => :scalar
            }
          },
          "naver_pay" => {:resource, Stripe.Resources.NaverPay},
          "nz_bank_account" => %{
            fields: %{
              "account_holder_name" => :scalar,
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "branch_code" => :scalar,
              "expected_debit_date" => :scalar,
              "last4" => :scalar,
              "suffix" => :scalar
            }
          },
          "oxxo" => %{
            fields: %{
              "number" => :scalar
            }
          },
          "p24" => %{
            fields: %{
              "bank" => :scalar,
              "reference" => :scalar,
              "verified_name" => :scalar
            }
          },
          "pay_by_bank" => :scalar,
          "payco" => {:resource, Stripe.Resources.Payco},
          "payment_method" => :scalar,
          "paynow" => %{
            fields: %{
              "location" => :scalar,
              "reader" => :scalar,
              "reference" => :scalar
            }
          },
          "paypal" => %{
            fields: %{
              "country" => :scalar,
              "payer_email" => :scalar,
              "payer_id" => :scalar,
              "payer_name" => :scalar,
              "seller_protection" => %{
                fields: %{
                  "dispute_categories" => {:list, :scalar},
                  "status" => :scalar
                }
              },
              "transaction_id" => :scalar
            }
          },
          "payto" => %{
            fields: %{
              "bsb_number" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar,
              "pay_id" => :scalar
            }
          },
          "pix" => %{
            fields: %{
              "bank_transaction_id" => :scalar
            }
          },
          "promptpay" => %{
            fields: %{
              "reference" => :scalar
            }
          },
          "revolut_pay" => %{
            fields: %{
              "funding" => %{
                fields: %{
                  "card" => %{
                    fields: %{
                      "brand" => :scalar,
                      "country" => :scalar,
                      "exp_month" => :scalar,
                      "exp_year" => :scalar,
                      "funding" => :scalar,
                      "last4" => :scalar
                    }
                  },
                  "type" => :scalar
                }
              },
              "transaction_id" => :scalar
            }
          },
          "samsung_pay" => {:resource, Stripe.Resources.SamsungPay},
          "satispay" => %{
            fields: %{
              "transaction_id" => :scalar
            }
          },
          "sepa_credit_transfer" => %{
            fields: %{
              "bank_name" => :scalar,
              "bic" => :scalar,
              "iban" => :scalar
            }
          },
          "sepa_debit" => %{
            fields: %{
              "bank_code" => :scalar,
              "branch_code" => :scalar,
              "country" => :scalar,
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "mandate" => :scalar
            }
          },
          "sofort" => %{
            fields: %{
              "bank_code" => :scalar,
              "bank_name" => :scalar,
              "bic" => :scalar,
              "country" => :scalar,
              "generated_sepa_debit" => {:resource, Stripe.Resources.PaymentMethod},
              "generated_sepa_debit_mandate" => {:resource, Stripe.Resources.Mandate},
              "iban_last4" => :scalar,
              "preferred_language" => :scalar,
              "verified_name" => :scalar
            }
          },
          "stripe_account" => :scalar,
          "swish" => %{
            fields: %{
              "fingerprint" => :scalar,
              "payment_reference" => :scalar,
              "verified_phone_last4" => :scalar
            }
          },
          "twint" => :scalar,
          "type" => :scalar,
          "us_bank_account" => %{
            fields: %{
              "account_holder_type" => :scalar,
              "account_type" => :scalar,
              "bank_name" => :scalar,
              "expected_debit_date" => :scalar,
              "fingerprint" => :scalar,
              "last4" => :scalar,
              "mandate" => {:resource, Stripe.Resources.Mandate},
              "payment_reference" => :scalar,
              "routing_number" => :scalar
            }
          },
          "wechat" => :scalar,
          "wechat_pay" => %{
            fields: %{
              "fingerprint" => :scalar,
              "location" => :scalar,
              "reader" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "zip" => :scalar
        }
      },
      "processor_details" => %{
        fields: %{
          "custom" => %{
            fields: %{
              "payment_reference" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "shipping_details" => %{
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
      }
    }
  end
end
