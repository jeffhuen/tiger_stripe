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
          amount_details: __MODULE__.AmountDetails.t(),
          approved: boolean(),
          authorization_method: String.t(),
          balance_transactions: [Stripe.Resources.BalanceTransaction.t()],
          card: Stripe.Resources.Issuing.Card.t(),
          cardholder: String.t() | Stripe.Resources.Issuing.Cardholder.t(),
          created: integer(),
          currency: String.t(),
          fleet: __MODULE__.Fleet.t(),
          fraud_challenges: [__MODULE__.FraudChallenges.t()] | nil,
          fuel: __MODULE__.Fuel.t(),
          id: String.t(),
          livemode: boolean(),
          merchant_amount: integer(),
          merchant_currency: String.t(),
          merchant_data: __MODULE__.MerchantData.t(),
          metadata: %{String.t() => String.t()},
          network_data: __MODULE__.NetworkData.t(),
          object: String.t(),
          pending_request: __MODULE__.PendingRequest.t(),
          request_history: [__MODULE__.RequestHistory.t()],
          status: String.t(),
          token: String.t() | Stripe.Resources.Issuing.Token.t() | nil,
          transactions: [Stripe.Resources.Issuing.Transaction.t()],
          treasury: __MODULE__.Treasury.t() | nil,
          verification_data: __MODULE__.VerificationData.t(),
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

  defmodule AmountDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `atm_fee` - The fee charged by the ATM for the cash withdrawal. Nullable.
    * `cashback_amount` - The amount of cash requested by the cardholder. Nullable.
    """
    @type t :: %__MODULE__{
            atm_fee: integer() | nil,
            cashback_amount: integer() | nil
          }
    defstruct [:atm_fee, :cashback_amount]
  end

  defmodule Fleet do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `cardholder_prompt_data` - Answers to prompts presented to the cardholder at the point of sale. Prompted fields vary depending on the configuration of your physical fleet cards. Typical points of sale support only numeric entry. Nullable.
    * `purchase_type` - The type of purchase. Possible values: `fuel_and_non_fuel_purchase`, `fuel_purchase`, `non_fuel_purchase`. Nullable.
    * `reported_breakdown` - More information about the total amount. Typically this information is received from the merchant after the authorization has been approved and the fuel dispensed. This information is not guaranteed to be accurate as some merchants may provide unreliable data. Nullable.
    * `service_type` - The type of fuel service. Possible values: `full_service`, `non_fuel_transaction`, `self_service`. Nullable.
    """
    @type t :: %__MODULE__{
            cardholder_prompt_data: __MODULE__.CardholderPromptData.t() | nil,
            purchase_type: String.t() | nil,
            reported_breakdown: __MODULE__.ReportedBreakdown.t() | nil,
            service_type: String.t() | nil
          }
    defstruct [:cardholder_prompt_data, :purchase_type, :reported_breakdown, :service_type]

    defmodule CardholderPromptData do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `alphanumeric_id` - [Deprecated] An alphanumeric ID, though typical point of sales only support numeric entry. The card program can be configured to prompt for a vehicle ID, driver ID, or generic ID. Max length: 5000. Nullable.
      * `driver_id` - Driver ID. Max length: 5000. Nullable.
      * `odometer` - Odometer reading. Nullable.
      * `unspecified_id` - An alphanumeric ID. This field is used when a vehicle ID, driver ID, or generic ID is entered by the cardholder, but the merchant or card network did not specify the prompt type. Max length: 5000. Nullable.
      * `user_id` - User ID. Max length: 5000. Nullable.
      * `vehicle_number` - Vehicle number. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              alphanumeric_id: String.t() | nil,
              driver_id: String.t() | nil,
              odometer: integer() | nil,
              unspecified_id: String.t() | nil,
              user_id: String.t() | nil,
              vehicle_number: String.t() | nil
            }
      defstruct [
        :alphanumeric_id,
        :driver_id,
        :odometer,
        :unspecified_id,
        :user_id,
        :vehicle_number
      ]
    end

    defmodule ReportedBreakdown do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fuel` - Breakdown of fuel portion of the purchase. Nullable.
      * `non_fuel` - Breakdown of non-fuel portion of the purchase. Nullable.
      * `tax` - Information about tax included in this transaction. Nullable.
      """
      @type t :: %__MODULE__{
              fuel: __MODULE__.Fuel.t() | nil,
              non_fuel: __MODULE__.NonFuel.t() | nil,
              tax: __MODULE__.Tax.t() | nil
            }
      defstruct [:fuel, :non_fuel, :tax]

      defmodule Fuel do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `gross_amount_decimal` - Gross fuel amount that should equal Fuel Quantity multiplied by Fuel Unit Cost, inclusive of taxes. Format: decimal string. Nullable.
        """
        @type t :: %__MODULE__{
                gross_amount_decimal: String.t() | nil
              }
        defstruct [:gross_amount_decimal]
      end

      defmodule NonFuel do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `gross_amount_decimal` - Gross non-fuel amount that should equal the sum of the line items, inclusive of taxes. Format: decimal string. Nullable.
        """
        @type t :: %__MODULE__{
                gross_amount_decimal: String.t() | nil
              }
        defstruct [:gross_amount_decimal]
      end

      defmodule Tax do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `local_amount_decimal` - Amount of state or provincial Sales Tax included in the transaction amount. `null` if not reported by merchant or not subject to tax. Format: decimal string. Nullable.
        * `national_amount_decimal` - Amount of national Sales Tax or VAT included in the transaction amount. `null` if not reported by merchant or not subject to tax. Format: decimal string. Nullable.
        """
        @type t :: %__MODULE__{
                local_amount_decimal: String.t() | nil,
                national_amount_decimal: String.t() | nil
              }
        defstruct [:local_amount_decimal, :national_amount_decimal]
      end

      def __inner_types__ do
        %{
          "fuel" => __MODULE__.Fuel,
          "non_fuel" => __MODULE__.NonFuel,
          "tax" => __MODULE__.Tax
        }
      end
    end

    def __inner_types__ do
      %{
        "cardholder_prompt_data" => __MODULE__.CardholderPromptData,
        "reported_breakdown" => __MODULE__.ReportedBreakdown
      }
    end
  end

  defmodule FraudChallenges do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `channel` - The method by which the fraud challenge was delivered to the cardholder. Possible values: `sms`.
    * `status` - The status of the fraud challenge. Possible values: `expired`, `pending`, `rejected`, `undeliverable`, `verified`.
    * `undeliverable_reason` - If the challenge is not deliverable, the reason why. Possible values: `no_phone_number`, `unsupported_phone_number`. Nullable.
    """
    @type t :: %__MODULE__{
            channel: String.t() | nil,
            status: String.t() | nil,
            undeliverable_reason: String.t() | nil
          }
    defstruct [:channel, :status, :undeliverable_reason]
  end

  defmodule Fuel do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `industry_product_code` - [Conexxus Payment System Product Code](https://www.conexxus.org/conexxus-payment-system-product-codes) identifying the primary fuel product purchased. Max length: 5000. Nullable.
    * `quantity_decimal` - The quantity of `unit`s of fuel that was dispensed, represented as a decimal string with at most 12 decimal places. Format: decimal string. Nullable.
    * `type` - The type of fuel that was purchased. Possible values: `diesel`, `other`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`. Nullable.
    * `unit` - The units for `quantity_decimal`. Possible values: `charging_minute`, `imperial_gallon`, `kilogram`, `kilowatt_hour`, `liter`, `other`, `pound`, `us_gallon`. Nullable.
    * `unit_cost_decimal` - The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places. Format: decimal string. Nullable.
    """
    @type t :: %__MODULE__{
            industry_product_code: String.t() | nil,
            quantity_decimal: String.t() | nil,
            type: String.t() | nil,
            unit: String.t() | nil,
            unit_cost_decimal: String.t() | nil
          }
    defstruct [:industry_product_code, :quantity_decimal, :type, :unit, :unit_cost_decimal]
  end

  defmodule MerchantData do
    @moduledoc "Nested struct within the parent resource."

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
    @type t :: %__MODULE__{
            category: String.t() | nil,
            category_code: String.t() | nil,
            city: String.t() | nil,
            country: String.t() | nil,
            name: String.t() | nil,
            network_id: String.t() | nil,
            postal_code: String.t() | nil,
            state: String.t() | nil,
            tax_id: String.t() | nil,
            terminal_id: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [
      :category,
      :category_code,
      :city,
      :country,
      :name,
      :network_id,
      :postal_code,
      :state,
      :tax_id,
      :terminal_id,
      :url
    ]
  end

  defmodule NetworkData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `acquiring_institution_id` - Identifier assigned to the acquirer by the card network. Sometimes this value is not provided by the network; in this case, the value will be `null`. Max length: 5000. Nullable.
    * `system_trace_audit_number` - The System Trace Audit Number (STAN) is a 6-digit identifier assigned by the acquirer. Prefer `network_data.transaction_id` if present, unless you have special requirements. Max length: 5000. Nullable.
    * `transaction_id` - Unique identifier for the authorization assigned by the card network used to match subsequent messages, disputes, and transactions. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            acquiring_institution_id: String.t() | nil,
            system_trace_audit_number: String.t() | nil,
            transaction_id: String.t() | nil
          }
    defstruct [:acquiring_institution_id, :system_trace_audit_number, :transaction_id]
  end

  defmodule PendingRequest do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The additional amount Stripe will hold if the authorization is approved, in the card's [currency](https://docs.stripe.com/api#issuing_authorization_object-pending-request-currency) and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
    * `amount_details` - Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Nullable.
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `is_amount_controllable` - If set `true`, you may provide [amount](https://docs.stripe.com/api/issuing/authorizations/approve#approve_issuing_authorization-amount) to control how much to hold for the authorization.
    * `merchant_amount` - The amount the merchant is requesting to be authorized in the `merchant_currency`. The amount is in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
    * `merchant_currency` - The local currency the merchant is requesting to authorize. Format: ISO 4217 currency code.
    * `network_risk_score` - The card network's estimate of the likelihood that an authorization is fraudulent. Takes on values between 1 and 99. Nullable.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            amount_details: __MODULE__.AmountDetails.t() | nil,
            currency: String.t() | nil,
            is_amount_controllable: boolean() | nil,
            merchant_amount: integer() | nil,
            merchant_currency: String.t() | nil,
            network_risk_score: integer() | nil
          }
    defstruct [
      :amount,
      :amount_details,
      :currency,
      :is_amount_controllable,
      :merchant_amount,
      :merchant_currency,
      :network_risk_score
    ]

    defmodule AmountDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `atm_fee` - The fee charged by the ATM for the cash withdrawal. Nullable.
      * `cashback_amount` - The amount of cash requested by the cardholder. Nullable.
      """
      @type t :: %__MODULE__{
              atm_fee: integer() | nil,
              cashback_amount: integer() | nil
            }
      defstruct [:atm_fee, :cashback_amount]
    end

    def __inner_types__ do
      %{
        "amount_details" => __MODULE__.AmountDetails
      }
    end
  end

  defmodule RequestHistory do
    @moduledoc "Nested struct within the parent resource."

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
    @type t :: %__MODULE__{
            amount: integer() | nil,
            amount_details: __MODULE__.AmountDetails.t() | nil,
            approved: boolean() | nil,
            authorization_code: String.t() | nil,
            created: integer() | nil,
            currency: String.t() | nil,
            merchant_amount: integer() | nil,
            merchant_currency: String.t() | nil,
            network_risk_score: integer() | nil,
            reason: String.t() | nil,
            reason_message: String.t() | nil,
            requested_at: integer() | nil
          }
    defstruct [
      :amount,
      :amount_details,
      :approved,
      :authorization_code,
      :created,
      :currency,
      :merchant_amount,
      :merchant_currency,
      :network_risk_score,
      :reason,
      :reason_message,
      :requested_at
    ]

    defmodule AmountDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `atm_fee` - The fee charged by the ATM for the cash withdrawal. Nullable.
      * `cashback_amount` - The amount of cash requested by the cardholder. Nullable.
      """
      @type t :: %__MODULE__{
              atm_fee: integer() | nil,
              cashback_amount: integer() | nil
            }
      defstruct [:atm_fee, :cashback_amount]
    end

    def __inner_types__ do
      %{
        "amount_details" => __MODULE__.AmountDetails
      }
    end
  end

  defmodule Treasury do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `received_credits` - The array of [ReceivedCredits](https://docs.stripe.com/api/treasury/received_credits) associated with this authorization
    * `received_debits` - The array of [ReceivedDebits](https://docs.stripe.com/api/treasury/received_debits) associated with this authorization
    * `transaction` - The Treasury [Transaction](https://docs.stripe.com/api/treasury/transactions) associated with this authorization Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            received_credits: [String.t()] | nil,
            received_debits: [String.t()] | nil,
            transaction: String.t() | nil
          }
    defstruct [:received_credits, :received_debits, :transaction]
  end

  defmodule VerificationData do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `address_line1_check` - Whether the cardholder provided an address first line and if it matched the cardholder’s `billing.address.line1`. Possible values: `match`, `mismatch`, `not_provided`.
    * `address_postal_code_check` - Whether the cardholder provided a postal code and if it matched the cardholder’s `billing.address.postal_code`. Possible values: `match`, `mismatch`, `not_provided`.
    * `authentication_exemption` - The exemption applied to this authorization. Nullable.
    * `cvc_check` - Whether the cardholder provided a CVC and if it matched Stripe’s record. Possible values: `match`, `mismatch`, `not_provided`.
    * `expiry_check` - Whether the cardholder provided an expiry date and if it matched Stripe’s record. Possible values: `match`, `mismatch`, `not_provided`.
    * `postal_code` - The postal code submitted as part of the authorization used for postal code verification. Max length: 5000. Nullable.
    * `three_d_secure` - 3D Secure details. Nullable.
    """
    @type t :: %__MODULE__{
            address_line1_check: String.t() | nil,
            address_postal_code_check: String.t() | nil,
            authentication_exemption: __MODULE__.AuthenticationExemption.t() | nil,
            cvc_check: String.t() | nil,
            expiry_check: String.t() | nil,
            postal_code: String.t() | nil,
            three_d_secure: __MODULE__.ThreeDSecure.t() | nil
          }
    defstruct [
      :address_line1_check,
      :address_postal_code_check,
      :authentication_exemption,
      :cvc_check,
      :expiry_check,
      :postal_code,
      :three_d_secure
    ]

    defmodule AuthenticationExemption do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `claimed_by` - The entity that requested the exemption, either the acquiring merchant or the Issuing user. Possible values: `acquirer`, `issuer`.
      * `type` - The specific exemption claimed for this authorization. Possible values: `low_value_transaction`, `transaction_risk_analysis`, `unknown`.
      """
      @type t :: %__MODULE__{
              claimed_by: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:claimed_by, :type]
    end

    defmodule ThreeDSecure do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `result` - The outcome of the 3D Secure authentication request. Possible values: `attempt_acknowledged`, `authenticated`, `failed`, `required`.
      """
      @type t :: %__MODULE__{
              result: String.t() | nil
            }
      defstruct [:result]
    end

    def __inner_types__ do
      %{
        "authentication_exemption" => __MODULE__.AuthenticationExemption,
        "three_d_secure" => __MODULE__.ThreeDSecure
      }
    end
  end

  def __inner_types__ do
    %{
      "amount_details" => __MODULE__.AmountDetails,
      "card" => Stripe.Resources.Issuing.Card,
      "fleet" => __MODULE__.Fleet,
      "fraud_challenges" => __MODULE__.FraudChallenges,
      "fuel" => __MODULE__.Fuel,
      "merchant_data" => __MODULE__.MerchantData,
      "network_data" => __MODULE__.NetworkData,
      "pending_request" => __MODULE__.PendingRequest,
      "request_history" => __MODULE__.RequestHistory,
      "treasury" => __MODULE__.Treasury,
      "verification_data" => __MODULE__.VerificationData
    }
  end
end
