# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentIntentCreateParams do
  @moduledoc "Parameters for payment intent create."

  @typedoc """
  * `amount` - Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://docs.stripe.com/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
  * `amount_details` - Provides industry-specific information about the amount.
  * `application_fee_amount` - The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total amount captured. For more information, see the PaymentIntents [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `automatic_payment_methods` - When you enable this parameter, this PaymentIntent accepts payment methods that you enable in the Dashboard and that are compatible with this PaymentIntent's other parameters.
  * `capture_method` - Controls when the funds will be captured from the customer's account. Possible values: `automatic`, `automatic_async`, `manual`.
  * `confirm` - Set to `true` to attempt to [confirm this PaymentIntent](https://docs.stripe.com/api/payment_intents/confirm) immediately. This parameter defaults to `false`. When creating and confirming a PaymentIntent at the same time, you can also provide the parameters available in the [Confirm API](https://docs.stripe.com/api/payment_intents/confirm).
  * `confirmation_method` - Describes whether we can confirm this PaymentIntent automatically, or if it requires customer action to confirm the payment. Possible values: `automatic`, `manual`.
  * `confirmation_token` - ID of the ConfirmationToken used to confirm this PaymentIntent.

  If the provided ConfirmationToken contains properties that are also being provided in this request, such as `payment_method`, then the values in this request will take precedence. Max length: 5000.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - ID of the Customer this PaymentIntent belongs to, if one exists.

  Payment methods attached to other Customers cannot be used with this PaymentIntent.

  If [setup_future_usage](https://api.stripe.com#payment_intent_object-setup_future_usage) is set and this PaymentIntent's payment method is not `card_present`, then the payment method attaches to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete. If the payment method is `card_present` and isn't a digital wallet, then a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card is created and attached to the Customer instead. Max length: 5000.
  * `customer_account` - ID of the Account representing the customer that this PaymentIntent belongs to, if one exists.

  Payment methods attached to other Accounts cannot be used with this PaymentIntent.

  If [setup_future_usage](https://api.stripe.com#payment_intent_object-setup_future_usage) is set and this PaymentIntent's payment method is not `card_present`, then the payment method attaches to the Account after the PaymentIntent has been confirmed and any required actions from the user are complete. If the payment method is `card_present` and isn't a digital wallet, then a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card is created and attached to the Account instead. Max length: 5000.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 1000.
  * `error_on_requires_action` - Set to `true` to fail the payment attempt if the PaymentIntent transitions into `requires_action`. Use this parameter for simpler integrations that don't handle customer actions, such as [saving cards without authentication](https://docs.stripe.com/payments/save-card-without-authentication). This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm).
  * `excluded_payment_method_types` - The list of payment method types to exclude from use with this payment.
  * `expand` - Specifies which fields in the response should be expanded.
  * `hooks` - Automations to be run during the PaymentIntent lifecycle
  * `mandate` - ID of the mandate that's used for this payment. This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm). Max length: 5000.
  * `mandate_data` - This hash contains details about the Mandate to create. This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm).
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `off_session` - Set to `true` to indicate that the customer isn't in your checkout flow during this payment attempt and can't authenticate. Use this parameter in scenarios where you collect card details and [charge them later](https://docs.stripe.com/payments/cards/charging-saved-cards). This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm).
  * `on_behalf_of` - The Stripe account ID that these funds are intended for. Learn more about the [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `payment_details` - Provides industry-specific information about the charge.
  * `payment_method` - ID of the payment method (a PaymentMethod, Card, or [compatible Source](https://docs.stripe.com/payments/payment-methods#compatibility) object) to attach to this PaymentIntent.

  If you don't provide the `payment_method` parameter or the `source` parameter with `confirm=true`, `source` automatically populates with `customer.default_source` to improve migration for users of the Charges API. We recommend that you explicitly provide the `payment_method` moving forward.
  If the payment method is attached to a Customer, you must also provide the ID of that Customer as the [customer](https://api.stripe.com#create_payment_intent-customer) parameter of this PaymentIntent.
  end Max length: 5000.
  * `payment_method_configuration` - The ID of the [payment method configuration](https://docs.stripe.com/api/payment_method_configurations) to use with this PaymentIntent. Max length: 100.
  * `payment_method_data` - If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will appear
  in the [payment_method](https://docs.stripe.com/api/payment_intents/object#payment_intent_object-payment_method)
  property on the PaymentIntent.
  * `payment_method_options` - Payment method-specific configuration for this PaymentIntent.
  * `payment_method_types` - The list of payment method types (for example, a card) that this PaymentIntent can use. If you don't provide this, Stripe will dynamically show relevant payment methods from your [payment method settings](https://dashboard.stripe.com/settings/payment_methods). A list of valid payment method types can be found [here](https://docs.stripe.com/api/payment_methods/object#payment_method_object-type).
  * `radar_options` - Options to configure Radar. Learn more about [Radar Sessions](https://docs.stripe.com/radar/radar-session).
  * `receipt_email` - Email address to send the receipt to. If you specify `receipt_email` for a payment in live mode, you send a receipt regardless of your [email settings](https://dashboard.stripe.com/account/emails).
  * `return_url` - The URL to redirect your customer back to after they authenticate or cancel their payment on the payment method's app or site. If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme. This parameter can only be used with [`confirm=true`](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-confirm).
  * `setup_future_usage` - Indicates that you intend to make future payments with this PaymentIntent's payment method.

  If you provide a Customer with the PaymentIntent, you can use this parameter to [attach the payment method](https://stripe.com/payments/save-during-payment) to the Customer after the PaymentIntent is confirmed and the customer completes any required actions. If you don't provide a Customer, you can still [attach](https://docs.stripe.com/api/payment_methods/attach) the payment method to a Customer after the transaction completes.

  If the payment method is `card_present` and isn't a digital wallet, Stripe creates and attaches a [generated_card](https://docs.stripe.com/api/charges/object#charge_object-payment_method_details-card_present-generated_card) payment method representing the card to the Customer instead.

  When processing card payments, Stripe uses `setup_future_usage` to help you comply with regional legislation and network rules, such as [SCA](https://stripe.com/strong-customer-authentication). Possible values: `off_session`, `on_session`.
  * `shipping` - Shipping information for this PaymentIntent.
  * `statement_descriptor` - Text that appears on the customer's statement as the statement descriptor for a non-card charge. This value overrides the account's default statement descriptor. For information about requirements, including the 22-character limit, see [the Statement Descriptor docs](https://docs.stripe.com/get-started/account/statement-descriptors).

  Setting this value for a card charge returns an error. For card charges, set the [statement_descriptor_suffix](https://docs.stripe.com/get-started/account/statement-descriptors#dynamic) instead. Max length: 22.
  * `statement_descriptor_suffix` - Provides information about a card charge. Concatenated to the account's [statement descriptor prefix](https://docs.stripe.com/get-started/account/statement-descriptors#static) to form the complete statement descriptor that appears on the customer's statement. Max length: 22.
  * `transfer_data` - The parameters that you can use to automatically create a Transfer.
  Learn more about the [use case for connected accounts](https://docs.stripe.com/payments/connected-accounts).
  * `transfer_group` - A string that identifies the resulting payment as part of a group. Learn more about the [use case for connected accounts](https://docs.stripe.com/connect/separate-charges-and-transfers).
  * `use_stripe_sdk` - Set to `true` when confirming server-side and using Stripe.js, iOS, or Android client-side SDKs to handle the next actions.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_details: __MODULE__.AmountDetails.t() | nil,
          application_fee_amount: integer() | nil,
          automatic_payment_methods: __MODULE__.AutomaticPaymentMethods.t() | nil,
          capture_method: String.t() | nil,
          confirm: boolean() | nil,
          confirmation_method: String.t() | nil,
          confirmation_token: String.t() | nil,
          currency: String.t(),
          customer: String.t() | nil,
          customer_account: String.t() | nil,
          description: String.t() | nil,
          error_on_requires_action: boolean() | nil,
          excluded_payment_method_types: [String.t()] | nil,
          expand: [String.t()] | nil,
          hooks: __MODULE__.Hooks.t() | nil,
          mandate: String.t() | nil,
          mandate_data: map() | nil,
          metadata: %{String.t() => String.t()} | nil,
          off_session: map() | nil,
          on_behalf_of: String.t() | nil,
          payment_details: __MODULE__.PaymentDetails.t() | nil,
          payment_method: String.t() | nil,
          payment_method_configuration: String.t() | nil,
          payment_method_data: __MODULE__.PaymentMethodData.t() | nil,
          payment_method_options: __MODULE__.PaymentMethodOptions.t() | nil,
          payment_method_types: [String.t()] | nil,
          radar_options: __MODULE__.RadarOptions.t() | nil,
          receipt_email: String.t() | nil,
          return_url: String.t() | nil,
          setup_future_usage: String.t() | nil,
          shipping: __MODULE__.Shipping.t() | nil,
          statement_descriptor: String.t() | nil,
          statement_descriptor_suffix: String.t() | nil,
          transfer_data: __MODULE__.TransferData.t() | nil,
          transfer_group: String.t() | nil,
          use_stripe_sdk: boolean() | nil
        }

  defstruct [
    :amount,
    :amount_details,
    :application_fee_amount,
    :automatic_payment_methods,
    :capture_method,
    :confirm,
    :confirmation_method,
    :confirmation_token,
    :currency,
    :customer,
    :customer_account,
    :description,
    :error_on_requires_action,
    :excluded_payment_method_types,
    :expand,
    :hooks,
    :mandate,
    :mandate_data,
    :metadata,
    :off_session,
    :on_behalf_of,
    :payment_details,
    :payment_method,
    :payment_method_configuration,
    :payment_method_data,
    :payment_method_options,
    :payment_method_types,
    :radar_options,
    :receipt_email,
    :return_url,
    :setup_future_usage,
    :shipping,
    :statement_descriptor,
    :statement_descriptor_suffix,
    :transfer_data,
    :transfer_group,
    :use_stripe_sdk
  ]

  defmodule AmountDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `discount_amount` - The total discount applied on the transaction represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). An integer greater than 0.

    This field is mutually exclusive with the `amount_details[line_items][#][discount_amount]` field.
    * `enforce_arithmetic_validation` - Set to `false` to return arithmetic validation errors in the response without failing the request. Use this when you want the operation to proceed regardless of arithmetic errors in the line item data.

    Omit or set to `true` to immediately return a 400 error when arithmetic validation fails. Use this for strict validation that prevents processing with line item data that has arithmetic inconsistencies.

    For card payments, Stripe doesn't send line item data if there's an arithmetic validation error to card networks.
    * `line_items` - A list of line items, each containing information about a product in the PaymentIntent. There is a maximum of 200 line items.
    * `shipping` - Contains information about the shipping portion of the amount.
    * `tax` - Contains information about the tax portion of the amount.
    """
    @type t :: %__MODULE__{
            discount_amount: map() | nil,
            enforce_arithmetic_validation: boolean() | nil,
            line_items: map() | nil,
            shipping: map() | nil,
            tax: map() | nil
          }
    defstruct [:discount_amount, :enforce_arithmetic_validation, :line_items, :shipping, :tax]
  end

  defmodule AutomaticPaymentMethods do
    @moduledoc "Nested parameters."

    @typedoc """
    * `allow_redirects` - Controls whether this PaymentIntent will accept redirect-based payment methods.

    Redirect-based payment methods may require your customer to be redirected to a payment method's app or site for authentication or additional steps. To [confirm](https://docs.stripe.com/api/payment_intents/confirm) this PaymentIntent, you may be required to provide a `return_url` to redirect customers back to your site after they authenticate or complete the payment. Possible values: `always`, `never`.
    * `enabled` - Whether this feature is enabled.
    """
    @type t :: %__MODULE__{
            allow_redirects: String.t() | nil,
            enabled: boolean() | nil
          }
    defstruct [:allow_redirects, :enabled]
  end

  defmodule Hooks do
    @moduledoc "Nested parameters."

    @typedoc """
    * `inputs` - Arguments passed in automations
    """
    @type t :: %__MODULE__{
            inputs: __MODULE__.Inputs.t() | nil
          }
    defstruct [:inputs]

    defmodule Inputs do
      @moduledoc "Nested parameters."

      @typedoc """
      * `tax` - Tax arguments for automations
      """
      @type t :: %__MODULE__{
              tax: __MODULE__.Tax.t() | nil
            }
      defstruct [:tax]

      defmodule Tax do
        @moduledoc "Nested parameters."

        @typedoc """
        * `calculation` - The [TaxCalculation](https://docs.stripe.com/api/tax/calculations) id
        """
        @type t :: %__MODULE__{
                calculation: map() | nil
              }
        defstruct [:calculation]
      end
    end
  end

  defmodule PaymentDetails do
    @moduledoc "Nested parameters."

    @typedoc """
    * `customer_reference` - A unique value to identify the customer. This field is available only for card payments.

    This field is truncated to 25 alphanumeric characters, excluding spaces, before being sent to card networks.
    * `order_reference` - A unique value assigned by the business to identify the transaction. Required for L2 and L3 rates.

    Required when the Payment Method Types array contains `card`, including when [automatic_payment_methods.enabled](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-automatic_payment_methods-enabled) is set to `true`.

    For Cards, this field is truncated to 25 alphanumeric characters, excluding spaces, before being sent to card networks. For Klarna, this field is truncated to 255 characters and is visible to customers when they view the order in the Klarna app.
    """
    @type t :: %__MODULE__{
            customer_reference: map() | nil,
            order_reference: map() | nil
          }
    defstruct [:customer_reference, :order_reference]
  end

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
    * `acss_debit` - If this is a `acss_debit` PaymentMethod, this sub-hash contains details about the ACSS Debit payment method options.
    * `affirm` - If this is an `affirm` PaymentMethod, this sub-hash contains details about the Affirm payment method options.
    * `afterpay_clearpay` - If this is a `afterpay_clearpay` PaymentMethod, this sub-hash contains details about the Afterpay Clearpay payment method options.
    * `alipay` - If this is a `alipay` PaymentMethod, this sub-hash contains details about the Alipay payment method options.
    * `alma` - If this is a `alma` PaymentMethod, this sub-hash contains details about the Alma payment method options.
    * `amazon_pay` - If this is a `amazon_pay` PaymentMethod, this sub-hash contains details about the Amazon Pay payment method options.
    * `au_becs_debit` - If this is a `au_becs_debit` PaymentMethod, this sub-hash contains details about the AU BECS Direct Debit payment method options.
    * `bacs_debit` - If this is a `bacs_debit` PaymentMethod, this sub-hash contains details about the BACS Debit payment method options.
    * `bancontact` - If this is a `bancontact` PaymentMethod, this sub-hash contains details about the Bancontact payment method options.
    * `billie` - If this is a `billie` PaymentMethod, this sub-hash contains details about the Billie payment method options.
    * `blik` - If this is a `blik` PaymentMethod, this sub-hash contains details about the BLIK payment method options.
    * `boleto` - If this is a `boleto` PaymentMethod, this sub-hash contains details about the Boleto payment method options.
    * `card` - Configuration for any card payments attempted on this PaymentIntent.
    * `card_present` - If this is a `card_present` PaymentMethod, this sub-hash contains details about the Card Present payment method options.
    * `cashapp` - If this is a `cashapp` PaymentMethod, this sub-hash contains details about the Cash App Pay payment method options.
    * `crypto` - If this is a `crypto` PaymentMethod, this sub-hash contains details about the Crypto payment method options.
    * `customer_balance` - If this is a `customer balance` PaymentMethod, this sub-hash contains details about the customer balance payment method options.
    * `eps` - If this is a `eps` PaymentMethod, this sub-hash contains details about the EPS payment method options.
    * `fpx` - If this is a `fpx` PaymentMethod, this sub-hash contains details about the FPX payment method options.
    * `giropay` - If this is a `giropay` PaymentMethod, this sub-hash contains details about the Giropay payment method options.
    * `grabpay` - If this is a `grabpay` PaymentMethod, this sub-hash contains details about the Grabpay payment method options.
    * `ideal` - If this is a `ideal` PaymentMethod, this sub-hash contains details about the Ideal payment method options.
    * `interac_present` - If this is a `interac_present` PaymentMethod, this sub-hash contains details about the Card Present payment method options.
    * `kakao_pay` - If this is a `kakao_pay` PaymentMethod, this sub-hash contains details about the Kakao Pay payment method options.
    * `klarna` - If this is a `klarna` PaymentMethod, this sub-hash contains details about the Klarna payment method options.
    * `konbini` - If this is a `konbini` PaymentMethod, this sub-hash contains details about the Konbini payment method options.
    * `kr_card` - If this is a `kr_card` PaymentMethod, this sub-hash contains details about the KR Card payment method options.
    * `link` - If this is a `link` PaymentMethod, this sub-hash contains details about the Link payment method options.
    * `mb_way` - If this is a `mb_way` PaymentMethod, this sub-hash contains details about the MB WAY payment method options.
    * `mobilepay` - If this is a `MobilePay` PaymentMethod, this sub-hash contains details about the MobilePay payment method options.
    * `multibanco` - If this is a `multibanco` PaymentMethod, this sub-hash contains details about the Multibanco payment method options.
    * `naver_pay` - If this is a `naver_pay` PaymentMethod, this sub-hash contains details about the Naver Pay payment method options.
    * `nz_bank_account` - If this is a `nz_bank_account` PaymentMethod, this sub-hash contains details about the NZ BECS Direct Debit payment method options.
    * `oxxo` - If this is a `oxxo` PaymentMethod, this sub-hash contains details about the OXXO payment method options.
    * `p24` - If this is a `p24` PaymentMethod, this sub-hash contains details about the Przelewy24 payment method options.
    * `pay_by_bank` - If this is a `pay_by_bank` PaymentMethod, this sub-hash contains details about the PayByBank payment method options.
    * `payco` - If this is a `payco` PaymentMethod, this sub-hash contains details about the PAYCO payment method options.
    * `paynow` - If this is a `paynow` PaymentMethod, this sub-hash contains details about the PayNow payment method options.
    * `paypal` - If this is a `paypal` PaymentMethod, this sub-hash contains details about the PayPal payment method options.
    * `payto` - If this is a `payto` PaymentMethod, this sub-hash contains details about the PayTo payment method options.
    * `pix` - If this is a `pix` PaymentMethod, this sub-hash contains details about the Pix payment method options.
    * `promptpay` - If this is a `promptpay` PaymentMethod, this sub-hash contains details about the PromptPay payment method options.
    * `revolut_pay` - If this is a `revolut_pay` PaymentMethod, this sub-hash contains details about the Revolut Pay payment method options.
    * `samsung_pay` - If this is a `samsung_pay` PaymentMethod, this sub-hash contains details about the Samsung Pay payment method options.
    * `satispay` - If this is a `satispay` PaymentMethod, this sub-hash contains details about the Satispay payment method options.
    * `sepa_debit` - If this is a `sepa_debit` PaymentIntent, this sub-hash contains details about the SEPA Debit payment method options.
    * `sofort` - If this is a `sofort` PaymentMethod, this sub-hash contains details about the SOFORT payment method options.
    * `swish` - If this is a `Swish` PaymentMethod, this sub-hash contains details about the Swish payment method options.
    * `twint` - If this is a `twint` PaymentMethod, this sub-hash contains details about the TWINT payment method options.
    * `us_bank_account` - If this is a `us_bank_account` PaymentMethod, this sub-hash contains details about the US bank account payment method options.
    * `wechat_pay` - If this is a `wechat_pay` PaymentMethod, this sub-hash contains details about the WeChat Pay payment method options.
    * `zip` - If this is a `zip` PaymentMethod, this sub-hash contains details about the Zip payment method options.
    """
    @type t :: %__MODULE__{
            acss_debit: map() | nil,
            affirm: map() | nil,
            afterpay_clearpay: map() | nil,
            alipay: map() | nil,
            alma: map() | nil,
            amazon_pay: map() | nil,
            au_becs_debit: map() | nil,
            bacs_debit: map() | nil,
            bancontact: map() | nil,
            billie: map() | nil,
            blik: map() | nil,
            boleto: map() | nil,
            card: map() | nil,
            card_present: map() | nil,
            cashapp: map() | nil,
            crypto: map() | nil,
            customer_balance: map() | nil,
            eps: map() | nil,
            fpx: map() | nil,
            giropay: map() | nil,
            grabpay: map() | nil,
            ideal: map() | nil,
            interac_present: map() | nil,
            kakao_pay: map() | nil,
            klarna: map() | nil,
            konbini: map() | nil,
            kr_card: map() | nil,
            link: map() | nil,
            mb_way: map() | nil,
            mobilepay: map() | nil,
            multibanco: map() | nil,
            naver_pay: map() | nil,
            nz_bank_account: map() | nil,
            oxxo: map() | nil,
            p24: map() | nil,
            pay_by_bank: map() | nil,
            payco: map() | nil,
            paynow: map() | nil,
            paypal: map() | nil,
            payto: map() | nil,
            pix: map() | nil,
            promptpay: map() | nil,
            revolut_pay: map() | nil,
            samsung_pay: map() | nil,
            satispay: map() | nil,
            sepa_debit: map() | nil,
            sofort: map() | nil,
            swish: map() | nil,
            twint: map() | nil,
            us_bank_account: map() | nil,
            wechat_pay: map() | nil,
            zip: map() | nil
          }
    defstruct [
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
      :sepa_debit,
      :sofort,
      :swish,
      :twint,
      :us_bank_account,
      :wechat_pay,
      :zip
    ]
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

  defmodule Shipping do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - Shipping address.
    * `carrier` - The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. Max length: 5000.
    * `name` - Recipient name. Max length: 5000.
    * `phone` - Recipient phone (including extension). Max length: 5000.
    * `tracking_number` - The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas. Max length: 5000.
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            carrier: String.t() | nil,
            name: String.t() | nil,
            phone: String.t() | nil,
            tracking_number: String.t() | nil
          }
    defstruct [:address, :carrier, :name, :phone, :tracking_number]

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

  defmodule TransferData do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount` - The amount that will be transferred automatically when a charge succeeds.
    The amount is capped at the total transaction amount and if no amount is set,
    the full amount is transferred.

    If you intend to collect a fee and you need a more robust reporting experience, using
    [application_fee_amount](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-application_fee_amount)
    might be a better fit for your integration.
    * `destination` - If specified, successful charges will be attributed to the destination
    account for tax reporting, and the funds from charges will be transferred
    to the destination account. The ID of the resulting transfer will be
    returned on the successful charge's `transfer` field.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            destination: String.t() | nil
          }
    defstruct [:amount, :destination]
  end
end
