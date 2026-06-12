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
          payment_method_details: payment_method_details(),
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
  @type payment_method_details :: %{
          optional(:acss_debit) => map() | nil,
          optional(:amazon_pay) => map() | nil,
          optional(:au_becs_debit) => Stripe.Resources.AuBecsDebit.t() | nil,
          optional(:bacs_debit) => map() | nil,
          optional(:bancontact) => Stripe.Resources.Bancontact.t() | nil,
          optional(:boleto) => map() | nil,
          optional(:card) => payment_method_details_card() | nil,
          optional(:card_present) => Stripe.Resources.CardPresent.t() | nil,
          optional(:cashapp) => map() | nil,
          optional(:ideal) => payment_method_details_ideal() | nil,
          optional(:kakao_pay) => map() | nil,
          optional(:klarna) => map() | nil,
          optional(:kr_card) => map() | nil,
          optional(:link) => map() | nil,
          optional(:naver_pay) => payment_method_details_naver_pay() | nil,
          optional(:nz_bank_account) => Stripe.Resources.NzBankAccount.t() | nil,
          optional(:paypal) => map() | nil,
          optional(:payto) => map() | nil,
          optional(:revolut_pay) => Stripe.Resources.RevolutPay.t() | nil,
          optional(:sepa_debit) => map() | nil,
          optional(:sofort) => payment_method_details_sofort() | nil,
          optional(:type) => String.t() | nil,
          optional(:upi) => map() | nil,
          optional(:us_bank_account) => Stripe.Resources.UsBankAccount.t() | nil,
          optional(String.t()) => term()
        }

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
  @type payment_method_details_card :: %{
          optional(:brand) => String.t() | nil,
          optional(:checks) => payment_method_details_card_checks() | nil,
          optional(:country) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:exp_month) => integer() | nil,
          optional(:exp_year) => integer() | nil,
          optional(:fingerprint) => String.t() | nil,
          optional(:funding) => String.t() | nil,
          optional(:iin) => String.t() | nil,
          optional(:issuer) => String.t() | nil,
          optional(:last4) => String.t() | nil,
          optional(:network) => String.t() | nil,
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
  @type payment_method_details_card_three_d_secure :: %{
          optional(:authentication_flow) => String.t() | nil,
          optional(:electronic_commerce_indicator) => String.t() | nil,
          optional(:result) => String.t() | nil,
          optional(:result_reason) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(:version) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `apple_pay`
  * `google_pay`
  * `type` - The type of the card wallet, one of `apple_pay`, `google_pay`, or `link`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type. Possible values: `apple_pay`, `google_pay`, `link`.
  """
  @type payment_method_details_card_wallet :: %{
          optional(:apple_pay) => map() | nil,
          optional(:google_pay) => map() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `bank` - The customer's bank. Can be one of `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, or `yoursafe`. Possible values: `abn_amro`, `adyen`, `asn_bank`, `bunq`, `buut`, `finom`, `handelsbanken`, `ing`, `knab`, `mollie`, `moneyou`, `n26`, `nn`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, `van_lanschot`, `yoursafe`. Nullable.
  * `bic` - The Bank Identifier Code of the customer's bank. Possible values: `ABNANL2A`, `ADYBNL2A`, `ASNBNL21`, `BITSNL2A`, `BUNQNL2A`, `BUUTNL2A`, `FNOMNL22`, `FVLBNL22`, `HANDNL2A`, `INGBNL2A`, `KNABNL2H`, `MLLENL2A`, `MOYONL21`, `NNBANL2G`, `NTSBDEB1`, `RABONL2U`, `RBRBNL21`, `REVOIE23`, `REVOLT21`, `SNSBNL2A`, `TRIONL2U`. Nullable.
  * `generated_sepa_debit` - The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt. Nullable.
  * `generated_sepa_debit_mandate` - The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt. Nullable.
  * `iban_last4` - Last four characters of the IBAN. Max length: 5000. Nullable.
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
          optional(:verified_name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `buyer_id` - Uniquely identifies this particular Naver Pay account. You can use this attribute to check whether two Naver Pay accounts are the same. Max length: 5000.
  """
  @type payment_method_details_naver_pay :: %{
          optional(:buyer_id) => String.t() | nil,
          optional(String.t()) => term()
        }

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
  @type payment_method_details_sofort :: %{
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

  def __nested_fields__ do
    %{
      "payment_method_details" => %{
        fields: %{
          "acss_debit" => :scalar,
          "amazon_pay" => :scalar,
          "au_becs_debit" => {:resource, Stripe.Resources.AuBecsDebit},
          "bacs_debit" => :scalar,
          "bancontact" => {:resource, Stripe.Resources.Bancontact},
          "boleto" => :scalar,
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
              "exp_month" => :scalar,
              "exp_year" => :scalar,
              "fingerprint" => :scalar,
              "funding" => :scalar,
              "iin" => :scalar,
              "issuer" => :scalar,
              "last4" => :scalar,
              "network" => :scalar,
              "three_d_secure" => %{
                fields: %{
                  "authentication_flow" => :scalar,
                  "electronic_commerce_indicator" => :scalar,
                  "result" => :scalar,
                  "result_reason" => :scalar,
                  "transaction_id" => :scalar,
                  "version" => :scalar
                }
              },
              "wallet" => %{
                fields: %{
                  "apple_pay" => :scalar,
                  "google_pay" => :scalar,
                  "type" => :scalar
                }
              }
            }
          },
          "card_present" => {:resource, Stripe.Resources.CardPresent},
          "cashapp" => :scalar,
          "ideal" => %{
            fields: %{
              "bank" => :scalar,
              "bic" => :scalar,
              "generated_sepa_debit" => {:resource, Stripe.Resources.PaymentMethod},
              "generated_sepa_debit_mandate" => {:resource, Stripe.Resources.Mandate},
              "iban_last4" => :scalar,
              "verified_name" => :scalar
            }
          },
          "kakao_pay" => :scalar,
          "klarna" => :scalar,
          "kr_card" => :scalar,
          "link" => :scalar,
          "naver_pay" => %{
            fields: %{
              "buyer_id" => :scalar
            }
          },
          "nz_bank_account" => {:resource, Stripe.Resources.NzBankAccount},
          "paypal" => :scalar,
          "payto" => :scalar,
          "revolut_pay" => {:resource, Stripe.Resources.RevolutPay},
          "sepa_debit" => :scalar,
          "sofort" => %{
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
          "type" => :scalar,
          "upi" => :scalar,
          "us_bank_account" => {:resource, Stripe.Resources.UsBankAccount}
        }
      },
      "setup_error" => {:resource, Stripe.Resources.StripeError}
    }
  end
end
