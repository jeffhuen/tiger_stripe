# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.Authorization do
  @moduledoc """
  IssuingAuthorization

  When an [issued card](https://docs.stripe.com/issuing) is used to make a purchase, an Issuing `Authorization`
  object is created. [Authorizations](https://docs.stripe.com/issuing/purchases/authorizations) must be approved for the
  purchase to be completed successfully.

  Related guide: [Issued card authorizations](https://docs.stripe.com/issuing/purchases/authorizations)
  """

  @typedoc """
  * `amount` - The total amount that was authorized or rejected. This amount is in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). `amount` should be the same as `merchant_amount`, unless `currency` and `merchant_currency` are different.
  * `amount_details` - Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable. Expandable.
  * `approved` - Whether the authorization has been approved.
  * `authorization_method` - How the card details were provided. Possible values: `chip`, `contactless`, `keyed_in`, `online`, `swipe`.
  * `balance_transactions` - List of balance transactions associated with this authorization. Expandable.
  * `card` - Expandable.
  * `cardholder` - The cardholder to whom this authorization belongs. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - The currency of the cardholder. This currency can be different from the currency presented at authorization and the `merchant_currency` field on this authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `fleet` - Fleet-specific information for authorizations using Fleet cards. Nullable. Expandable.
  * `fraud_challenges` - Fraud challenges sent to the cardholder, if this authorization was declined for fraud risk reasons. Nullable. Expandable.
  * `fuel` - Information about fuel that was purchased with this transaction. Typically this information is received from the merchant after the authorization has been approved and the fuel dispensed. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `merchant_amount` - The total amount that was authorized or rejected. This amount is in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). `merchant_amount` should be the same as `amount`, unless `merchant_currency` and `currency` are different.
  * `merchant_currency` - The local currency that was presented to the cardholder for the authorization. This currency can be different from the cardholder currency and the `currency` field on this authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `merchant_data` - Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `network_data` - Details about the authorization, such as identifiers, set by the card network. Nullable. Expandable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.authorization`.
  * `pending_request` - The pending authorization request. This field will only be non-null during an `issuing_authorization.request` webhook. Nullable. Expandable.
  * `request_history` - History of every time a `pending_request` authorization was approved/declined, either by you directly or by Stripe (e.g. based on your spending_controls). If the merchant changes the authorization by performing an incremental authorization, you can look at this field to see the previous requests for the authorization. This field can be helpful in determining why a given authorization was approved/declined. Expandable.
  * `status` - The current status of the authorization in its lifecycle. Possible values: `closed`, `expired`, `pending`, `reversed`.
  * `token` - [Token](https://docs.stripe.com/api/issuing/tokens/object) object used for this authorization. If a network token was not used for this authorization, this field will be null. Nullable. Expandable.
  * `transactions` - List of [transactions](https://docs.stripe.com/api/issuing/transactions) associated with this authorization. Expandable.
  * `treasury` - [Treasury](https://docs.stripe.com/api/treasury) details related to this authorization if it was created on a [FinancialAccount](https://docs.stripe.com/api/treasury/financial_accounts). Nullable. Expandable.
  * `verification_data` - Expandable.
  * `verified_by_fraud_challenge` - Whether the authorization bypassed fraud risk checks because the cardholder has previously completed a fraud challenge on a similar high-risk authorization from the same merchant. Nullable.
  * `wallet` - The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or `samsung_pay`. Will populate as `null` when no digital wallet was utilized. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_details: amount_details(),
          approved: boolean(),
          authorization_method: String.t(),
          balance_transactions: [Stripe.Resources.BalanceTransaction.t()],
          card: Stripe.Resources.Issuing.Card.t(),
          cardholder: String.t() | Stripe.Resources.Issuing.Cardholder.t(),
          created: integer(),
          currency: String.t(),
          fleet: fleet(),
          fraud_challenges: [fraud_challenges()] | nil,
          fuel: fuel(),
          id: String.t(),
          livemode: boolean(),
          merchant_amount: integer(),
          merchant_currency: String.t(),
          merchant_data: merchant_data(),
          metadata: %{String.t() => String.t()},
          network_data: network_data(),
          object: String.t(),
          pending_request: pending_request(),
          request_history: [request_history()],
          status: String.t(),
          token: String.t() | Stripe.Resources.Issuing.Token.t() | nil,
          transactions: [Stripe.Resources.Issuing.Transaction.t()],
          treasury: treasury() | nil,
          verification_data: verification_data(),
          verified_by_fraud_challenge: boolean(),
          wallet: String.t()
        }

  defstruct [
    :amount,
    :amount_details,
    :approved,
    :authorization_method,
    :balance_transactions,
    :card,
    :cardholder,
    :created,
    :currency,
    :fleet,
    :fraud_challenges,
    :fuel,
    :id,
    :livemode,
    :merchant_amount,
    :merchant_currency,
    :merchant_data,
    :metadata,
    :network_data,
    :object,
    :pending_request,
    :request_history,
    :status,
    :token,
    :transactions,
    :treasury,
    :verification_data,
    :verified_by_fraud_challenge,
    :wallet
  ]

  @object_name "issuing.authorization"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "amount_details",
      "balance_transactions",
      "card",
      "cardholder",
      "fleet",
      "fraud_challenges",
      "fuel",
      "merchant_data",
      "network_data",
      "pending_request",
      "request_history",
      "token",
      "transactions",
      "treasury",
      "verification_data"
    ]

  @typedoc """
  * `atm_fee` - The fee charged by the ATM for the cash withdrawal. Nullable.
  * `cashback_amount` - The amount of cash requested by the cardholder. Nullable.
  """
  @type amount_details :: %{
          optional(:atm_fee) => integer() | nil,
          optional(:cashback_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `cardholder_prompt_data` - Answers to prompts presented to the cardholder at the point of sale. Prompted fields vary depending on the configuration of your physical fleet cards. Typical points of sale support only numeric entry. Nullable.
  * `purchase_type` - The type of purchase. Possible values: `fuel_and_non_fuel_purchase`, `fuel_purchase`, `non_fuel_purchase`. Nullable.
  * `reported_breakdown` - More information about the total amount. Typically this information is received from the merchant after the authorization has been approved and the fuel dispensed. This information is not guaranteed to be accurate as some merchants may provide unreliable data. Nullable.
  * `service_type` - The type of fuel service. Possible values: `full_service`, `non_fuel_transaction`, `self_service`. Nullable.
  """
  @type fleet :: %{
          optional(:cardholder_prompt_data) => fleet_cardholder_prompt_data() | nil,
          optional(:purchase_type) => String.t() | nil,
          optional(:reported_breakdown) => fleet_reported_breakdown() | nil,
          optional(:service_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `alphanumeric_id` - [Deprecated] An alphanumeric ID, though typical point of sales only support numeric entry. The card program can be configured to prompt for a vehicle ID, driver ID, or generic ID. Max length: 5000. Nullable.
  * `driver_id` - Driver ID. Max length: 5000. Nullable.
  * `odometer` - Odometer reading. Nullable.
  * `unspecified_id` - An alphanumeric ID. This field is used when a vehicle ID, driver ID, or generic ID is entered by the cardholder, but the merchant or card network did not specify the prompt type. Max length: 5000. Nullable.
  * `user_id` - User ID. Max length: 5000. Nullable.
  * `vehicle_number` - Vehicle number. Max length: 5000. Nullable.
  """
  @type fleet_cardholder_prompt_data :: %{
          optional(:alphanumeric_id) => String.t() | nil,
          optional(:driver_id) => String.t() | nil,
          optional(:odometer) => integer() | nil,
          optional(:unspecified_id) => String.t() | nil,
          optional(:user_id) => String.t() | nil,
          optional(:vehicle_number) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fuel` - Breakdown of fuel portion of the purchase. Nullable.
  * `non_fuel` - Breakdown of non-fuel portion of the purchase. Nullable.
  * `tax` - Information about tax included in this transaction. Nullable.
  """
  @type fleet_reported_breakdown :: %{
          optional(:fuel) => fleet_reported_breakdown_fuel() | nil,
          optional(:non_fuel) => fleet_reported_breakdown_non_fuel() | nil,
          optional(:tax) => fleet_reported_breakdown_tax() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `gross_amount_decimal` - Gross fuel amount that should equal Fuel Quantity multiplied by Fuel Unit Cost, inclusive of taxes. Format: decimal string. Nullable.
  """
  @type fleet_reported_breakdown_fuel :: %{
          optional(:gross_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `gross_amount_decimal` - Gross non-fuel amount that should equal the sum of the line items, inclusive of taxes. Format: decimal string. Nullable.
  """
  @type fleet_reported_breakdown_non_fuel :: %{
          optional(:gross_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `local_amount_decimal` - Amount of state or provincial Sales Tax included in the transaction amount. `null` if not reported by merchant or not subject to tax. Format: decimal string. Nullable.
  * `national_amount_decimal` - Amount of national Sales Tax or VAT included in the transaction amount. `null` if not reported by merchant or not subject to tax. Format: decimal string. Nullable.
  """
  @type fleet_reported_breakdown_tax :: %{
          optional(:local_amount_decimal) => String.t() | nil,
          optional(:national_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `channel` - The method by which the fraud challenge was delivered to the cardholder. Possible values: `sms`.
  * `status` - The status of the fraud challenge. Possible values: `expired`, `pending`, `rejected`, `undeliverable`, `verified`.
  * `undeliverable_reason` - If the challenge is not deliverable, the reason why. Possible values: `no_phone_number`, `unsupported_phone_number`. Nullable.
  """
  @type fraud_challenges :: %{
          optional(:channel) => String.t() | nil,
          optional(:status) => String.t() | nil,
          optional(:undeliverable_reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `industry_product_code` - [Conexxus Payment System Product Code](https://www.conexxus.org/conexxus-payment-system-product-codes) identifying the primary fuel product purchased. Max length: 5000. Nullable.
  * `quantity_decimal` - The quantity of `unit`s of fuel that was dispensed, represented as a decimal string with at most 12 decimal places. Format: decimal string. Nullable.
  * `type` - The type of fuel that was purchased. Possible values: `diesel`, `other`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`. Nullable.
  * `unit` - The units for `quantity_decimal`. Possible values: `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `other`, `pound`, `us_gallon`. Nullable.
  * `unit_cost_decimal` - The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places. Format: decimal string. Nullable.
  """
  @type fuel :: %{
          optional(:industry_product_code) => String.t() | nil,
          optional(:quantity_decimal) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:unit) => String.t() | nil,
          optional(:unit_cost_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `category` - A categorization of the seller's type of business. See our [merchant categories guide](https://docs.stripe.com/issuing/merchant-categories) for a list of possible values. Max length: 5000.
  * `category_code` - The merchant category code for the seller’s business Max length: 5000.
  * `city` - City where the seller is located Max length: 5000. Nullable.
  * `country` - Country where the seller is located Max length: 5000. Nullable.
  * `name` - Name of the seller Max length: 5000. Nullable.
  * `network_id` - Identifier assigned to the seller by the card network. Different card networks may assign different network_id fields to the same merchant. Max length: 5000.
  * `postal_code` - Postal code where the seller is located Max length: 5000. Nullable.
  * `state` - State where the seller is located Max length: 5000. Nullable.
  * `tax_id` - The seller's tax identification number. Currently populated for French merchants only. Max length: 5000. Nullable.
  * `terminal_id` - An ID assigned by the seller to the location of the sale. Max length: 5000. Nullable.
  * `url` - URL provided by the merchant on a 3DS request Max length: 5000. Nullable.
  """
  @type merchant_data :: %{
          optional(:category) => String.t() | nil,
          optional(:category_code) => String.t() | nil,
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:network_id) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:tax_id) => String.t() | nil,
          optional(:terminal_id) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `acquiring_institution_id` - Identifier assigned to the acquirer by the card network. Sometimes this value is not provided by the network; in this case, the value will be `null`. Max length: 5000. Nullable.
  * `system_trace_audit_number` - The System Trace Audit Number (STAN) is a 6-digit identifier assigned by the acquirer. Prefer `network_data.transaction_id` if present, unless you have special requirements. Max length: 5000. Nullable.
  * `transaction_id` - Unique identifier for the authorization assigned by the card network used to match subsequent messages, disputes, and transactions. Max length: 5000. Nullable.
  """
  @type network_data :: %{
          optional(:acquiring_institution_id) => String.t() | nil,
          optional(:system_trace_audit_number) => String.t() | nil,
          optional(:transaction_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The additional amount Stripe will hold if the authorization is approved, in the card's [currency](https://docs.stripe.com/api#issuing_authorization_object-pending-request-currency) and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `amount_details` - Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `is_amount_controllable` - If set `true`, you may provide [amount](https://docs.stripe.com/api/issuing/authorizations/approve#approve_issuing_authorization-amount) to control how much to hold for the authorization.
  * `merchant_amount` - The amount the merchant is requesting to be authorized in the `merchant_currency`. The amount is in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `merchant_currency` - The local currency the merchant is requesting to authorize. Format: ISO 4217 currency code.
  * `network_risk_score` - The card network's estimate of the likelihood that an authorization is fraudulent. Takes on values between 1 and 99. Nullable.
  """
  @type pending_request :: %{
          optional(:amount) => integer() | nil,
          optional(:amount_details) => pending_request_amount_details() | nil,
          optional(:currency) => String.t() | nil,
          optional(:is_amount_controllable) => boolean() | nil,
          optional(:merchant_amount) => integer() | nil,
          optional(:merchant_currency) => String.t() | nil,
          optional(:network_risk_score) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `atm_fee` - The fee charged by the ATM for the cash withdrawal. Nullable.
  * `cashback_amount` - The amount of cash requested by the cardholder. Nullable.
  """
  @type pending_request_amount_details :: %{
          optional(:atm_fee) => integer() | nil,
          optional(:cashback_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The `pending_request.amount` at the time of the request, presented in your card's currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Stripe held this amount from your account to fund the authorization if the request was approved.
  * `amount_details` - Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable.
  * `approved` - Whether this request was approved.
  * `authorization_code` - A code created by Stripe which is shared with the merchant to validate the authorization. This field will be populated if the authorization message was approved. The code typically starts with the letter "S", followed by a six-digit number. For example, "S498162". Please note that the code is not guaranteed to be unique across authorizations. Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `merchant_amount` - The `pending_request.merchant_amount` at the time of the request, presented in the `merchant_currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `merchant_currency` - The currency that was collected by the merchant and presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `network_risk_score` - The card network's estimate of the likelihood that an authorization is fraudulent. Takes on values between 1 and 99. Nullable.
  * `reason` - When an authorization is approved or declined by you or by Stripe, this field provides additional detail on the reason for the outcome. Possible values: `account_disabled`, `card_active`, `card_canceled`, `card_expired`, `card_inactive`, `cardholder_blocked`, `cardholder_inactive`, `cardholder_verification_required`, `insecure_authorization_method`, `insufficient_funds`, `network_fallback`, `not_allowed`, `pin_blocked`, `spending_controls`, `suspected_fraud`, `verification_failed`, `webhook_approved`, `webhook_declined`, `webhook_error`, `webhook_timeout`.
  * `reason_message` - If the `request_history.reason` is `webhook_error` because the direct webhook response is invalid (for example, parsing errors or missing parameters), we surface a more detailed error message via this field. Max length: 5000. Nullable.
  * `requested_at` - Time when the card network received an authorization request from the acquirer in UTC. Referred to by networks as transmission time. Format: Unix timestamp. Nullable.
  """
  @type request_history :: %{
          optional(:amount) => integer() | nil,
          optional(:amount_details) => request_history_amount_details() | nil,
          optional(:approved) => boolean() | nil,
          optional(:authorization_code) => String.t() | nil,
          optional(:created) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:merchant_amount) => integer() | nil,
          optional(:merchant_currency) => String.t() | nil,
          optional(:network_risk_score) => integer() | nil,
          optional(:reason) => String.t() | nil,
          optional(:reason_message) => String.t() | nil,
          optional(:requested_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `atm_fee` - The fee charged by the ATM for the cash withdrawal. Nullable.
  * `cashback_amount` - The amount of cash requested by the cardholder. Nullable.
  """
  @type request_history_amount_details :: %{
          optional(:atm_fee) => integer() | nil,
          optional(:cashback_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `received_credits` - The array of [ReceivedCredits](https://docs.stripe.com/api/treasury/received_credits) associated with this authorization
  * `received_debits` - The array of [ReceivedDebits](https://docs.stripe.com/api/treasury/received_debits) associated with this authorization
  * `transaction` - The Treasury [Transaction](https://docs.stripe.com/api/treasury/transactions) associated with this authorization Max length: 5000. Nullable.
  """
  @type treasury :: %{
          optional(:received_credits) => [String.t()] | nil,
          optional(:received_debits) => [String.t()] | nil,
          optional(:transaction) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address_line1_check` - Whether the cardholder provided an address first line and if it matched the cardholder’s `billing.address.line1`. Possible values: `match`, `mismatch`, `not_provided`.
  * `address_postal_code_check` - Whether the cardholder provided a postal code and if it matched the cardholder’s `billing.address.postal_code`. Possible values: `match`, `mismatch`, `not_provided`.
  * `authentication_exemption` - The exemption applied to this authorization. Nullable.
  * `cvc_check` - Whether the cardholder provided a CVC and if it matched Stripe’s record. Possible values: `match`, `mismatch`, `not_provided`.
  * `expiry_check` - Whether the cardholder provided an expiry date and if it matched Stripe’s record. Possible values: `match`, `mismatch`, `not_provided`.
  * `postal_code` - The postal code submitted as part of the authorization used for postal code verification. Max length: 5000. Nullable.
  * `three_d_secure` - 3D Secure details. Nullable.
  """
  @type verification_data :: %{
          optional(:address_line1_check) => String.t() | nil,
          optional(:address_postal_code_check) => String.t() | nil,
          optional(:authentication_exemption) =>
            verification_data_authentication_exemption() | nil,
          optional(:cvc_check) => String.t() | nil,
          optional(:expiry_check) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:three_d_secure) => verification_data_three_d_secure() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `claimed_by` - The entity that requested the exemption, either the acquiring merchant or the Issuing user. Possible values: `acquirer`, `issuer`.
  * `type` - The specific exemption claimed for this authorization. Possible values: `low_value_transaction`, `transaction_risk_analysis`, `unknown`.
  """
  @type verification_data_authentication_exemption :: %{
          optional(:claimed_by) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `result` - The outcome of the 3D Secure authentication request. Possible values: `attempt_acknowledged`, `authenticated`, `failed`, `required`.
  """
  @type verification_data_three_d_secure :: %{
          optional(:result) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "amount_details" => %{
        fields: %{
          "atm_fee" => :scalar,
          "cashback_amount" => :scalar
        }
      },
      "fleet" => %{
        fields: %{
          "cardholder_prompt_data" => %{
            fields: %{
              "alphanumeric_id" => :scalar,
              "driver_id" => :scalar,
              "odometer" => :scalar,
              "unspecified_id" => :scalar,
              "user_id" => :scalar,
              "vehicle_number" => :scalar
            }
          },
          "purchase_type" => :scalar,
          "reported_breakdown" => %{
            fields: %{
              "fuel" => %{
                fields: %{
                  "gross_amount_decimal" => :scalar
                }
              },
              "non_fuel" => %{
                fields: %{
                  "gross_amount_decimal" => :scalar
                }
              },
              "tax" => %{
                fields: %{
                  "local_amount_decimal" => :scalar,
                  "national_amount_decimal" => :scalar
                }
              }
            }
          },
          "service_type" => :scalar
        }
      },
      "fraud_challenges" => %{
        fields: %{
          "channel" => :scalar,
          "status" => :scalar,
          "undeliverable_reason" => :scalar
        }
      },
      "fuel" => %{
        fields: %{
          "industry_product_code" => :scalar,
          "quantity_decimal" => :scalar,
          "type" => :scalar,
          "unit" => :scalar,
          "unit_cost_decimal" => :scalar
        }
      },
      "merchant_data" => %{
        fields: %{
          "category" => :scalar,
          "category_code" => :scalar,
          "city" => :scalar,
          "country" => :scalar,
          "name" => :scalar,
          "network_id" => :scalar,
          "postal_code" => :scalar,
          "state" => :scalar,
          "tax_id" => :scalar,
          "terminal_id" => :scalar,
          "url" => :scalar
        }
      },
      "network_data" => %{
        fields: %{
          "acquiring_institution_id" => :scalar,
          "system_trace_audit_number" => :scalar,
          "transaction_id" => :scalar
        }
      },
      "pending_request" => %{
        fields: %{
          "amount" => :scalar,
          "amount_details" => %{
            fields: %{
              "atm_fee" => :scalar,
              "cashback_amount" => :scalar
            }
          },
          "currency" => :scalar,
          "is_amount_controllable" => :scalar,
          "merchant_amount" => :scalar,
          "merchant_currency" => :scalar,
          "network_risk_score" => :scalar
        }
      },
      "request_history" => %{
        fields: %{
          "amount" => :scalar,
          "amount_details" => %{
            fields: %{
              "atm_fee" => :scalar,
              "cashback_amount" => :scalar
            }
          },
          "approved" => :scalar,
          "authorization_code" => :scalar,
          "created" => :scalar,
          "currency" => :scalar,
          "merchant_amount" => :scalar,
          "merchant_currency" => :scalar,
          "network_risk_score" => :scalar,
          "reason" => :scalar,
          "reason_message" => :scalar,
          "requested_at" => :scalar
        }
      },
      "treasury" => %{
        fields: %{
          "received_credits" => {:list, :scalar},
          "received_debits" => {:list, :scalar},
          "transaction" => :scalar
        }
      },
      "verification_data" => %{
        fields: %{
          "address_line1_check" => :scalar,
          "address_postal_code_check" => :scalar,
          "authentication_exemption" => %{
            fields: %{
              "claimed_by" => :scalar,
              "type" => :scalar
            }
          },
          "cvc_check" => :scalar,
          "expiry_check" => :scalar,
          "postal_code" => :scalar,
          "three_d_secure" => %{
            fields: %{
              "result" => :scalar
            }
          }
        }
      },
      "card" => {:resource, Stripe.Resources.Issuing.Card}
    }
  end
end
