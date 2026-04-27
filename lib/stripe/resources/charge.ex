# File generated from our OpenAPI spec
defmodule Stripe.Resources.Charge do
  @moduledoc """
  Charge

  The `Charge` object represents a single attempt to move money into your Stripe account.
  PaymentIntent confirmation is the most common way to create Charges, but [Account Debits](https://docs.stripe.com/connect/account-debits) may also create Charges.
  Some legacy payment flows create Charges directly, which is not recommended for new integrations.
  """

  @typedoc """
  * `amount` - Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://docs.stripe.com/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
  * `amount_captured` - Amount in cents (or local equivalent) captured (can be less than the amount attribute on the charge if a partial capture was made).
  * `amount_refunded` - Amount in cents (or local equivalent) refunded (can be less than the amount attribute on the charge if a partial refund was issued).
  * `application` - ID of the Connect application that created the charge. Nullable. Expandable.
  * `application_fee` - The application fee (if any) for the charge. [See the Connect documentation](https://docs.stripe.com/connect/direct-charges#collect-fees) for details. Nullable. Expandable.
  * `application_fee_amount` - The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://docs.stripe.com/connect/direct-charges#collect-fees) for details. Nullable.
  * `authorization_code` - Authorization code on the charge. Max length: 5000.
  * `balance_transaction` - ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes). Nullable. Expandable.
  * `billing_details` - Expandable.
  * `calculated_statement_descriptor` - The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined. This value only exists for card payments. Max length: 5000. Nullable.
  * `captured` - If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - ID of the customer this charge is for if one exists. Nullable. Expandable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 40000. Nullable.
  * `disputed` - Whether the charge has been disputed.
  * `failure_balance_transaction` - ID of the balance transaction that describes the reversal of the balance on your account due to payment failure. Nullable. Expandable.
  * `failure_code` - Error code explaining reason for charge failure if available (see [the errors section](https://docs.stripe.com/error-codes) for a list of codes). Max length: 5000. Nullable.
  * `failure_message` - Message to user further explaining reason for charge failure if available. Max length: 5000. Nullable.
  * `fraud_details` - Information on fraud assessments for the charge. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - ID of the invoice this charge is for if one exists. Nullable.
  * `level3` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `charge`.
  * `on_behalf_of` - The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers) for details. Nullable. Expandable.
  * `outcome` - Details about whether the payment was accepted, and why. See [understanding declines](https://docs.stripe.com/declines) for details. Nullable. Expandable.
  * `paid` - `true` if the charge succeeded, or was successfully authorized for later capture.
  * `payment_intent` - ID of the PaymentIntent associated with this charge, if one exists. Nullable. Expandable.
  * `payment_method` - ID of the payment method used in this charge. Max length: 5000. Nullable.
  * `payment_method_details` - Details about the payment method at the time of the transaction. Nullable. Expandable.
  * `presentment_details` - Expandable.
  * `radar_options` - Expandable.
  * `receipt_email` - This is the email address that the receipt for this charge was sent to. Max length: 5000. Nullable.
  * `receipt_number` - This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent. Max length: 5000. Nullable.
  * `receipt_url` - This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt. Max length: 5000. Nullable.
  * `refunded` - Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
  * `refunds` - A list of refunds that have been applied to the charge. Nullable. Expandable.
  * `review` - ID of the review associated with this charge if one exists. Nullable. Expandable.
  * `shipping` - Shipping information for the charge. Nullable. Expandable.
  * `source` - This is a legacy field that will be removed in the future. It contains the Source, Card, or BankAccount object used for the charge. For details about the payment method used for this charge, refer to `payment_method` or `payment_method_details` instead. Nullable. Expandable.
  * `source_transfer` - The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://docs.stripe.com/connect/destination-charges) for details. Nullable. Expandable.
  * `statement_descriptor` - For a non-card charge, text that appears on the customer's statement as the statement descriptor. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  For a card charge, this value is ignored unless you don't specify a `statement_descriptor_suffix`, in which case this value is used as the suffix. Max length: 5000. Nullable.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. If the account has no prefix value, the suffix is concatenated to the account's statement descriptor. Max length: 5000. Nullable.
  * `status` - The status of the payment is either `succeeded`, `pending`, or `failed`. Possible values: `failed`, `pending`, `succeeded`.
  * `transfer` - ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter). Expandable.
  * `transfer_data` - An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://docs.stripe.com/connect/destination-charges) for details. Nullable. Expandable.
  * `transfer_group` - A string that identifies this transaction as part of a group. See the [Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-options) for details. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_captured: integer(),
          amount_refunded: integer(),
          application: String.t() | Stripe.Resources.Application.t(),
          application_fee: String.t() | Stripe.Resources.ApplicationFee.t(),
          application_fee_amount: integer(),
          authorization_code: String.t() | nil,
          balance_transaction: String.t() | Stripe.Resources.BalanceTransaction.t(),
          billing_details: billing_details(),
          calculated_statement_descriptor: String.t(),
          captured: boolean(),
          created: integer(),
          currency: String.t(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          description: String.t(),
          disputed: boolean(),
          failure_balance_transaction: String.t() | Stripe.Resources.BalanceTransaction.t(),
          failure_code: String.t(),
          failure_message: String.t(),
          fraud_details: fraud_details(),
          id: String.t(),
          invoice: String.t() | Stripe.Resources.Invoice.t() | nil,
          level3: level3() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          outcome: outcome(),
          paid: boolean(),
          payment_intent: String.t() | Stripe.Resources.PaymentIntent.t(),
          payment_method: String.t(),
          payment_method_details: payment_method_details(),
          presentment_details: presentment_details() | nil,
          radar_options: radar_options() | nil,
          receipt_email: String.t(),
          receipt_number: String.t(),
          receipt_url: String.t(),
          refunded: boolean(),
          refunds: refunds() | nil,
          review: String.t() | Stripe.Resources.Review.t(),
          shipping: Stripe.Resources.ShippingDetails.t(),
          source: Stripe.Resources.PaymentSource.t(),
          source_transfer: String.t() | Stripe.Resources.Transfer.t(),
          statement_descriptor: String.t(),
          statement_descriptor_suffix: String.t(),
          status: String.t(),
          transfer: String.t() | Stripe.Resources.Transfer.t() | nil,
          transfer_data: transfer_data(),
          transfer_group: String.t()
        }

  defstruct [
    :amount,
    :amount_captured,
    :amount_refunded,
    :application,
    :application_fee,
    :application_fee_amount,
    :authorization_code,
    :balance_transaction,
    :billing_details,
    :calculated_statement_descriptor,
    :captured,
    :created,
    :currency,
    :customer,
    :description,
    :disputed,
    :failure_balance_transaction,
    :failure_code,
    :failure_message,
    :fraud_details,
    :id,
    :invoice,
    :level3,
    :livemode,
    :metadata,
    :object,
    :on_behalf_of,
    :outcome,
    :paid,
    :payment_intent,
    :payment_method,
    :payment_method_details,
    :presentment_details,
    :radar_options,
    :receipt_email,
    :receipt_number,
    :receipt_url,
    :refunded,
    :refunds,
    :review,
    :shipping,
    :source,
    :source_transfer,
    :statement_descriptor,
    :statement_descriptor_suffix,
    :status,
    :transfer,
    :transfer_data,
    :transfer_group
  ]

  @object_name "charge"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "application",
      "application_fee",
      "balance_transaction",
      "billing_details",
      "customer",
      "failure_balance_transaction",
      "fraud_details",
      "level3",
      "on_behalf_of",
      "outcome",
      "payment_intent",
      "payment_method_details",
      "presentment_details",
      "radar_options",
      "refunds",
      "review",
      "shipping",
      "source",
      "source_transfer",
      "transfer",
      "transfer_data"
    ]

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
  * `stripe_report` - Assessments from Stripe. If set, the value is `fraudulent`. Max length: 5000.
  * `user_report` - Assessments reported by you. If set, possible values of are `safe` and `fraudulent`. Max length: 5000.
  """
  @type fraud_details :: %{
          optional(:stripe_report) => String.t() | nil,
          optional(:user_report) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer_reference` - Max length: 5000.
  * `line_items`
  * `merchant_reference` - Max length: 5000.
  * `shipping_address_zip` - Max length: 5000.
  * `shipping_amount`
  * `shipping_from_zip` - Max length: 5000.
  """
  @type level3 :: %{
          optional(:customer_reference) => String.t() | nil,
          optional(:line_items) => [level3_line_items()] | nil,
          optional(:merchant_reference) => String.t() | nil,
          optional(:shipping_address_zip) => String.t() | nil,
          optional(:shipping_amount) => integer() | nil,
          optional(:shipping_from_zip) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `discount_amount` - Nullable.
  * `product_code` - Max length: 5000.
  * `product_description` - Max length: 5000.
  * `quantity` - Nullable.
  * `tax_amount` - Nullable.
  * `unit_cost` - Nullable.
  """
  @type level3_line_items :: %{
          optional(:discount_amount) => integer() | nil,
          optional(:product_code) => String.t() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:quantity) => integer() | nil,
          optional(:tax_amount) => integer() | nil,
          optional(:unit_cost) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `advice_code` - An enumerated value providing a more detailed explanation on [how to proceed with an error](https://docs.stripe.com/declines#retrying-issuer-declines). Possible values: `confirm_card_data`, `do_not_try_again`, `try_again_later`. Nullable.
  * `network_advice_code` - For charges declined by the network, a 2 digit code which indicates the advice returned by the network on how to proceed with an error. Max length: 5000. Nullable.
  * `network_decline_code` - For charges declined by the network, an alphanumeric code which indicates the reason the charge failed. Max length: 5000. Nullable.
  * `network_status` - Possible values are `approved_by_network`, `declined_by_network`, `not_sent_to_network`, and `reversed_after_approval`. The value `reversed_after_approval` indicates the payment was [blocked by Stripe](https://docs.stripe.com/declines#blocked-payments) after bank authorization, and may temporarily appear as "pending" on a cardholder's statement. Max length: 5000. Nullable.
  * `reason` - An enumerated value providing a more detailed explanation of the outcome's `type`. Charges blocked by Radar's default block rule have the value `highest_risk_level`. Charges placed in review by Radar's default review rule have the value `elevated_risk_level`. Charges blocked because the payment is unlikely to be authorized have the value `low_probability_of_authorization`. Charges authorized, blocked, or placed in review by custom rules have the value `rule`. See [understanding declines](https://docs.stripe.com/declines) for more details. Max length: 5000. Nullable.
  * `risk_level` - Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are `normal`, `elevated`, `highest`. For non-card payments, and card-based payments predating the public assignment of risk levels, this field will have the value `not_assessed`. In the event of an error in the evaluation, this field will have the value `unknown`. This field is only available with Radar. Max length: 5000.
  * `risk_score` - Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are between 0 and 100. For non-card payments, card-based payments predating the public assignment of risk scores, or in the event of an error during evaluation, this field will not be present. This field is only available with Radar for Fraud Teams.
  * `rule` - The ID of the Radar rule that matched the payment, if applicable.
  * `seller_message` - A human-readable description of the outcome type and reason, designed for you (the recipient of the payment), not your customer. Max length: 5000. Nullable.
  * `type` - Possible values are `authorized`, `manual_review`, `issuer_declined`, `blocked`, and `invalid`. See [understanding declines](https://docs.stripe.com/declines) and [Radar reviews](https://docs.stripe.com/radar/reviews) for details. Max length: 5000.
  """
  @type outcome :: %{
          optional(:advice_code) => String.t() | nil,
          optional(:network_advice_code) => String.t() | nil,
          optional(:network_decline_code) => String.t() | nil,
          optional(:network_status) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(:risk_level) => String.t() | nil,
          optional(:risk_score) => integer() | nil,
          optional(:rule) => String.t() | Stripe.Resources.Radar.Rule.t() | nil,
          optional(:seller_message) => String.t() | nil,
          optional(:type) => String.t() | nil,
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
  * `blik`
  * `boleto`
  * `card`
  * `card_present`
  * `cashapp`
  * `crypto`
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
  * `sepa_credit_transfer`
  * `sepa_debit`
  * `sofort`
  * `stripe_account`
  * `swish`
  * `twint`
  * `type` - The type of transaction-specific details of the payment method used in the payment. See [PaymentMethod.type](https://docs.stripe.com/api/payment_methods/object#payment_method_object-type) for the full list of possible types.
  An additional hash is included on `payment_method_details` with a name matching this value.
  It contains information specific to the payment method. Max length: 5000.
  * `upi`
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
          optional(:blik) => payment_method_details_blik() | nil,
          optional(:boleto) => payment_method_details_boleto() | nil,
          optional(:card) => payment_method_details_card() | nil,
          optional(:card_present) => payment_method_details_card_present() | nil,
          optional(:cashapp) => payment_method_details_cashapp() | nil,
          optional(:crypto) => Stripe.Resources.Crypto.t() | nil,
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
          optional(:upi) => payment_method_details_upi() | nil,
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
  * `amount_authorized` - The authorized amount. Nullable.
  * `authorization_code` - Authorization code on the charge. Max length: 5000. Nullable.
  * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000. Nullable.
  * `capture_before` - When using manual capture, a future timestamp at which the charge will be automatically refunded if uncaptured. Format: Unix timestamp.
  * `checks` - Check results by Card networks on Card address and CVC at time of payment. Nullable.
  * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
  * `description` - A high-level description of the type of cards issued in this range. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
  * `exp_month` - Two-digit number representing the card's expiration month.
  * `exp_year` - Four-digit number representing the card's expiration year.
  * `extended_authorization`
  * `fingerprint` - Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

  *As of May 1, 2021, card fingerprint in India for Connect changed to allow two fingerprints for the same card---one for India and one for the rest of the world.* Max length: 5000. Nullable.
  * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
  * `iin` - Issuer identification number of the card. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
  * `incremental_authorization`
  * `installments` - Installment details for this payment.

  For more information, see the [installments integration guide](https://docs.stripe.com/payments/installments). Nullable.
  * `issuer` - The name of the card's issuing bank. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
  * `last4` - The last four digits of the card. Max length: 5000. Nullable.
  * `mandate` - ID of the mandate used to make this payment or created by it. Max length: 5000. Nullable.
  * `moto` - True if this payment was marked as MOTO and out of scope for SCA. Nullable.
  * `multicapture`
  * `network` - Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`. Max length: 5000. Nullable.
  * `network_token` - If this card has network token credentials, this contains the details of the network token credentials. Nullable.
  * `network_transaction_id` - This is used by the financial networks to identify a transaction. Visa calls this the Transaction ID, Mastercard calls this the Trace ID, and American Express calls this the Acquirer Reference Data. This value will be present if it is returned by the financial network in the authorization response, and null otherwise. Max length: 5000. Nullable.
  * `overcapture`
  * `regulated_status` - Status of a card based on the card issuer. Possible values: `regulated`, `unregulated`. Nullable.
  * `three_d_secure` - Populated if this transaction used 3D Secure authentication. Nullable.
  * `wallet` - If this Card is part of a card wallet, this contains the details of the card wallet. Nullable.
  """
  @type payment_method_details_card :: %{
          optional(:amount_authorized) => integer() | nil,
          optional(:authorization_code) => String.t() | nil,
          optional(:brand) => String.t() | nil,
          optional(:capture_before) => integer() | nil,
          optional(:checks) => payment_method_details_card_checks() | nil,
          optional(:country) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:extended_authorization) =>
            payment_method_details_card_extended_authorization() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:funding) => String.t() | nil,
          optional(:iin) => String.t() | nil,
          optional(:incremental_authorization) =>
            payment_method_details_card_incremental_authorization() | nil,
          optional(:installments) => payment_method_details_card_installments() | nil,
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:mandate) => String.t() | nil,
          optional(:moto) => boolean() | nil,
          optional(:multicapture) => payment_method_details_card_multicapture() | nil,
          optional(:network) => String.t() | nil,
          optional(:network_token) => payment_method_details_card_network_token() | nil,
          optional(:network_transaction_id) => String.t() | nil,
          optional(:overcapture) => payment_method_details_card_overcapture() | nil,
          optional(:regulated_status) => String.t() | nil,
          optional(:three_d_secure) => payment_method_details_card_three_d_secure() | nil,
          optional(:wallet) => payment_method_details_card_wallet() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address_line1_check` - If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  * `address_postal_code_check` - If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  * `cvc_check` - If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`. Max length: 5000. Nullable.
  """
  @type payment_method_details_card_checks :: %{
          optional(:address_line1_check) => String.t() | nil,
          optional(:address_postal_code_check) => String.t() | nil,
          optional(:cvc_check) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - Indicates whether or not the capture window is extended beyond the standard authorization. Possible values: `disabled`, `enabled`.
  """
  @type payment_method_details_card_extended_authorization :: %{
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - Indicates whether or not the incremental authorization feature is supported. Possible values: `available`, `unavailable`.
  """
  @type payment_method_details_card_incremental_authorization :: %{
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `plan` - Installment plan selected for the payment. Nullable.
  """
  @type payment_method_details_card_installments :: %{
          optional(:plan) => payment_method_details_card_installments_plan() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `count` - For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card. Nullable.
  * `interval` - For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card.
  One of `month`. Possible values: `month`. Nullable.
  * `type` - Type of installment plan, one of `fixed_count`, `bonus`, or `revolving`. Possible values: `bonus`, `fixed_count`, `revolving`.
  """
  @type payment_method_details_card_installments_plan :: %{
          optional(:count) => integer() | nil,
          optional(:interval) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `status` - Indicates whether or not multiple captures are supported. Possible values: `available`, `unavailable`.
  """
  @type payment_method_details_card_multicapture :: %{
          optional(:status) => String.t() | nil,
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
  * `maximum_amount_capturable` - The maximum amount that can be captured.
  * `status` - Indicates whether or not the authorized amount can be over-captured. Possible values: `available`, `unavailable`.
  """
  @type payment_method_details_card_overcapture :: %{
          optional(:maximum_amount_capturable) => integer() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `authentication_flow` - For authenticated transactions: how the customer was authenticated by
  the issuing bank. Possible values: `challenge`, `frictionless`. Nullable.
  * `electronic_commerce_indicator` - The Electronic Commerce Indicator (ECI). A protocol-level field
  indicating what degree of authentication was performed. Possible values: `01`, `02`, `05`, `06`, `07`. Nullable.
  * `exemption_indicator` - The exemption requested via 3DS and accepted by the issuer at authentication time. Possible values: `low_risk`, `none`. Nullable.
  * `exemption_indicator_applied` - Whether Stripe requested the value of `exemption_indicator` in the transaction. This will depend on
  the outcome of Stripe's internal risk assessment.
  * `result` - Indicates the outcome of 3D Secure authentication. Possible values: `attempt_acknowledged`, `authenticated`, `exempted`, `failed`, `not_supported`, `processing_error`. Nullable.
  * `result_reason` - Additional information about why 3D Secure succeeded or failed based
  on the `result`. Possible values: `abandoned`, `bypassed`, `canceled`, `card_not_enrolled`, `network_not_supported`, `protocol_error`, `rejected`. Nullable.
  * `transaction_id` - The 3D Secure 1 XID or 3D Secure 2 Directory Server Transaction ID
  (dsTransId) for this payment. Max length: 5000. Nullable.
  * `version` - The version of 3D Secure that was used. Possible values: `1.0.2`, `2.1.0`, `2.2.0`, `2.3.0`, `2.3.1`. Nullable.
  """
  @type payment_method_details_card_three_d_secure :: %{
          optional(:authentication_flow) => String.t() | nil,
          optional(:electronic_commerce_indicator) => String.t() | nil,
          optional(:exemption_indicator) => String.t() | nil,
          optional(:exemption_indicator_applied) => boolean() | nil,
          optional(:result) => String.t() | nil,
          optional(:result_reason) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(:version) => String.t() | nil,
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
  @type payment_method_details_card_wallet :: %{
          optional(:amex_express_checkout) => map() | nil,
          optional(:apple_pay) => map() | nil,
          optional(:dynamic_last4) => String.t() | nil,
          optional(:google_pay) => map() | nil,
          optional(:link) => map() | nil,
          optional(:masterpass) => payment_method_details_card_wallet_masterpass() | nil,
          optional(:samsung_pay) => map() | nil,
          optional(:type) => String.t() | nil,
          optional(:visa_checkout) => payment_method_details_card_wallet_visa_checkout() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_address` - Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
  * `email` - Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `name` - Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
  * `shipping_address` - Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated. Nullable.
  """
  @type payment_method_details_card_wallet_masterpass :: %{
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
  @type payment_method_details_card_wallet_visa_checkout :: %{
          optional(:billing_address) => Stripe.Resources.Address.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:shipping_address) => Stripe.Resources.Address.t() | nil,
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
          optional(:location) => String.t() | nil,
          optional(:network) => String.t() | nil,
          optional(:network_transaction_id) => String.t() | nil,
          optional(:offline) => Stripe.Resources.Offline.t() | nil,
          optional(:overcapture_supported) => boolean() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(:reader) => String.t() | nil,
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
  * `location` - ID of the [location](https://docs.stripe.com/api/terminal/locations) that this transaction's reader is assigned to. Max length: 5000.
  * `network` - Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`. Max length: 5000. Nullable.
  * `network_transaction_id` - This is used by the financial networks to identify a transaction. Visa calls this the Transaction ID, Mastercard calls this the Trace ID, and American Express calls this the Acquirer Reference Data. This value will be present if it is returned by the financial network in the authorization response, and null otherwise. Max length: 5000. Nullable.
  * `preferred_locales` - The languages that the issuing bank recommends using for localizing any customer-facing text, as read from the card. Referenced from EMV tag 5F2D, data encoded on the card's chip. Nullable.
  * `read_method` - How card details were read in this transaction. Possible values: `contact_emv`, `contactless_emv`, `contactless_magstripe_mode`, `magnetic_stripe_fallback`, `magnetic_stripe_track2`. Nullable.
  * `reader` - ID of the [reader](https://docs.stripe.com/api/terminal/readers) this transaction was made on. Max length: 5000.
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
          optional(:location) => String.t() | nil,
          optional(:network) => String.t() | nil,
          optional(:network_transaction_id) => String.t() | nil,
          optional(:preferred_locales) => [String.t()] | nil,
          optional(:read_method) => String.t() | nil,
          optional(:reader) => String.t() | nil,
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
  * `vpa` - Customer's unique Virtual Payment Address. Max length: 5000. Nullable.
  """
  @type payment_method_details_upi :: %{
          optional(:vpa) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `account_holder_type` - Account holder type: individual or company. Possible values: `company`, `individual`. Nullable.
  * `account_type` - Account type: checkings or savings. Defaults to checking if omitted. Possible values: `checking`, `savings`. Nullable.
  * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
  * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
  * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
  * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
  * `mandate` - ID of the mandate used to make this payment.
  * `payment_reference` - Reference number to locate ACH payments with customer's bank. Max length: 5000. Nullable.
  * `routing_number` - Routing number of the bank account. Max length: 5000. Nullable.
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
  * `presentment_amount` - Amount intended to be collected by this payment, denominated in `presentment_currency`.
  * `presentment_currency` - Currency presented to the customer during payment. Max length: 5000.
  """
  @type presentment_details :: %{
          optional(:presentment_amount) => integer() | nil,
          optional(:presentment_currency) => String.t() | nil,
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
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type refunds :: %{
          optional(:data) => [Stripe.Resources.Refund.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount transferred to the destination account, if specified. By default, the entire charge amount is transferred to the destination account. Nullable.
  * `destination` - ID of an existing, connected Stripe account to transfer funds to if `transfer_data` was specified in the charge request.
  """
  @type transfer_data :: %{
          optional(:amount) => integer() | nil,
          optional(:destination) => String.t() | Stripe.Resources.Account.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "billing_details" => %{
        fields: %{
          "address" => {:resource, Stripe.Resources.Address},
          "email" => :scalar,
          "name" => :scalar,
          "phone" => :scalar,
          "tax_id" => :scalar
        }
      },
      "fraud_details" => %{
        fields: %{
          "stripe_report" => :scalar,
          "user_report" => :scalar
        }
      },
      "level3" => %{
        fields: %{
          "customer_reference" => :scalar,
          "line_items" =>
            {:list,
             %{
               fields: %{
                 "discount_amount" => :scalar,
                 "product_code" => :scalar,
                 "product_description" => :scalar,
                 "quantity" => :scalar,
                 "tax_amount" => :scalar,
                 "unit_cost" => :scalar
               }
             }},
          "merchant_reference" => :scalar,
          "shipping_address_zip" => :scalar,
          "shipping_amount" => :scalar,
          "shipping_from_zip" => :scalar
        }
      },
      "outcome" => %{
        fields: %{
          "advice_code" => :scalar,
          "network_advice_code" => :scalar,
          "network_decline_code" => :scalar,
          "network_status" => :scalar,
          "reason" => :scalar,
          "risk_level" => :scalar,
          "risk_score" => :scalar,
          "rule" => {:resource, Stripe.Resources.Radar.Rule},
          "seller_message" => :scalar,
          "type" => :scalar
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
              "amount_authorized" => :scalar,
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
              "extended_authorization" => %{
                fields: %{
                  "status" => :scalar
                }
              },
              "fingerprint" => :scalar,
              "funding" => :scalar,
              "iin" => :scalar,
              "incremental_authorization" => %{
                fields: %{
                  "status" => :scalar
                }
              },
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
              "mandate" => :scalar,
              "moto" => :scalar,
              "multicapture" => %{
                fields: %{
                  "status" => :scalar
                }
              },
              "network" => :scalar,
              "network_token" => %{
                fields: %{
                  "used" => :scalar
                }
              },
              "network_transaction_id" => :scalar,
              "overcapture" => %{
                fields: %{
                  "maximum_amount_capturable" => :scalar,
                  "status" => :scalar
                }
              },
              "regulated_status" => :scalar,
              "three_d_secure" => %{
                fields: %{
                  "authentication_flow" => :scalar,
                  "electronic_commerce_indicator" => :scalar,
                  "exemption_indicator" => :scalar,
                  "exemption_indicator_applied" => :scalar,
                  "result" => :scalar,
                  "result_reason" => :scalar,
                  "transaction_id" => :scalar,
                  "version" => :scalar
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
          "cashapp" => %{
            fields: %{
              "buyer_id" => :scalar,
              "cashtag" => :scalar,
              "transaction_id" => :scalar
            }
          },
          "crypto" => {:resource, Stripe.Resources.Crypto},
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
              "location" => :scalar,
              "network" => :scalar,
              "network_transaction_id" => :scalar,
              "preferred_locales" => {:list, :scalar},
              "read_method" => :scalar,
              "reader" => :scalar,
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
      "presentment_details" => %{
        fields: %{
          "presentment_amount" => :scalar,
          "presentment_currency" => :scalar
        }
      },
      "radar_options" => %{
        fields: %{
          "session" => :scalar
        }
      },
      "refunds" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.Refund}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "transfer_data" => %{
        fields: %{
          "amount" => :scalar,
          "destination" => {:resource, Stripe.Resources.Account}
        }
      },
      "shipping" => {:resource, Stripe.Resources.ShippingDetails},
      "source" => {:resource, Stripe.Resources.PaymentSource}
    }
  end
end
