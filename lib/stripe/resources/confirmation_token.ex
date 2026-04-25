# File generated from our OpenAPI spec
defmodule Stripe.Resources.ConfirmationToken do
  @moduledoc """
  ConfirmationTokensResourceConfirmationToken

  ConfirmationTokens help transport client side data collected by Stripe JS over
  to your server for confirming a PaymentIntent or SetupIntent. If the confirmation
  is successful, values present on the ConfirmationToken are written onto the Intent.

  To learn more about how to use ConfirmationToken, visit the related guides:
  - [Finalize payments on the server](https://docs.stripe.com/payments/finalize-payments-on-the-server)
  - [Build two-step confirmation](https://docs.stripe.com/payments/build-a-two-step-confirmation).
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expires_at` - Time at which this ConfirmationToken expires and can no longer be used to confirm a PaymentIntent or SetupIntent. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `mandate_data` - Data used for generating a Mandate. Nullable. Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `confirmation_token`.
  * `payment_intent` - ID of the PaymentIntent that this ConfirmationToken was used to confirm, or null if this ConfirmationToken has not yet been used. Max length: 5000. Nullable.
  * `payment_method_options` - Payment-method-specific configuration for this ConfirmationToken. Nullable. Expandable.
  * `payment_method_preview` - Payment details collected by the Payment Element, used to create a PaymentMethod when a PaymentIntent or SetupIntent is confirmed with this ConfirmationToken. Nullable. Expandable.
  * `return_url` - Return URL used to confirm the Intent. Max length: 5000. Nullable.
  * `setup_future_usage` - Indicates that you intend to make future payments with this ConfirmationToken's payment method.

  The presence of this property will [attach the payment method](https://docs.stripe.com/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. Possible values: `off_session`, `on_session`. Nullable.
  * `setup_intent` - ID of the SetupIntent that this ConfirmationToken was used to confirm, or null if this ConfirmationToken has not yet been used. Max length: 5000. Nullable.
  * `shipping` - Shipping information collected on this ConfirmationToken. Nullable. Expandable.
  * `use_stripe_sdk` - Indicates whether the Stripe SDK is used to handle confirmation flow. Defaults to `true` on ConfirmationToken.
  """
  @type t :: %__MODULE__{
          created: integer(),
          expires_at: integer(),
          id: String.t(),
          livemode: boolean(),
          mandate_data: mandate_data() | nil,
          object: String.t(),
          payment_intent: String.t(),
          payment_method_options: payment_method_options(),
          payment_method_preview: payment_method_preview(),
          return_url: String.t(),
          setup_future_usage: String.t(),
          setup_intent: String.t(),
          shipping: shipping(),
          use_stripe_sdk: boolean()
        }

  defstruct [
    :created,
    :expires_at,
    :id,
    :livemode,
    :mandate_data,
    :object,
    :payment_intent,
    :payment_method_options,
    :payment_method_preview,
    :return_url,
    :setup_future_usage,
    :setup_intent,
    :shipping,
    :use_stripe_sdk
  ]

  @object_name "confirmation_token"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["mandate_data", "payment_method_options", "payment_method_preview", "shipping"]

  @typedoc """
  * `customer_acceptance`
  """
  @type mandate_data :: %{
          optional(:customer_acceptance) => mandate_data_customer_acceptance() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `online` - If this is a Mandate accepted online, this hash contains details about the online acceptance. Nullable.
  * `type` - The type of customer acceptance information included with the Mandate. Max length: 5000.
  """
  @type mandate_data_customer_acceptance :: %{
          optional(:online) => mandate_data_customer_acceptance_online() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ip_address` - The IP address from which the Mandate was accepted by the customer. Max length: 5000. Nullable.
  * `user_agent` - The user agent of the browser from which the Mandate was accepted by the customer. Max length: 5000. Nullable.
  """
  @type mandate_data_customer_acceptance_online :: %{
          optional(:ip_address) => String.t() | nil,
          optional(:user_agent) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card` - This hash contains the card payment method options. Nullable.
  """
  @type payment_method_options :: %{
          optional(:card) => payment_method_options_card() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `cvc_token` - The `cvc_update` Token collected from the Payment Element. Max length: 5000. Nullable.
  * `installments`
  """
  @type payment_method_options_card :: %{
          optional(:cvc_token) => String.t() | nil,
          optional(:installments) => payment_method_options_card_installments() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `plan`
  """
  @type payment_method_options_card_installments :: %{
          optional(:plan) => payment_method_options_card_installments_plan() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `count` - For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card. Nullable.
  * `interval` - For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card.
  One of `month`. Possible values: `month`. Nullable.
  * `type` - Type of installment plan, one of `fixed_count`, `bonus`, or `revolving`. Possible values: `bonus`, `fixed_count`, `revolving`.
  """
  @type payment_method_options_card_installments_plan :: %{
          optional(:count) => integer() | nil,
          optional(:interval) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `acss_debit`
  * `affirm`
  * `afterpay_clearpay`
  * `alipay`
  * `allow_redisplay` - This field indicates whether this payment method can be shown again to its customer in a checkout flow. Stripe products such as Checkout and Elements use this field to determine whether a payment method can be shown as a saved payment method in a checkout flow. The field defaults to “unspecified”. Possible values: `always`, `limited`, `unspecified`.
  * `alma`
  * `amazon_pay`
  * `au_becs_debit`
  * `bacs_debit`
  * `bancontact`
  * `billie`
  * `billing_details`
  * `blik`
  * `boleto`
  * `card`
  * `card_present`
  * `cashapp`
  * `crypto`
  * `customer` - The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer. Nullable.
  * `customer_account` - Max length: 5000. Nullable.
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
  * `paynow`
  * `paypal`
  * `payto`
  * `pix`
  * `promptpay`
  * `revolut_pay`
  * `samsung_pay`
  * `satispay`
  * `sepa_debit`
  * `sofort`
  * `swish`
  * `twint`
  * `type` - The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type. Possible values: `acss_debit`, `affirm`, `afterpay_clearpay`, `alipay`, `alma`, `amazon_pay`, `au_becs_debit`, `bacs_debit`, `bancontact`, `billie`, `blik`, `boleto`, `card`, `card_present`, `cashapp`, `crypto`, `custom`, `customer_balance`, `eps`, `fpx`, `giropay`, `grabpay`, `ideal`, `interac_present`, `kakao_pay`, `klarna`, `konbini`, `kr_card`, `link`, `mb_way`, `mobilepay`, `multibanco`, `naver_pay`, `nz_bank_account`, `oxxo`, `p24`, `pay_by_bank`, `payco`, `paynow`, `paypal`, `payto`, `pix`, `promptpay`, `revolut_pay`, `samsung_pay`, `satispay`, `sepa_debit`, `sofort`, `swish`, `twint`, `us_bank_account`, `wechat_pay`, `zip`.
  * `us_bank_account`
  * `wechat_pay`
  * `zip`
  """
  @type payment_method_preview :: %{
          optional(:acss_debit) => payment_method_preview_acss_debit() | nil,
          optional(:affirm) => map() | nil,
          optional(:afterpay_clearpay) => map() | nil,
          optional(:alipay) => map() | nil,
          optional(:allow_redisplay) => String.t() | nil,
          optional(:alma) => map() | nil,
          optional(:amazon_pay) => map() | nil,
          optional(:au_becs_debit) => payment_method_preview_au_becs_debit() | nil,
          optional(:bacs_debit) => payment_method_preview_bacs_debit() | nil,
          optional(:bancontact) => map() | nil,
          optional(:billie) => map() | nil,
          optional(:billing_details) => payment_method_preview_billing_details() | nil,
          optional(:blik) => map() | nil,
          optional(:boleto) => payment_method_preview_boleto() | nil,
          optional(:card) => payment_method_preview_card() | nil,
          optional(:card_present) => payment_method_preview_card_present() | nil,
          optional(:cashapp) => payment_method_preview_cashapp() | nil,
          optional(:crypto) => Stripe.Resources.Crypto.t() | nil,
          optional(:customer) => String.t() | Stripe.Resources.Customer.t() | nil,
          optional(:customer_account) => String.t() | nil,
          optional(:customer_balance) => map() | nil,
          optional(:eps) => payment_method_preview_eps() | nil,
          optional(:fpx) => payment_method_preview_fpx() | nil,
          optional(:giropay) => map() | nil,
          optional(:grabpay) => map() | nil,
          optional(:ideal) => payment_method_preview_ideal() | nil,
          optional(:interac_present) => payment_method_preview_interac_present() | nil,
          optional(:kakao_pay) => Stripe.Resources.KakaoPay.t() | nil,
          optional(:klarna) => payment_method_preview_klarna() | nil,
          optional(:konbini) => map() | nil,
          optional(:kr_card) => Stripe.Resources.KrCard.t() | nil,
          optional(:link) => payment_method_preview_link() | nil,
          optional(:mb_way) => Stripe.Resources.MbWay.t() | nil,
          optional(:mobilepay) => map() | nil,
          optional(:multibanco) => map() | nil,
          optional(:naver_pay) => Stripe.Resources.NaverPay.t() | nil,
          optional(:nz_bank_account) => payment_method_preview_nz_bank_account() | nil,
          optional(:oxxo) => map() | nil,
          optional(:p24) => payment_method_preview_p24() | nil,
          optional(:pay_by_bank) => map() | nil,
          optional(:payco) => Stripe.Resources.Payco.t() | nil,
          optional(:paynow) => map() | nil,
          optional(:paypal) => payment_method_preview_paypal() | nil,
          optional(:payto) => payment_method_preview_payto() | nil,
          optional(:pix) => map() | nil,
          optional(:promptpay) => map() | nil,
          optional(:revolut_pay) => map() | nil,
          optional(:samsung_pay) => Stripe.Resources.SamsungPay.t() | nil,
          optional(:satispay) => map() | nil,
          optional(:sepa_debit) => payment_method_preview_sepa_debit() | nil,
          optional(:sofort) => payment_method_preview_sofort() | nil,
          optional(:swish) => map() | nil,
          optional(:twint) => map() | nil,
          optional(:type) => String.t() | nil,
          optional(:us_bank_account) => payment_method_preview_us_bank_account() | nil,
          optional(:wechat_pay) => map() | nil,
          optional(:zip) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `institution_number` - Institution number of the bank account. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `transit_number` - Transit number of the bank account. Max length: 5000. Nullable.
  """
  @type payment_method_preview_acss_debit :: %{
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
  @type payment_method_preview_au_becs_debit :: %{
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
  @type payment_method_preview_bacs_debit :: %{
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
  @type payment_method_preview_billing_details :: %{
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
  @type payment_method_preview_boleto :: %{
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
  @type payment_method_preview_card :: %{
          optional(:brand) => String.t() | nil,
          optional(:checks) => payment_method_preview_card_checks() | nil,
          optional(:country) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:display_brand) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:funding) => String.t() | nil,
          optional(:generated_from) => payment_method_preview_card_generated_from() | nil,
          optional(:iin) => String.t() | nil,
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:networks) => payment_method_preview_card_networks() | nil,
          optional(:regulated_status) => String.t() | nil,
          optional(:three_d_secure_usage) =>
            payment_method_preview_card_three_d_secure_usage() | nil,
          optional(:wallet) => payment_method_preview_card_wallet() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address_line1_check` - If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  * `address_postal_code_check` - If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  * `cvc_check` - If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  """
  @type payment_method_preview_card_checks :: %{
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
  @type payment_method_preview_card_generated_from :: %{
          optional(:charge) => String.t() | nil,
          optional(:payment_method_details) =>
            payment_method_preview_card_generated_from_payment_method_details() | nil,
          optional(:setup_attempt) => String.t() | Stripe.Resources.SetupAttempt.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card_present`
  * `type` - The type of payment method transaction-specific details from the transaction that generated this `card` payment method. Always `card_present`. Max length: 5000.
  """
  @type payment_method_preview_card_generated_from_payment_method_details :: %{
          optional(:card_present) =>
            payment_method_preview_card_generated_from_payment_method_details_card_present() | nil,
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
  @type payment_method_preview_card_generated_from_payment_method_details_card_present :: %{
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
          optional(:receipt) =>
            payment_method_preview_card_generated_from_payment_method_details_card_present_receipt()
            | nil,
          optional(:wallet) =>
            payment_method_preview_card_generated_from_payment_method_details_card_present_wallet()
            | nil,
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
  @type payment_method_preview_card_generated_from_payment_method_details_card_present_receipt ::
          %{
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
  @type payment_method_preview_card_generated_from_payment_method_details_card_present_wallet ::
          %{
            optional(:type) => String.t() | nil,
            optional(String.t()) => term()
          }

  @typedoc """
  * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
  * `preferred` - The preferred network for co-branded cards. Can be `cartes_bancaires`, `mastercard`, `visa` or `invalid_preference` if requested network is not valid for the card. Max length: 5000. Nullable.
  """
  @type payment_method_preview_card_networks :: %{
          optional(:available) => [String.t()] | nil,
          optional(:preferred) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `supported` - Whether 3D Secure is supported on this card.
  """
  @type payment_method_preview_card_three_d_secure_usage :: %{
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
  @type payment_method_preview_card_wallet :: %{
          optional(:amex_express_checkout) => map() | nil,
          optional(:apple_pay) => map() | nil,
          optional(:dynamic_last4) => String.t() | nil,
          optional(:google_pay) => map() | nil,
          optional(:link) => map() | nil,
          optional(:masterpass) => payment_method_preview_card_wallet_masterpass() | nil,
          optional(:samsung_pay) => map() | nil,
          optional(:type) => String.t() | nil,
          optional(:visa_checkout) => payment_method_preview_card_wallet_visa_checkout() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_address` - Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
  * `email` - Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `name` - Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `shipping_address` - Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
  """
  @type payment_method_preview_card_wallet_masterpass :: %{
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
  @type payment_method_preview_card_wallet_visa_checkout :: %{
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
  @type payment_method_preview_card_present :: %{
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
          optional(:networks) => payment_method_preview_card_present_networks() | nil,
          optional(:offline) => Stripe.Resources.Offline.t() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(:wallet) => payment_method_preview_card_present_wallet() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
  * `preferred` - The preferred network for the card. Max length: 5000. Nullable.
  """
  @type payment_method_preview_card_present_networks :: %{
          optional(:available) => [String.t()] | nil,
          optional(:preferred) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - The type of mobile wallet, one of `apple_pay`, `google_pay`, `samsung_pay`, or `unknown`. Possible values: `apple_pay`, `google_pay`, `samsung_pay`, `unknown`.
  """
  @type payment_method_preview_card_present_wallet :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `buyer_id` - A unique and immutable identifier assigned by Cash App to every buyer. Max length: 5000. Nullable.
  * `cashtag` - A public identifier for buyers using Cash App. Max length: 5000. Nullable.
  """
  @type payment_method_preview_cashapp :: %{
          optional(:buyer_id) => String.t() | nil,
          optional(:cashtag) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`. Possible values: `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, `vr_bank_braunau`. Nullable.
  """
  @type payment_method_preview_eps :: %{
          optional(:bank) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_type` - Account holder type, if provided. Can be one of `individual` or `company`. Possible values: `company`, `individual`. Nullable.
  * `bank` - The customer's bank, if provided. Can be one of `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, `pb_enterprise`, or `bank_of_china`. Possible values: `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_of_china`, `bank_rakyat`, `bsn`, `cimb`, `deutsche_bank`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2e`, `maybank2u`, `ocbc`, `pb_enterprise`, `public_bank`, `rhb`, `standard_chartered`, `uob`.
  """
  @type payment_method_preview_fpx :: %{
          optional(:account_holder_type) => String.t() | nil,
          optional(:bank) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank, if provided. Can be one of `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, or `yoursafe`. Possible values: `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, `yoursafe`. Nullable.
  * `bic` - The Bank Identifier Code of the customer's bank, if the bank was provided. Possible values: `ABNANL2A`, `ADYBNL2A`, `ASNBNL21`, `BITSNL2A`, `BUNQNL2A`, `BUUTNL2A`, `FNOMNL22`, `FVLBNL22`, `HANDNL2A`, `INGBNL2A`, `KNABNL2H`, `MLLENL2A`, `MOYONL21`, `NNBANL2G`, `NTSBDEB1`, `RABONL2U`, `RBRBNL21`, `REVOIE23`, `REVOLT21`, `SNSBNL2A`, `TRIONL2U`. Nullable.
  """
  @type payment_method_preview_ideal :: %{
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
  @type payment_method_preview_interac_present :: %{
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
          optional(:networks) => payment_method_preview_interac_present_networks() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `available` - All networks available for selection via [payment_method_options.card.network](https://docs.stripe.com/api/payment_intents/confirm#confirm_payment_intent-payment_method_options-card-network).
  * `preferred` - The preferred network for the card. Max length: 5000. Nullable.
  """
  @type payment_method_preview_interac_present_networks :: %{
          optional(:available) => [String.t()] | nil,
          optional(:preferred) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dob` - The customer's date of birth, if provided. Nullable.
  """
  @type payment_method_preview_klarna :: %{
          optional(:dob) => payment_method_preview_klarna_dob() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `day` - The day of birth, between 1 and 31. Nullable.
  * `month` - The month of birth, between 1 and 12. Nullable.
  * `year` - The four-digit year of birth. Nullable.
  """
  @type payment_method_preview_klarna_dob :: %{
          optional(:day) => integer() | nil,
          optional(:month) => integer() | nil,
          optional(:year) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `email` - Account owner's email address. Max length: 5000. Nullable.
  * `persistent_token` - [Deprecated] This is a legacy parameter that no longer has any function. Max length: 5000.
  """
  @type payment_method_preview_link :: %{
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
  @type payment_method_preview_nz_bank_account :: %{
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
  @type payment_method_preview_p24 :: %{
          optional(:bank) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter ISO code representing the buyer's country. Values are provided by PayPal directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `payer_email` - Owner's email. Values are provided by PayPal directly
  (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `payer_id` - PayPal account PayerID. This identifier uniquely identifies the PayPal customer. Max length: 5000. Nullable.
  """
  @type payment_method_preview_paypal :: %{
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
  @type payment_method_preview_payto :: %{
          optional(:bsb_number) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:pay_id) => String.t() | nil,
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
  @type payment_method_preview_sepa_debit :: %{
          optional(:bank_code) => String.t() | nil,
          optional(:branch_code) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:generated_from) => payment_method_preview_sepa_debit_generated_from() | nil,
          optional(:last4) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `charge` - The ID of the Charge that generated this PaymentMethod, if any. Nullable.
  * `setup_attempt` - The ID of the SetupAttempt that generated this PaymentMethod, if any. Nullable.
  """
  @type payment_method_preview_sepa_debit_generated_from :: %{
          optional(:charge) => String.t() | Stripe.Resources.Charge.t() | nil,
          optional(:setup_attempt) => String.t() | Stripe.Resources.SetupAttempt.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
  """
  @type payment_method_preview_sofort :: %{
          optional(:country) => String.t() | nil,
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
  @type payment_method_preview_us_bank_account :: %{
          optional(:account_holder_type) => String.t() | nil,
          optional(:account_type) => String.t() | nil,
          optional(:bank_name) => String.t() | nil,
          optional(:financial_connections_account) => String.t() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:networks) => payment_method_preview_us_bank_account_networks() | nil,
          optional(:routing_number) => String.t() | nil,
          optional(:status_details) =>
            payment_method_preview_us_bank_account_status_details() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `preferred` - The preferred network. Max length: 5000. Nullable.
  * `supported` - All supported networks.
  """
  @type payment_method_preview_us_bank_account_networks :: %{
          optional(:preferred) => String.t() | nil,
          optional(:supported) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `blocked`
  """
  @type payment_method_preview_us_bank_account_status_details :: %{
          optional(:blocked) =>
            payment_method_preview_us_bank_account_status_details_blocked() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `network_code` - The ACH network code that resulted in this block. Possible values: `R02`, `R03`, `R04`, `R05`, `R07`, `R08`, `R10`, `R11`, `R16`, `R20`, `R29`, `R31`. Nullable.
  * `reason` - The reason why this PaymentMethod's fingerprint has been blocked Possible values: `bank_account_closed`, `bank_account_frozen`, `bank_account_invalid_details`, `bank_account_restricted`, `bank_account_unusable`, `debit_not_authorized`, `tokenized_account_number_deactivated`. Nullable.
  """
  @type payment_method_preview_us_bank_account_status_details_blocked :: %{
          optional(:network_code) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address`
  * `name` - Recipient name. Max length: 5000.
  * `phone` - Recipient phone (including extension). Max length: 5000. Nullable.
  """
  @type shipping :: %{
          optional(:address) => Stripe.Resources.Address.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "mandate_data" => %{
        fields: %{
          "customer_acceptance" => %{
            fields: %{
              "online" => %{
                fields: %{
                  "ip_address" => :scalar,
                  "user_agent" => :scalar
                }
              },
              "type" => :scalar
            }
          }
        }
      },
      "payment_method_options" => %{
        fields: %{
          "card" => %{
            fields: %{
              "cvc_token" => :scalar,
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
              }
            }
          }
        }
      },
      "payment_method_preview" => %{
        fields: %{
          "acss_debit" => %{
            fields: %{
              "bank_name" => :scalar,
              "fingerprint" => :scalar,
              "institution_number" => :scalar,
              "last4" => :scalar,
              "transit_number" => :scalar
            }
          },
          "affirm" => :scalar,
          "afterpay_clearpay" => :scalar,
          "alipay" => :scalar,
          "allow_redisplay" => :scalar,
          "alma" => :scalar,
          "amazon_pay" => :scalar,
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
          "bancontact" => :scalar,
          "billie" => :scalar,
          "billing_details" => %{
            fields: %{
              "address" => {:resource, Stripe.Resources.Address},
              "email" => :scalar,
              "name" => :scalar,
              "phone" => :scalar,
              "tax_id" => :scalar
            }
          },
          "blik" => :scalar,
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
          "crypto" => {:resource, Stripe.Resources.Crypto},
          "customer" => {:resource, Stripe.Resources.Customer},
          "customer_account" => :scalar,
          "customer_balance" => :scalar,
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
          "giropay" => :scalar,
          "grabpay" => :scalar,
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
          "kakao_pay" => {:resource, Stripe.Resources.KakaoPay},
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
          "konbini" => :scalar,
          "kr_card" => {:resource, Stripe.Resources.KrCard},
          "link" => %{
            fields: %{
              "email" => :scalar,
              "persistent_token" => :scalar
            }
          },
          "mb_way" => {:resource, Stripe.Resources.MbWay},
          "mobilepay" => :scalar,
          "multibanco" => :scalar,
          "naver_pay" => {:resource, Stripe.Resources.NaverPay},
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
          "oxxo" => :scalar,
          "p24" => %{
            fields: %{
              "bank" => :scalar
            }
          },
          "pay_by_bank" => :scalar,
          "payco" => {:resource, Stripe.Resources.Payco},
          "paynow" => :scalar,
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
          "pix" => :scalar,
          "promptpay" => :scalar,
          "revolut_pay" => :scalar,
          "samsung_pay" => {:resource, Stripe.Resources.SamsungPay},
          "satispay" => :scalar,
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
          "swish" => :scalar,
          "twint" => :scalar,
          "type" => :scalar,
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
          "wechat_pay" => :scalar,
          "zip" => :scalar
        }
      },
      "shipping" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "name" => :scalar,
          "phone" => :scalar
        }
      }
    }
  end
end
