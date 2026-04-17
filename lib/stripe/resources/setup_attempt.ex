# File generated from our OpenAPI spec
defmodule Stripe.Resources.SetupAttempt do
  @moduledoc """
  PaymentFlowsSetupIntentSetupAttempt

  A SetupAttempt describes one attempted confirmation of a SetupIntent,
  whether that confirmation is successful or unsuccessful. You can use
  SetupAttempts to inspect details of a specific attempt at setting up a
  payment method using a SetupIntent.
  """

  @typedoc """
  * `application` - The value of [application](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-application) on the SetupIntent at the time of this confirmation. Nullable. Expandable.
  * `attach_to_self` - If present, the SetupIntent's payment method will be attached to the in-context Stripe Account.

  It can only be used for this Stripe Account’s own money movement flows like InboundTransfer and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a Customer, and defaults to false when attaching a PaymentMethod to a Customer.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer` - The value of [customer](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-customer) on the SetupIntent at the time of this confirmation. Nullable. Expandable.
  * `customer_account` - The value of [customer_account](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-customer_account) on the SetupIntent at the time of this confirmation. Max length: 5000. Nullable.
  * `flow_directions` - Indicates the directions of money movement for which this payment method is intended to be used.

  Include `inbound` if you intend to use the payment method as the origin to pull funds from. Include `outbound` if you intend to use the payment method as the destination to send funds to. You can include both if you intend to use the payment method for both purposes. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `setup_attempt`.
  * `on_behalf_of` - The value of [on_behalf_of](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-on_behalf_of) on the SetupIntent at the time of this confirmation. Nullable. Expandable.
  * `payment_method` - ID of the payment method used with this SetupAttempt. Expandable.
  * `payment_method_details` - Expandable.
  * `setup_error` - The error encountered during this attempt to confirm the SetupIntent, if any. Nullable. Expandable.
  * `setup_intent` - ID of the SetupIntent that this attempt belongs to. Expandable.
  * `status` - Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`, `succeeded`, `failed`, or `abandoned`. Max length: 5000.
  * `usage` - The value of [usage](https://docs.stripe.com/api/setup_intents/object#setup_intent_object-usage) on the SetupIntent at the time of this confirmation, one of `off_session` or `on_session`. Max length: 5000.
  """
  @type t :: %__MODULE__{
          application: String.t() | Stripe.Resources.Application.t(),
          attach_to_self: boolean() | nil,
          created: integer(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          flow_directions: [String.t()],
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          on_behalf_of: String.t() | Stripe.Resources.Account.t(),
          payment_method: String.t() | Stripe.Resources.PaymentMethod.t(),
          payment_method_details: __MODULE__.PaymentMethodDetails.t(),
          setup_error: Stripe.Resources.StripeError.t(),
          setup_intent: String.t() | Stripe.Resources.SetupIntent.t(),
          status: String.t(),
          usage: String.t()
        }

  defstruct [
    :application,
    :attach_to_self,
    :created,
    :customer,
    :customer_account,
    :flow_directions,
    :id,
    :livemode,
    :object,
    :on_behalf_of,
    :payment_method,
    :payment_method_details,
    :setup_error,
    :setup_intent,
    :status,
    :usage
  ]

  @object_name "setup_attempt"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "application",
      "customer",
      "on_behalf_of",
      "payment_method",
      "payment_method_details",
      "setup_error",
      "setup_intent"
    ]

  defmodule PaymentMethodDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `acss_debit`
    * `amazon_pay`
    * `au_becs_debit`
    * `bacs_debit`
    * `bancontact`
    * `boleto`
    * `card`
    * `card_present`
    * `cashapp`
    * `ideal`
    * `kakao_pay`
    * `klarna`
    * `kr_card`
    * `link`
    * `naver_pay`
    * `nz_bank_account`
    * `paypal`
    * `payto`
    * `revolut_pay`
    * `sepa_debit`
    * `sofort`
    * `type` - The type of the payment method used in the SetupIntent (e.g., `card`). An additional hash is included on `payment_method_details` with a name matching this value. It contains confirmation-specific information for the payment method. Max length: 5000.
    * `upi`
    * `us_bank_account`
    """
    @type t :: %__MODULE__{
            acss_debit: map() | nil,
            amazon_pay: map() | nil,
            au_becs_debit: Stripe.Resources.AuBecsDebit.t() | nil,
            bacs_debit: map() | nil,
            bancontact: Stripe.Resources.Bancontact.t() | nil,
            boleto: map() | nil,
            card: __MODULE__.Card.t() | nil,
            card_present: Stripe.Resources.CardPresent.t() | nil,
            cashapp: map() | nil,
            ideal: __MODULE__.Ideal.t() | nil,
            kakao_pay: map() | nil,
            klarna: map() | nil,
            kr_card: map() | nil,
            link: map() | nil,
            naver_pay: __MODULE__.NaverPay.t() | nil,
            nz_bank_account: Stripe.Resources.NzBankAccount.t() | nil,
            paypal: map() | nil,
            payto: map() | nil,
            revolut_pay: Stripe.Resources.RevolutPay.t() | nil,
            sepa_debit: map() | nil,
            sofort: __MODULE__.Sofort.t() | nil,
            type: String.t() | nil,
            upi: map() | nil,
            us_bank_account: Stripe.Resources.UsBankAccount.t() | nil
          }
    defstruct [
      :acss_debit,
      :amazon_pay,
      :au_becs_debit,
      :bacs_debit,
      :bancontact,
      :boleto,
      :card,
      :card_present,
      :cashapp,
      :ideal,
      :kakao_pay,
      :klarna,
      :kr_card,
      :link,
      :naver_pay,
      :nz_bank_account,
      :paypal,
      :payto,
      :revolut_pay,
      :sepa_debit,
      :sofort,
      :type,
      :upi,
      :us_bank_account
    ]

    defmodule Card do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `brand` - Card brand. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `jcb`, `link`, `mastercard`, `unionpay`, `visa` or `unknown`. Max length: 5000. Nullable.
      * `checks` - Check results by Card networks on Card address and CVC at the time of authorization Nullable.
      * `country` - Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected. Max length: 5000. Nullable.
      * `description` - A high-level description of the type of cards issued in this range. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
      * `exp_month` - Two-digit number representing the card's expiration month. Nullable.
      * `exp_year` - Four-digit number representing the card's expiration year. Nullable.
      * `fingerprint` - Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.

      *As of May 1, 2021, card fingerprint in India for Connect changed to allow two fingerprints for the same card---one for India and one for the rest of the world.* Max length: 5000. Nullable.
      * `funding` - Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`. Max length: 5000. Nullable.
      * `iin` - Issuer identification number of the card. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
      * `issuer` - The name of the card's issuing bank. (For internal use only and not typically available in standard API requests.) Max length: 5000. Nullable.
      * `last4` - The last four digits of the card. Max length: 5000. Nullable.
      * `network` - Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `eftpos_au`, `interac`, `jcb`, `link`, `mastercard`, `unionpay`, `visa`, or `unknown`. Max length: 5000. Nullable.
      * `three_d_secure` - Populated if this authorization used 3D Secure authentication. Nullable.
      * `wallet` - If this Card is part of a card wallet, this contains the details of the card wallet. Nullable.
      """
      @type t :: %__MODULE__{
              brand: String.t() | nil,
              checks: __MODULE__.Checks.t() | nil,
              country: String.t() | nil,
              description: String.t() | nil,
              exp_month: integer() | nil,
              exp_year: integer() | nil,
              fingerprint: String.t() | nil,
              funding: String.t() | nil,
              iin: String.t() | nil,
              issuer: String.t() | nil,
              last4: String.t() | nil,
              network: String.t() | nil,
              three_d_secure: __MODULE__.ThreeDSecure.t() | nil,
              wallet: __MODULE__.Wallet.t() | nil
            }
      defstruct [
        :brand,
        :checks,
        :country,
        :description,
        :exp_month,
        :exp_year,
        :fingerprint,
        :funding,
        :iin,
        :issuer,
        :last4,
        :network,
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

      defmodule ThreeDSecure do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `authentication_flow` - For authenticated transactions: how the customer was authenticated by
        the issuing bank. Possible values: `challenge`, `frictionless`. Nullable.
        * `electronic_commerce_indicator` - The Electronic Commerce Indicator (ECI). A protocol-level field
        indicating what degree of authentication was performed. Possible values: `01`, `02`, `05`, `06`, `07`. Nullable.
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
                result: String.t() | nil,
                result_reason: String.t() | nil,
                transaction_id: String.t() | nil,
                version: String.t() | nil
              }
        defstruct [
          :authentication_flow,
          :electronic_commerce_indicator,
          :result,
          :result_reason,
          :transaction_id,
          :version
        ]
      end

      defmodule Wallet do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `apple_pay`
        * `google_pay`
        * `type` - The type of the card wallet, one of `apple_pay`, `google_pay`, or `link`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type. Possible values: `apple_pay`, `google_pay`, `link`.
        """
        @type t :: %__MODULE__{
                apple_pay: map() | nil,
                google_pay: map() | nil,
                type: String.t() | nil
              }
        defstruct [:apple_pay, :google_pay, :type]
      end

      def __inner_types__ do
        %{
          "checks" => __MODULE__.Checks,
          "three_d_secure" => __MODULE__.ThreeDSecure,
          "wallet" => __MODULE__.Wallet
        }
      end
    end

    defmodule Ideal do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank` - The customer's bank. Can be one of `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, or `yoursafe`. Possible values: `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, `yoursafe`. Nullable.
      * `bic` - The Bank Identifier Code of the customer's bank. Possible values: `ABNANL2A`, `ADYBNL2A`, `ASNBNL21`, `BITSNL2A`, `BUNQNL2A`, `BUUTNL2A`, `FNOMNL22`, `FVLBNL22`, `HANDNL2A`, `INGBNL2A`, `KNABNL2H`, `MLLENL2A`, `MOYONL21`, `NNBANL2G`, `NTSBDEB1`, `RABONL2U`, `RBRBNL21`, `REVOIE23`, `REVOLT21`, `SNSBNL2A`, `TRIONL2U`. Nullable.
      * `generated_sepa_debit` - The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt. Nullable.
      * `generated_sepa_debit_mandate` - The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt. Nullable.
      * `iban_last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
      * `verified_name` - Owner's verified full name. Values are verified or provided by iDEAL directly
      (if supported) at the time of authorization or settlement. They cannot be set or mutated. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              bank: String.t() | nil,
              bic: String.t() | nil,
              generated_sepa_debit: String.t() | Stripe.Resources.PaymentMethod.t() | nil,
              generated_sepa_debit_mandate: String.t() | Stripe.Resources.Mandate.t() | nil,
              iban_last4: String.t() | nil,
              verified_name: String.t() | nil
            }
      defstruct [
        :bank,
        :bic,
        :generated_sepa_debit,
        :generated_sepa_debit_mandate,
        :iban_last4,
        :verified_name
      ]
    end

    defmodule NaverPay do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `buyer_id` - Uniquely identifies this particular Naver Pay account. You can use this attribute to check whether two Naver Pay accounts are the same. Max length: 5000.
      """
      @type t :: %__MODULE__{
              buyer_id: String.t() | nil
            }
      defstruct [:buyer_id]
    end

    defmodule Sofort do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `bank_code` - Bank code of bank associated with the bank account. Max length: 5000. Nullable.
      * `bank_name` - Name of the bank associated with the bank account. Max length: 5000. Nullable.
      * `bic` - Bank Identifier Code of the bank associated with the bank account. Max length: 5000. Nullable.
      * `generated_sepa_debit` - The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt. Nullable.
      * `generated_sepa_debit_mandate` - The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt. Nullable.
      * `iban_last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
      * `preferred_language` - Preferred language of the Sofort authorization page that the customer is redirected to.
      Can be one of `en`, `de`, `fr`, or `nl` Possible values: `de`, `en`, `fr`, `nl`. Nullable.
      * `verified_name` - Owner's verified full name. Values are verified or provided by Sofort directly
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

    def __inner_types__ do
      %{
        "card" => __MODULE__.Card,
        "ideal" => __MODULE__.Ideal,
        "naver_pay" => __MODULE__.NaverPay,
        "sofort" => __MODULE__.Sofort
      }
    end
  end

  def __inner_types__ do
    %{
      "payment_method_details" => __MODULE__.PaymentMethodDetails,
      "setup_error" => Stripe.Resources.StripeError
    }
  end
end
