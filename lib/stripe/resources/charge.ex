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
          billing_details: __MODULE__.BillingDetails.t(),
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
          fraud_details: __MODULE__.FraudDetails.t(),
          id: String.t(),
          invoice: String.t() | Stripe.Resources.Invoice.t() | nil,
          level3: __MODULE__.Level3.t() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          outcome: __MODULE__.Outcome.t(),
          paid: boolean(),
          payment_intent: String.t() | Stripe.Resources.PaymentIntent.t(),
          payment_method: String.t(),
          payment_method_details: __MODULE__.PaymentMethodDetails.t(),
          presentment_details: __MODULE__.PresentmentDetails.t() | nil,
          radar_options: __MODULE__.RadarOptions.t() | nil,
          receipt_email: String.t(),
          receipt_number: String.t(),
          receipt_url: String.t(),
          refunded: boolean(),
          refunds: __MODULE__.Refunds.t() | nil,
          review: String.t() | Stripe.Resources.Review.t(),
          shipping: Stripe.Resources.ShippingDetails.t(),
          source: Stripe.Resources.PaymentSource.t(),
          source_transfer: String.t() | Stripe.Resources.Transfer.t(),
          statement_descriptor: String.t(),
          statement_descriptor_suffix: String.t(),
          status: String.t(),
          transfer: String.t() | Stripe.Resources.Transfer.t() | nil,
          transfer_data: __MODULE__.TransferData.t(),
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

  defmodule FraudDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `stripe_report` - Assessments from Stripe. If set, the value is `fraudulent`. Max length: 5000.
    * `user_report` - Assessments reported by you. If set, possible values of are `safe` and `fraudulent`. Max length: 5000.
    """
    @type t :: %__MODULE__{
            stripe_report: String.t() | nil,
            user_report: String.t() | nil
          }
    defstruct [:stripe_report, :user_report]
  end

  defmodule Level3 do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `customer_reference` - Max length: 5000.
    * `line_items`
    * `merchant_reference` - Max length: 5000.
    * `shipping_address_zip` - Max length: 5000.
    * `shipping_amount`
    * `shipping_from_zip` - Max length: 5000.
    """
    @type t :: %__MODULE__{
            customer_reference: String.t() | nil,
            line_items: [__MODULE__.LineItems.t()] | nil,
            merchant_reference: String.t() | nil,
            shipping_address_zip: String.t() | nil,
            shipping_amount: integer() | nil,
            shipping_from_zip: String.t() | nil
          }
    defstruct [
      :customer_reference,
      :line_items,
      :merchant_reference,
      :shipping_address_zip,
      :shipping_amount,
      :shipping_from_zip
    ]

    defmodule LineItems do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `discount_amount` - Nullable.
      * `product_code` - Max length: 5000.
      * `product_description` - Max length: 5000.
      * `quantity` - Nullable.
      * `tax_amount` - Nullable.
      * `unit_cost` - Nullable.
      """
      @type t :: %__MODULE__{
              discount_amount: integer() | nil,
              product_code: String.t() | nil,
              product_description: String.t() | nil,
              quantity: integer() | nil,
              tax_amount: integer() | nil,
              unit_cost: integer() | nil
            }
      defstruct [
        :discount_amount,
        :product_code,
        :product_description,
        :quantity,
        :tax_amount,
        :unit_cost
      ]
    end

    def __inner_types__ do
      %{
        "line_items" => __MODULE__.LineItems
      }
    end
  end

  defmodule Outcome do
    @moduledoc "Nested struct within the parent resource."

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
    @type t :: %__MODULE__{
            advice_code: String.t() | nil,
            network_advice_code: String.t() | nil,
            network_decline_code: String.t() | nil,
            network_status: String.t() | nil,
            reason: String.t() | nil,
            risk_level: String.t() | nil,
            risk_score: integer() | nil,
            rule: String.t() | Stripe.Resources.Radar.Rule.t() | nil,
            seller_message: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [
      :advice_code,
      :network_advice_code,
      :network_decline_code,
      :network_status,
      :reason,
      :risk_level,
      :risk_score,
      :rule,
      :seller_message,
      :type
    ]
  end

  defmodule PaymentMethodDetails do
    @moduledoc "Nested struct within the parent resource."

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
    @type t :: %__MODULE__{
            ach_credit_transfer: __MODULE__.AchCreditTransfer.t() | nil,
            ach_debit: __MODULE__.AchDebit.t() | nil,
            acss_debit: __MODULE__.AcssDebit.t() | nil,
            affirm: __MODULE__.Affirm.t() | nil,
            afterpay_clearpay: __MODULE__.AfterpayClearpay.t() | nil,
            alipay: __MODULE__.Alipay.t() | nil,
            alma: __MODULE__.Alma.t() | nil,
            amazon_pay: __MODULE__.AmazonPay.t() | nil,
            au_becs_debit: __MODULE__.AuBecsDebit.t() | nil,
            bacs_debit: __MODULE__.BacsDebit.t() | nil,
            bancontact: __MODULE__.Bancontact.t() | nil,
            billie: __MODULE__.Billie.t() | nil,
            blik: __MODULE__.Blik.t() | nil,
            boleto: __MODULE__.Boleto.t() | nil,
            card: __MODULE__.Card.t() | nil,
            card_present: __MODULE__.CardPresent.t() | nil,
            cashapp: __MODULE__.Cashapp.t() | nil,
            crypto: Stripe.Resources.Crypto.t() | nil,
            customer_balance: map() | nil,
            eps: __MODULE__.Eps.t() | nil,
            fpx: __MODULE__.Fpx.t() | nil,
            giropay: __MODULE__.Giropay.t() | nil,
            grabpay: __MODULE__.Grabpay.t() | nil,
            ideal: __MODULE__.Ideal.t() | nil,
            interac_present: __MODULE__.InteracPresent.t() | nil,
            kakao_pay: Stripe.Resources.KakaoPay.t() | nil,
            klarna: __MODULE__.Klarna.t() | nil,
            konbini: __MODULE__.Konbini.t() | nil,
            kr_card: Stripe.Resources.KrCard.t() | nil,
            link: __MODULE__.Link.t() | nil,
            mb_way: Stripe.Resources.MbWay.t() | nil,
            mobilepay: __MODULE__.Mobilepay.t() | nil,
            multibanco: __MODULE__.Multibanco.t() | nil,
            naver_pay: Stripe.Resources.NaverPay.t() | nil,
            nz_bank_account: __MODULE__.NzBankAccount.t() | nil,
            oxxo: __MODULE__.Oxxo.t() | nil,
            p24: __MODULE__.P24.t() | nil,
            pay_by_bank: map() | nil,
            payco: Stripe.Resources.Payco.t() | nil,
            paynow: __MODULE__.Paynow.t() | nil,
            paypal: __MODULE__.Paypal.t() | nil,
            payto: __MODULE__.Payto.t() | nil,
            pix: __MODULE__.Pix.t() | nil,
            promptpay: __MODULE__.Promptpay.t() | nil,
            revolut_pay: __MODULE__.RevolutPay.t() | nil,
            samsung_pay: Stripe.Resources.SamsungPay.t() | nil,
            satispay: __MODULE__.Satispay.t() | nil,
            sepa_credit_transfer: __MODULE__.SepaCreditTransfer.t() | nil,
            sepa_debit: __MODULE__.SepaDebit.t() | nil,
            sofort: __MODULE__.Sofort.t() | nil,
            stripe_account: map() | nil,
            swish: __MODULE__.Swish.t() | nil,
            twint: map() | nil,
            type: String.t() | nil,
            upi: __MODULE__.Upi.t() | nil,
            us_bank_account: __MODULE__.UsBankAccount.t() | nil,
            wechat: map() | nil,
            wechat_pay: __MODULE__.WechatPay.t() | nil,
            zip: map() | nil
          }
    defstruct [
      :ach_credit_transfer,
      :ach_debit,
      :acss_debit,
      :affirm,
      :afterpay_clearpay,
      :alipay,
      :alma,
      :amazon_pay,
      :au_becs_debit,
      :bacs_debit,
      :bancontact,
      :billie,
      :blik,
      :boleto,
      :card,
      :card_present,
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
      :revolut_pay,
      :samsung_pay,
      :satispay,
      :sepa_credit_transfer,
      :sepa_debit,
      :sofort,
      :stripe_account,
      :swish,
      :twint,
      :type,
      :upi,
      :us_bank_account,
      :wechat,
      :wechat_pay,
      :zip
    ]

    defmodule AchCreditTransfer do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account_number` - Account number to transfer funds to. Max length: 5000. Nullable.
      * `bank_name` - Name of the bank associated with the routing number. Max length: 5000. Nullable.
      * `routing_number` - Routing transit number for the bank account to transfer funds to. Max length: 5000. Nullable.
      * `swift_code` - SWIFT code of the bank associated with the routing number. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              account_number: String.t() | nil,
              bank_name: String.t() | nil,
              routing_number: String.t() | nil,
              swift_code: String.t() | nil
            }
      defstruct [:account_number, :bank_name, :routing_number, :swift_code]
    end

    defmodule AchDebit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account_holder_type` - Type of entity that holds the account. This can be either `individual` or `company`. Possible values: `company`, `individual`. Nullable.
      * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
      * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
      * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
      * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
      * `routing_number` - Routing transit number of the bank account. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              account_holder_type: String.t() | nil,
              bank_name: String.t() | nil,
              country: String.t() | nil,
              fingerprint: String.t() | nil,
              last4: String.t() | nil,
              routing_number: String.t() | nil
            }
      defstruct [
        :account_holder_type,
        :bank_name,
        :country,
        :fingerprint,
        :last4,
        :routing_number
      ]
    end

    defmodule AcssDebit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
      * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
      * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
      * `institution_number` - Institution number of the bank account Max length: 5000. Nullable.
      * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
      * `mandate` - ID of the mandate used to make this payment. Max length: 5000.
      * `transit_number` - Transit number of the bank account. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bank_name: String.t() | nil,
              expected_debit_date: String.t() | nil,
              fingerprint: String.t() | nil,
              institution_number: String.t() | nil,
              last4: String.t() | nil,
              mandate: String.t() | nil,
              transit_number: String.t() | nil
            }
      defstruct [
        :bank_name,
        :expected_debit_date,
        :fingerprint,
        :institution_number,
        :last4,
        :mandate,
        :transit_number
      ]
    end

    defmodule Affirm do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `location` - ID of the [location](https://docs.stripe.com/api/terminal/locations) that this transaction's reader is assigned to. Max length: 5000.
      * `reader` - ID of the [reader](https://docs.stripe.com/api/terminal/readers) this transaction was made on. Max length: 5000.
      * `transaction_id` - The Affirm transaction ID associated with this payment. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              location: String.t() | nil,
              reader: String.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [:location, :reader, :transaction_id]
    end

    defmodule AfterpayClearpay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `order_id` - The Afterpay order ID associated with this payment intent. Max length: 5000. Nullable.
      * `reference` - Order identifier shown to the merchant in Afterpay’s online portal. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              order_id: String.t() | nil,
              reference: String.t() | nil
            }
      defstruct [:order_id, :reference]
    end

    defmodule Alipay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `buyer_id` - Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same. Max length: 5000.
      * `fingerprint` - Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same. Max length: 5000. Nullable.
      * `transaction_id` - Transaction ID of this particular Alipay transaction. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              buyer_id: String.t() | nil,
              fingerprint: String.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [:buyer_id, :fingerprint, :transaction_id]
    end

    defmodule Alma do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `installments`
      * `transaction_id` - The Alma transaction ID associated with this payment. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              installments: __MODULE__.Installments.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [:installments, :transaction_id]

      defmodule Installments do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `count` - The number of installments.
        """
        @type t :: %__MODULE__{
                count: integer() | nil
              }
        defstruct [:count]
      end

      def __inner_types__ do
        %{
          "installments" => __MODULE__.Installments
        }
      end
    end

    defmodule AmazonPay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `funding`
      * `transaction_id` - The Amazon Pay transaction ID associated with this payment. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              funding: __MODULE__.Funding.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [:funding, :transaction_id]

      defmodule Funding do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `card`
        * `type` - funding type of the underlying payment method. Possible values: `card`. Nullable.
        """
        @type t :: %__MODULE__{
                card: __MODULE__.Card.t() | nil,
                type: String.t() | nil
              }
        defstruct [:card, :type]

        defmodule Card do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000. Nullable.
          * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
          * `exp_month` - Two-digit number representing the card's expiration month. Nullable.
          * `exp_year` - Four-digit number representing the card's expiration year. Nullable.
          * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
          * `last4` - The last four digits of the card. Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  brand: String.t() | nil,
                  country: String.t() | nil,
                  exp_month: integer() | nil,
                  exp_year: integer() | nil,
                  funding: String.t() | nil,
                  last4: String.t() | nil
                }
          defstruct [:brand, :country, :exp_month, :exp_year, :funding, :last4]
        end

        def __inner_types__ do
          %{
            "card" => __MODULE__.Card
          }
        end
      end

      def __inner_types__ do
        %{
          "funding" => __MODULE__.Funding
        }
      end
    end

    defmodule AuBecsDebit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000. Nullable.
      * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
      * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
      * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
      * `mandate` - ID of the mandate used to make this payment. Max length: 5000.
      """
      @type t :: %__MODULE__{
              bsb_number: String.t() | nil,
              expected_debit_date: String.t() | nil,
              fingerprint: String.t() | nil,
              last4: String.t() | nil,
              mandate: String.t() | nil
            }
      defstruct [:bsb_number, :expected_debit_date, :fingerprint, :last4, :mandate]
    end

    defmodule BacsDebit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
      * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
      * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
      * `mandate` - ID of the mandate used to make this payment. Max length: 5000. Nullable.
      * `sort_code` - Sort code of the bank account. (e.g., `10-20-30`) Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              expected_debit_date: String.t() | nil,
              fingerprint: String.t() | nil,
              last4: String.t() | nil,
              mandate: String.t() | nil,
              sort_code: String.t() | nil
            }
      defstruct [:expected_debit_date, :fingerprint, :last4, :mandate, :sort_code]
    end

    defmodule Bancontact do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              bank_code: String.t() | nil,
              bank_name: String.t() | nil,
              bic: String.t() | nil,
              generated_sepa_debit: String.t() | Stripe.Resources.PaymentMethod.t() | nil,
              generated_sepa_debit_mandate: String.t() | Stripe.Resources.Mandate.t() | nil,
              iban_last4: String.t() | nil,
              preferred_language: String.t() | nil,
              verified_name: String.t() | nil
            }
      defstruct [
        :bank_code,
        :bank_name,
        :bic,
        :generated_sepa_debit,
        :generated_sepa_debit_mandate,
        :iban_last4,
        :preferred_language,
        :verified_name
      ]
    end

    defmodule Billie do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `transaction_id` - The Billie transaction ID associated with this payment. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              transaction_id: String.t() | nil
            }
      defstruct [:transaction_id]
    end

    defmodule Blik do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `buyer_id` - A unique and immutable identifier assigned by BLIK to every buyer. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              buyer_id: String.t() | nil
            }
      defstruct [:buyer_id]
    end

    defmodule Boleto do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `tax_id` - The tax ID of the customer (CPF for individuals consumers or CNPJ for businesses consumers) Max length: 5000.
      """
      @type t :: %__MODULE__{
              tax_id: String.t() | nil
            }
      defstruct [:tax_id]
    end

    defmodule Card do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              amount_authorized: integer() | nil,
              authorization_code: String.t() | nil,
              brand: String.t() | nil,
              capture_before: integer() | nil,
              checks: __MODULE__.Checks.t() | nil,
              country: String.t() | nil,
              description: String.t() | nil,
              exp_month: integer() | nil,
              exp_year: integer() | nil,
              extended_authorization: __MODULE__.ExtendedAuthorization.t() | nil,
              fingerprint: String.t() | nil,
              funding: String.t() | nil,
              iin: String.t() | nil,
              incremental_authorization: __MODULE__.IncrementalAuthorization.t() | nil,
              installments: __MODULE__.Installments.t() | nil,
              issuer: String.t() | nil,
              last4: String.t() | nil,
              mandate: String.t() | nil,
              moto: boolean() | nil,
              multicapture: __MODULE__.Multicapture.t() | nil,
              network: String.t() | nil,
              network_token: __MODULE__.NetworkToken.t() | nil,
              network_transaction_id: String.t() | nil,
              overcapture: __MODULE__.Overcapture.t() | nil,
              regulated_status: String.t() | nil,
              three_d_secure: __MODULE__.ThreeDSecure.t() | nil,
              wallet: __MODULE__.Wallet.t() | nil
            }
      defstruct [
        :amount_authorized,
        :authorization_code,
        :brand,
        :capture_before,
        :checks,
        :country,
        :description,
        :exp_month,
        :exp_year,
        :extended_authorization,
        :fingerprint,
        :funding,
        :iin,
        :incremental_authorization,
        :installments,
        :issuer,
        :last4,
        :mandate,
        :moto,
        :multicapture,
        :network,
        :network_token,
        :network_transaction_id,
        :overcapture,
        :regulated_status,
        :three_d_secure,
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

      defmodule ExtendedAuthorization do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `status` - Indicates whether or not the capture window is extended beyond the standard authorization. Possible values: `disabled`, `enabled`.
        """
        @type t :: %__MODULE__{
                status: String.t() | nil
              }
        defstruct [:status]
      end

      defmodule IncrementalAuthorization do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `status` - Indicates whether or not the incremental authorization feature is supported. Possible values: `available`, `unavailable`.
        """
        @type t :: %__MODULE__{
                status: String.t() | nil
              }
        defstruct [:status]
      end

      defmodule Installments do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `plan` - Installment plan selected for the payment. Nullable.
        """
        @type t :: %__MODULE__{
                plan: __MODULE__.Plan.t() | nil
              }
        defstruct [:plan]

        defmodule Plan do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `count` - For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card. Nullable.
          * `interval` - For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card.
          One of `month`. Possible values: `month`. Nullable.
          * `type` - Type of installment plan, one of `fixed_count`, `bonus`, or `revolving`. Possible values: `bonus`, `fixed_count`, `revolving`.
          """
          @type t :: %__MODULE__{
                  count: integer() | nil,
                  interval: String.t() | nil,
                  type: String.t() | nil
                }
          defstruct [:count, :interval, :type]
        end

        def __inner_types__ do
          %{
            "plan" => __MODULE__.Plan
          }
        end
      end

      defmodule Multicapture do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `status` - Indicates whether or not multiple captures are supported. Possible values: `available`, `unavailable`.
        """
        @type t :: %__MODULE__{
                status: String.t() | nil
              }
        defstruct [:status]
      end

      defmodule NetworkToken do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `used` - Indicates if Stripe used a network token, either user provided or Stripe managed when processing the transaction.
        """
        @type t :: %__MODULE__{
                used: boolean() | nil
              }
        defstruct [:used]
      end

      defmodule Overcapture do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `maximum_amount_capturable` - The maximum amount that can be captured.
        * `status` - Indicates whether or not the authorized amount can be over-captured. Possible values: `available`, `unavailable`.
        """
        @type t :: %__MODULE__{
                maximum_amount_capturable: integer() | nil,
                status: String.t() | nil
              }
        defstruct [:maximum_amount_capturable, :status]
      end

      defmodule ThreeDSecure do
        @moduledoc "Nested struct within the parent resource."

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
        @type t :: %__MODULE__{
                authentication_flow: String.t() | nil,
                electronic_commerce_indicator: String.t() | nil,
                exemption_indicator: String.t() | nil,
                exemption_indicator_applied: boolean() | nil,
                result: String.t() | nil,
                result_reason: String.t() | nil,
                transaction_id: String.t() | nil,
                version: String.t() | nil
              }
        defstruct [
          :authentication_flow,
          :electronic_commerce_indicator,
          :exemption_indicator,
          :exemption_indicator_applied,
          :result,
          :result_reason,
          :transaction_id,
          :version
        ]
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
          "extended_authorization" => __MODULE__.ExtendedAuthorization,
          "incremental_authorization" => __MODULE__.IncrementalAuthorization,
          "installments" => __MODULE__.Installments,
          "multicapture" => __MODULE__.Multicapture,
          "network_token" => __MODULE__.NetworkToken,
          "overcapture" => __MODULE__.Overcapture,
          "three_d_secure" => __MODULE__.ThreeDSecure,
          "wallet" => __MODULE__.Wallet
        }
      end
    end

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

    defmodule Cashapp do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `buyer_id` - A unique and immutable identifier assigned by Cash App to every buyer. Max length: 5000. Nullable.
      * `cashtag` - A public identifier for buyers using Cash App. Max length: 5000. Nullable.
      * `transaction_id` - A unique and immutable identifier of payments assigned by Cash App Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              buyer_id: String.t() | nil,
              cashtag: String.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [:buyer_id, :cashtag, :transaction_id]
    end

    defmodule Eps do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank` - The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`. Possible values: `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `deutsche_bank_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, `vr_bank_braunau`. Nullable.
      * `verified_name` - Owner's verified full name. Values are verified or provided by EPS directly
      (if supported) at the time of authorization or settlement. They cannot be set or mutated.
      EPS rarely provides this information so the attribute is usually empty. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bank: String.t() | nil,
              verified_name: String.t() | nil
            }
      defstruct [:bank, :verified_name]
    end

    defmodule Fpx do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account_holder_type` - Account holder type, if provided. Can be one of `individual` or `company`. Possible values: `company`, `individual`. Nullable.
      * `bank` - The customer's bank. Can be one of `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, `pb_enterprise`, or `bank_of_china`. Possible values: `affin_bank`, `agrobank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_of_china`, `bank_rakyat`, `bsn`, `cimb`, `deutsche_bank`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2e`, `maybank2u`, `ocbc`, `pb_enterprise`, `public_bank`, `rhb`, `standard_chartered`, `uob`.
      * `transaction_id` - Unique transaction id generated by FPX for every request from the merchant Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              account_holder_type: String.t() | nil,
              bank: String.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [:account_holder_type, :bank, :transaction_id]
    end

    defmodule Giropay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
      * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
      * `bic` - Bank Identifier Code of the bank associated with the bank account. Max length: 5000. Nullable.
      * `verified_name` - Owner's verified full name. Values are verified or provided by Giropay directly
      (if supported) at the time of authorization or settlement. They cannot be set or mutated.
      Giropay rarely provides this information so the attribute is usually empty. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bank_code: String.t() | nil,
              bank_name: String.t() | nil,
              bic: String.t() | nil,
              verified_name: String.t() | nil
            }
      defstruct [:bank_code, :bank_name, :bic, :verified_name]
    end

    defmodule Grabpay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `transaction_id` - Unique transaction id generated by GrabPay Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              transaction_id: String.t() | nil
            }
      defstruct [:transaction_id]
    end

    defmodule Ideal do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              bank: String.t() | nil,
              bic: String.t() | nil,
              generated_sepa_debit: String.t() | Stripe.Resources.PaymentMethod.t() | nil,
              generated_sepa_debit_mandate: String.t() | Stripe.Resources.Mandate.t() | nil,
              iban_last4: String.t() | nil,
              transaction_id: String.t() | nil,
              verified_name: String.t() | nil
            }
      defstruct [
        :bank,
        :bic,
        :generated_sepa_debit,
        :generated_sepa_debit_mandate,
        :iban_last4,
        :transaction_id,
        :verified_name
      ]
    end

    defmodule InteracPresent do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              brand: String.t() | nil,
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
              issuer: String.t() | nil,
              last4: String.t() | nil,
              location: String.t() | nil,
              network: String.t() | nil,
              network_transaction_id: String.t() | nil,
              preferred_locales: [String.t()] | nil,
              read_method: String.t() | nil,
              reader: String.t() | nil,
              receipt: Stripe.Resources.Receipt.t() | nil
            }
      defstruct [
        :brand,
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
        :issuer,
        :last4,
        :location,
        :network,
        :network_transaction_id,
        :preferred_locales,
        :read_method,
        :reader,
        :receipt
      ]
    end

    defmodule Klarna do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `payer_details` - The payer details for this transaction. Nullable.
      * `payment_method_category` - The Klarna payment method used for this transaction.
      Can be one of `pay_later`, `pay_now`, `pay_with_financing`, or `pay_in_installments` Max length: 5000. Nullable.
      * `preferred_locale` - Preferred language of the Klarna authorization page that the customer is redirected to.
      Can be one of `de-AT`, `en-AT`, `nl-BE`, `fr-BE`, `en-BE`, `de-DE`, `en-DE`, `da-DK`, `en-DK`, `es-ES`, `en-ES`, `fi-FI`, `sv-FI`, `en-FI`, `en-GB`, `en-IE`, `it-IT`, `en-IT`, `nl-NL`, `en-NL`, `nb-NO`, `en-NO`, `sv-SE`, `en-SE`, `en-US`, `es-US`, `fr-FR`, `en-FR`, `cs-CZ`, `en-CZ`, `ro-RO`, `en-RO`, `el-GR`, `en-GR`, `en-AU`, `en-NZ`, `en-CA`, `fr-CA`, `pl-PL`, `en-PL`, `pt-PT`, `en-PT`, `de-CH`, `fr-CH`, `it-CH`, or `en-CH` Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              payer_details: __MODULE__.PayerDetails.t() | nil,
              payment_method_category: String.t() | nil,
              preferred_locale: String.t() | nil
            }
      defstruct [:payer_details, :payment_method_category, :preferred_locale]

      defmodule PayerDetails do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `address` - The payer's address Nullable.
        """
        @type t :: %__MODULE__{
                address: __MODULE__.Address.t() | nil
              }
        defstruct [:address]

        defmodule Address do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `country` - The payer address country Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  country: String.t() | nil
                }
          defstruct [:country]
        end

        def __inner_types__ do
          %{
            "address" => __MODULE__.Address
          }
        end
      end

      def __inner_types__ do
        %{
          "payer_details" => __MODULE__.PayerDetails
        }
      end
    end

    defmodule Konbini do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `store` - If the payment succeeded, this contains the details of the convenience store where the payment was completed. Nullable.
      """
      @type t :: %__MODULE__{
              store: __MODULE__.Store.t() | nil
            }
      defstruct [:store]

      defmodule Store do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `chain` - The name of the convenience store chain where the payment was completed. Possible values: `familymart`, `lawson`, `ministop`, `seicomart`. Nullable.
        """
        @type t :: %__MODULE__{
                chain: String.t() | nil
              }
        defstruct [:chain]
      end

      def __inner_types__ do
        %{
          "store" => __MODULE__.Store
        }
      end
    end

    defmodule Link do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `country` - Two-letter ISO code representing the funding source country beneath the Link payment.
      You could use this attribute to get a sense of international fees. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              country: String.t() | nil
            }
      defstruct [:country]
    end

    defmodule Mobilepay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `card` - Internal card details Nullable.
      """
      @type t :: %__MODULE__{
              card: __MODULE__.Card.t() | nil
            }
      defstruct [:card]

      defmodule Card do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `brand` - Brand of the card used in the transaction Max length: 5000. Nullable.
        * `country` - Two-letter ISO code representing the country of the card Max length: 5000. Nullable.
        * `exp_month` - Two digit number representing the card's expiration month Nullable.
        * `exp_year` - Two digit number representing the card's expiration year Nullable.
        * `last4` - The last 4 digits of the card Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                brand: String.t() | nil,
                country: String.t() | nil,
                exp_month: integer() | nil,
                exp_year: integer() | nil,
                last4: String.t() | nil
              }
        defstruct [:brand, :country, :exp_month, :exp_year, :last4]
      end

      def __inner_types__ do
        %{
          "card" => __MODULE__.Card
        }
      end
    end

    defmodule Multibanco do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `entity` - Entity number associated with this Multibanco payment. Max length: 5000. Nullable.
      * `reference` - Reference number associated with this Multibanco payment. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              entity: String.t() | nil,
              reference: String.t() | nil
            }
      defstruct [:entity, :reference]
    end

    defmodule NzBankAccount do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `account_holder_name` - The name on the bank account. Only present if the account holder name is different from the name of the authorized signatory collected in the PaymentMethod’s billing details. Max length: 5000. Nullable.
      * `bank_code` - The numeric code for the bank account's bank. Max length: 5000.
      * `bank_name` - The name of the bank. Max length: 5000.
      * `branch_code` - The numeric code for the bank account's bank branch. Max length: 5000.
      * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
      * `last4` - Last four digits of the bank account number. Max length: 5000.
      * `suffix` - The suffix of the bank account number. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              account_holder_name: String.t() | nil,
              bank_code: String.t() | nil,
              bank_name: String.t() | nil,
              branch_code: String.t() | nil,
              expected_debit_date: String.t() | nil,
              last4: String.t() | nil,
              suffix: String.t() | nil
            }
      defstruct [
        :account_holder_name,
        :bank_code,
        :bank_name,
        :branch_code,
        :expected_debit_date,
        :last4,
        :suffix
      ]
    end

    defmodule Oxxo do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `number` - OXXO reference number Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              number: String.t() | nil
            }
      defstruct [:number]
    end

    defmodule P24 do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank` - The customer's bank. Can be one of `ing`, `citi_handlowy`, `tmobile_usbugi_bankowe`, `plus_bank`, `etransfer_pocztowy24`, `banki_spbdzielcze`, `bank_nowy_bfg_sa`, `getin_bank`, `velobank`, `blik`, `noble_pay`, `ideabank`, `envelobank`, `santander_przelew24`, `nest_przelew`, `mbank_mtransfer`, `inteligo`, `pbac_z_ipko`, `bnp_paribas`, `credit_agricole`, `toyota_bank`, `bank_pekao_sa`, `volkswagen_bank`, `bank_millennium`, `alior_bank`, or `boz`. Possible values: `alior_bank`, `bank_millennium`, `bank_nowy_bfg_sa`, `bank_pekao_sa`, `banki_spbdzielcze`, `blik`, `bnp_paribas`, `boz`, `citi_handlowy`, `credit_agricole`, `envelobank`, `etransfer_pocztowy24`, `getin_bank`, `ideabank`, `ing`, `inteligo`, `mbank_mtransfer`, `nest_przelew`, `noble_pay`, `pbac_z_ipko`, `plus_bank`, `santander_przelew24`, `tmobile_usbugi_bankowe`, `toyota_bank`, `velobank`, `volkswagen_bank`. Nullable.
      * `reference` - Unique reference for this Przelewy24 payment. Max length: 5000. Nullable.
      * `verified_name` - Owner's verified full name. Values are verified or provided by Przelewy24 directly
      (if supported) at the time of authorization or settlement. They cannot be set or mutated.
      Przelewy24 rarely provides this information so the attribute is usually empty. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bank: String.t() | nil,
              reference: String.t() | nil,
              verified_name: String.t() | nil
            }
      defstruct [:bank, :reference, :verified_name]
    end

    defmodule Paynow do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `location` - ID of the [location](https://docs.stripe.com/api/terminal/locations) that this transaction's reader is assigned to. Max length: 5000.
      * `reader` - ID of the [reader](https://docs.stripe.com/api/terminal/readers) this transaction was made on. Max length: 5000.
      * `reference` - Reference number associated with this PayNow payment Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              location: String.t() | nil,
              reader: String.t() | nil,
              reference: String.t() | nil
            }
      defstruct [:location, :reader, :reference]
    end

    defmodule Paypal do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              country: String.t() | nil,
              payer_email: String.t() | nil,
              payer_id: String.t() | nil,
              payer_name: String.t() | nil,
              seller_protection: __MODULE__.SellerProtection.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [
        :country,
        :payer_email,
        :payer_id,
        :payer_name,
        :seller_protection,
        :transaction_id
      ]

      defmodule SellerProtection do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `dispute_categories` - An array of conditions that are covered for the transaction, if applicable. Nullable.
        * `status` - Indicates whether the transaction is eligible for PayPal's seller protection. Possible values: `eligible`, `not_eligible`, `partially_eligible`.
        """
        @type t :: %__MODULE__{
                dispute_categories: [String.t()] | nil,
                status: String.t() | nil
              }
        defstruct [:dispute_categories, :status]
      end

      def __inner_types__ do
        %{
          "seller_protection" => __MODULE__.SellerProtection
        }
      end
    end

    defmodule Payto do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bsb_number` - Bank-State-Branch number of the bank account. Max length: 5000. Nullable.
      * `last4` - Last four digits of the bank account number. Max length: 5000. Nullable.
      * `mandate` - ID of the mandate used to make this payment. Max length: 5000.
      * `pay_id` - The PayID alias for the bank account. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bsb_number: String.t() | nil,
              last4: String.t() | nil,
              mandate: String.t() | nil,
              pay_id: String.t() | nil
            }
      defstruct [:bsb_number, :last4, :mandate, :pay_id]
    end

    defmodule Pix do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_transaction_id` - Unique transaction id generated by BCB Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bank_transaction_id: String.t() | nil
            }
      defstruct [:bank_transaction_id]
    end

    defmodule Promptpay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `reference` - Bill reference generated by PromptPay Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              reference: String.t() | nil
            }
      defstruct [:reference]
    end

    defmodule RevolutPay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `funding`
      * `transaction_id` - The Revolut Pay transaction ID associated with this payment. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              funding: __MODULE__.Funding.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [:funding, :transaction_id]

      defmodule Funding do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `card`
        * `type` - funding type of the underlying payment method. Possible values: `card`. Nullable.
        """
        @type t :: %__MODULE__{
                card: __MODULE__.Card.t() | nil,
                type: String.t() | nil
              }
        defstruct [:card, :type]

        defmodule Card do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000. Nullable.
          * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
          * `exp_month` - Two-digit number representing the card's expiration month. Nullable.
          * `exp_year` - Four-digit number representing the card's expiration year. Nullable.
          * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
          * `last4` - The last four digits of the card. Max length: 5000. Nullable.
          """
          @type t :: %__MODULE__{
                  brand: String.t() | nil,
                  country: String.t() | nil,
                  exp_month: integer() | nil,
                  exp_year: integer() | nil,
                  funding: String.t() | nil,
                  last4: String.t() | nil
                }
          defstruct [:brand, :country, :exp_month, :exp_year, :funding, :last4]
        end

        def __inner_types__ do
          %{
            "card" => __MODULE__.Card
          }
        end
      end

      def __inner_types__ do
        %{
          "funding" => __MODULE__.Funding
        }
      end
    end

    defmodule Satispay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `transaction_id` - The Satispay transaction ID associated with this payment. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              transaction_id: String.t() | nil
            }
      defstruct [:transaction_id]
    end

    defmodule SepaCreditTransfer do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
      * `bic` - Bank Identifier Code of the bank associated with the bank account. Max length: 5000. Nullable.
      * `iban` - IBAN of the bank account to transfer funds to. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bank_name: String.t() | nil,
              bic: String.t() | nil,
              iban: String.t() | nil
            }
      defstruct [:bank_name, :bic, :iban]
    end

    defmodule SepaDebit do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
      * `branch_code` - Branch code of bank associated with the bank account. Max length: 5000. Nullable.
      * `country` - Two-letter ISO code representing the country the bank account is located in. Max length: 5000. Nullable.
      * `expected_debit_date` - Estimated date to debit the customer's bank account. A date string in YYYY-MM-DD format. Max length: 5000.
      * `fingerprint` - Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same. Max length: 5000. Nullable.
      * `last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
      * `mandate` - Find the ID of the mandate used for this payment under the [payment_method_details.sepa_debit.mandate](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-sepa_debit-mandate) property on the Charge. Use this mandate ID to [retrieve the Mandate](https://docs.stripe.com/api/mandates/retrieve). Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bank_code: String.t() | nil,
              branch_code: String.t() | nil,
              country: String.t() | nil,
              expected_debit_date: String.t() | nil,
              fingerprint: String.t() | nil,
              last4: String.t() | nil,
              mandate: String.t() | nil
            }
      defstruct [
        :bank_code,
        :branch_code,
        :country,
        :expected_debit_date,
        :fingerprint,
        :last4,
        :mandate
      ]
    end

    defmodule Sofort do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              bank_code: String.t() | nil,
              bank_name: String.t() | nil,
              bic: String.t() | nil,
              country: String.t() | nil,
              generated_sepa_debit: String.t() | Stripe.Resources.PaymentMethod.t() | nil,
              generated_sepa_debit_mandate: String.t() | Stripe.Resources.Mandate.t() | nil,
              iban_last4: String.t() | nil,
              preferred_language: String.t() | nil,
              verified_name: String.t() | nil
            }
      defstruct [
        :bank_code,
        :bank_name,
        :bic,
        :country,
        :generated_sepa_debit,
        :generated_sepa_debit_mandate,
        :iban_last4,
        :preferred_language,
        :verified_name
      ]
    end

    defmodule Swish do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fingerprint` - Uniquely identifies the payer's Swish account. You can use this attribute to check whether two Swish transactions were paid for by the same payer Max length: 5000. Nullable.
      * `payment_reference` - Payer bank reference number for the payment Max length: 5000. Nullable.
      * `verified_phone_last4` - The last four digits of the Swish account phone number Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              fingerprint: String.t() | nil,
              payment_reference: String.t() | nil,
              verified_phone_last4: String.t() | nil
            }
      defstruct [:fingerprint, :payment_reference, :verified_phone_last4]
    end

    defmodule Upi do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `vpa` - Customer's unique Virtual Payment Address. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              vpa: String.t() | nil
            }
      defstruct [:vpa]
    end

    defmodule UsBankAccount do
      @moduledoc "Nested struct within the parent resource."

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
      @type t :: %__MODULE__{
              account_holder_type: String.t() | nil,
              account_type: String.t() | nil,
              bank_name: String.t() | nil,
              expected_debit_date: String.t() | nil,
              fingerprint: String.t() | nil,
              last4: String.t() | nil,
              mandate: String.t() | Stripe.Resources.Mandate.t() | nil,
              payment_reference: String.t() | nil,
              routing_number: String.t() | nil
            }
      defstruct [
        :account_holder_type,
        :account_type,
        :bank_name,
        :expected_debit_date,
        :fingerprint,
        :last4,
        :mandate,
        :payment_reference,
        :routing_number
      ]
    end

    defmodule WechatPay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fingerprint` - Uniquely identifies this particular WeChat Pay account. You can use this attribute to check whether two WeChat accounts are the same. Max length: 5000. Nullable.
      * `location` - ID of the [location](https://docs.stripe.com/api/terminal/locations) that this transaction's reader is assigned to. Max length: 5000.
      * `reader` - ID of the [reader](https://docs.stripe.com/api/terminal/readers) this transaction was made on. Max length: 5000.
      * `transaction_id` - Transaction ID of this particular WeChat Pay transaction. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              fingerprint: String.t() | nil,
              location: String.t() | nil,
              reader: String.t() | nil,
              transaction_id: String.t() | nil
            }
      defstruct [:fingerprint, :location, :reader, :transaction_id]
    end

    def __inner_types__ do
      %{
        "ach_credit_transfer" => __MODULE__.AchCreditTransfer,
        "ach_debit" => __MODULE__.AchDebit,
        "acss_debit" => __MODULE__.AcssDebit,
        "affirm" => __MODULE__.Affirm,
        "afterpay_clearpay" => __MODULE__.AfterpayClearpay,
        "alipay" => __MODULE__.Alipay,
        "alma" => __MODULE__.Alma,
        "amazon_pay" => __MODULE__.AmazonPay,
        "au_becs_debit" => __MODULE__.AuBecsDebit,
        "bacs_debit" => __MODULE__.BacsDebit,
        "bancontact" => __MODULE__.Bancontact,
        "billie" => __MODULE__.Billie,
        "blik" => __MODULE__.Blik,
        "boleto" => __MODULE__.Boleto,
        "card" => __MODULE__.Card,
        "card_present" => __MODULE__.CardPresent,
        "cashapp" => __MODULE__.Cashapp,
        "eps" => __MODULE__.Eps,
        "fpx" => __MODULE__.Fpx,
        "giropay" => __MODULE__.Giropay,
        "grabpay" => __MODULE__.Grabpay,
        "ideal" => __MODULE__.Ideal,
        "interac_present" => __MODULE__.InteracPresent,
        "klarna" => __MODULE__.Klarna,
        "konbini" => __MODULE__.Konbini,
        "link" => __MODULE__.Link,
        "mobilepay" => __MODULE__.Mobilepay,
        "multibanco" => __MODULE__.Multibanco,
        "nz_bank_account" => __MODULE__.NzBankAccount,
        "oxxo" => __MODULE__.Oxxo,
        "p24" => __MODULE__.P24,
        "paynow" => __MODULE__.Paynow,
        "paypal" => __MODULE__.Paypal,
        "payto" => __MODULE__.Payto,
        "pix" => __MODULE__.Pix,
        "promptpay" => __MODULE__.Promptpay,
        "revolut_pay" => __MODULE__.RevolutPay,
        "satispay" => __MODULE__.Satispay,
        "sepa_credit_transfer" => __MODULE__.SepaCreditTransfer,
        "sepa_debit" => __MODULE__.SepaDebit,
        "sofort" => __MODULE__.Sofort,
        "swish" => __MODULE__.Swish,
        "upi" => __MODULE__.Upi,
        "us_bank_account" => __MODULE__.UsBankAccount,
        "wechat_pay" => __MODULE__.WechatPay
      }
    end
  end

  defmodule PresentmentDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `presentment_amount` - Amount intended to be collected by this payment, denominated in `presentment_currency`.
    * `presentment_currency` - Currency presented to the customer during payment. Max length: 5000.
    """
    @type t :: %__MODULE__{
            presentment_amount: integer() | nil,
            presentment_currency: String.t() | nil
          }
    defstruct [:presentment_amount, :presentment_currency]
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

  defmodule Refunds do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.Refund.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  defmodule TransferData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount transferred to the destination account, if specified. By default, the entire charge amount is transferred to the destination account. Nullable.
    * `destination` - ID of an existing, connected Stripe account to transfer funds to if `transfer_data` was specified in the charge request.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            destination: String.t() | Stripe.Resources.Account.t() | nil
          }
    defstruct [:amount, :destination]
  end

  def __inner_types__ do
    %{
      "billing_details" => __MODULE__.BillingDetails,
      "fraud_details" => __MODULE__.FraudDetails,
      "level3" => __MODULE__.Level3,
      "outcome" => __MODULE__.Outcome,
      "payment_method_details" => __MODULE__.PaymentMethodDetails,
      "presentment_details" => __MODULE__.PresentmentDetails,
      "radar_options" => __MODULE__.RadarOptions,
      "refunds" => __MODULE__.Refunds,
      "shipping" => Stripe.Resources.ShippingDetails,
      "source" => Stripe.Resources.PaymentSource,
      "transfer_data" => __MODULE__.TransferData
    }
  end
end
