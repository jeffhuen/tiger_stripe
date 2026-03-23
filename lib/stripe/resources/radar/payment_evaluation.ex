# File generated from our OpenAPI spec
defmodule Stripe.Resources.Radar.PaymentEvaluation do
  @moduledoc """
  InsightsResourcesPaymentEvaluation

  Payment Evaluations represent the risk lifecycle of an externally processed payment. It includes the Radar risk score from Stripe, payment outcome taken by the merchant or processor, and any post transaction events, such as refunds or disputes. See the [Radar API guide](https://stripe.com/radar/multiprocessor) for integration steps.
  """

  @typedoc """
  * `client_device_metadata_details` - Expandable.
  * `created_at` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `customer_details` - Expandable.
  * `events` - Event information associated with the payment evaluation, such as refunds, dispute, early fraud warnings, or user interventions. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `insights` - Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `radar.payment_evaluation`.
  * `outcome` - Indicates the final outcome for the payment evaluation. Nullable. Expandable.
  * `payment_details` - Expandable.
  """
  @type t :: %__MODULE__{
          client_device_metadata_details: __MODULE__.ClientDeviceMetadataDetails.t() | nil,
          created_at: integer(),
          customer_details: __MODULE__.CustomerDetails.t() | nil,
          events: [__MODULE__.Events.t()] | nil,
          id: String.t(),
          insights: __MODULE__.Insights.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          outcome: __MODULE__.Outcome.t() | nil,
          payment_details: __MODULE__.PaymentDetails.t() | nil
        }

  defstruct [
    :client_device_metadata_details,
    :created_at,
    :customer_details,
    :events,
    :id,
    :insights,
    :livemode,
    :metadata,
    :object,
    :outcome,
    :payment_details
  ]

  @object_name "radar.payment_evaluation"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "client_device_metadata_details",
      "customer_details",
      "events",
      "insights",
      "outcome",
      "payment_details"
    ]

  defmodule ClientDeviceMetadataDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `radar_session` - ID for the Radar Session associated with the payment evaluation. A [Radar Session](https://docs.stripe.com/radar/radar-session) is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments. Max length: 5000.
    """
    @type t :: %__MODULE__{
            radar_session: String.t() | nil
          }
    defstruct [:radar_session]
  end

  defmodule CustomerDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `customer` - The ID of the customer associated with the payment evaluation. Max length: 5000. Nullable.
    * `customer_account` - The ID of the Account representing the customer associated with the payment evaluation. Max length: 5000. Nullable.
    * `email` - The customer's email address. Max length: 5000. Nullable.
    * `name` - The customer's full name or business name. Max length: 5000. Nullable.
    * `phone` - The customer's phone number. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            customer: String.t() | nil,
            customer_account: String.t() | nil,
            email: String.t() | nil,
            name: String.t() | nil,
            phone: String.t() | nil
          }
    defstruct [:customer, :customer_account, :email, :name, :phone]
  end

  defmodule Events do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `dispute_opened`
    * `early_fraud_warning_received`
    * `occurred_at` - Timestamp when the event occurred. Format: Unix timestamp.
    * `refunded`
    * `type` - Indicates the type of event attached to the payment evaluation. Possible values: `dispute_opened`, `early_fraud_warning_received`, `refunded`, `user_intervention_raised`, `user_intervention_resolved`.
    * `user_intervention_raised`
    * `user_intervention_resolved`
    """
    @type t :: %__MODULE__{
            dispute_opened: __MODULE__.DisputeOpened.t() | nil,
            early_fraud_warning_received: __MODULE__.EarlyFraudWarningReceived.t() | nil,
            occurred_at: integer() | nil,
            refunded: __MODULE__.Refunded.t() | nil,
            type: String.t() | nil,
            user_intervention_raised: __MODULE__.UserInterventionRaised.t() | nil,
            user_intervention_resolved: __MODULE__.UserInterventionResolved.t() | nil
          }
    defstruct [
      :dispute_opened,
      :early_fraud_warning_received,
      :occurred_at,
      :refunded,
      :type,
      :user_intervention_raised,
      :user_intervention_resolved
    ]

    defmodule DisputeOpened do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - Amount to dispute for this payment. A positive integer representing how much to charge in [the smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (for example, 100 cents to charge 1.00 USD or 100 to charge 100 Yen, a zero-decimal currency).
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `reason` - Reason given by cardholder for dispute. Possible values: `account_not_available`, `credit_not_processed`, `customer_initiated`, `duplicate`, `fraudulent`, `general`, `noncompliant`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, `unrecognized`.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              reason: String.t() | nil
            }
      defstruct [:amount, :currency, :reason]
    end

    defmodule EarlyFraudWarningReceived do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `fraud_type` - The type of fraud labeled by the issuer. Possible values: `made_with_lost_card`, `made_with_stolen_card`, `other`, `unauthorized_use_of_card`.
      """
      @type t :: %__MODULE__{
              fraud_type: String.t() | nil
            }
      defstruct [:fraud_type]
    end

    defmodule Refunded do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `amount` - Amount refunded for this payment. A positive integer representing how much to charge in [the smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (for example, 100 cents to charge 1.00 USD or 100 to charge 100 Yen, a zero-decimal currency).
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `reason` - Indicates the reason for the refund. Possible values: `duplicate`, `fraudulent`, `other`, `requested_by_customer`.
      """
      @type t :: %__MODULE__{
              amount: integer() | nil,
              currency: String.t() | nil,
              reason: String.t() | nil
            }
      defstruct [:amount, :currency, :reason]
    end

    defmodule UserInterventionRaised do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `custom`
      * `key` - Unique identifier for the user intervention event. Max length: 5000.
      * `type` - Type of user intervention raised. Possible values: `3ds`, `captcha`, `custom`.
      """
      @type t :: %__MODULE__{
              custom: __MODULE__.Custom.t() | nil,
              key: String.t() | nil,
              type: String.t() | nil
            }
      defstruct [:custom, :key, :type]

      defmodule Custom do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `type` - Custom type of user intervention raised. The string must use a snake case description for the type of intervention performed. Max length: 5000.
        """
        @type t :: %__MODULE__{
                type: String.t() | nil
              }
        defstruct [:type]
      end

      def __inner_types__ do
        %{
          "custom" => __MODULE__.Custom
        }
      end
    end

    defmodule UserInterventionResolved do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `key` - Unique ID of this intervention. Use this to provide the result. Max length: 5000.
      * `outcome` - Result of the intervention if it has been completed. Possible values: `abandoned`, `failed`, `passed`. Nullable.
      """
      @type t :: %__MODULE__{
              key: String.t() | nil,
              outcome: String.t() | nil
            }
      defstruct [:key, :outcome]
    end

    def __inner_types__ do
      %{
        "dispute_opened" => __MODULE__.DisputeOpened,
        "early_fraud_warning_received" => __MODULE__.EarlyFraudWarningReceived,
        "refunded" => __MODULE__.Refunded,
        "user_intervention_raised" => __MODULE__.UserInterventionRaised,
        "user_intervention_resolved" => __MODULE__.UserInterventionResolved
      }
    end
  end

  defmodule Insights do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `evaluated_at` - The timestamp when the evaluation was performed. Format: Unix timestamp.
    * `fraudulent_dispute`
    """
    @type t :: %__MODULE__{
            evaluated_at: integer() | nil,
            fraudulent_dispute: __MODULE__.FraudulentDispute.t() | nil
          }
    defstruct [:evaluated_at, :fraudulent_dispute]

    defmodule FraudulentDispute do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `recommended_action` - Recommended action based on the risk score. Possible values are `block` and `continue`. Possible values: `block`, `continue`.
      * `risk_score` - Stripe Radar’s evaluation of the risk level of the payment. Possible values for evaluated payments are between 0 and 100, with higher scores indicating higher risk.
      """
      @type t :: %__MODULE__{
              recommended_action: String.t() | nil,
              risk_score: integer() | nil
            }
      defstruct [:recommended_action, :risk_score]
    end

    def __inner_types__ do
      %{
        "fraudulent_dispute" => __MODULE__.FraudulentDispute
      }
    end
  end

  defmodule Outcome do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `merchant_blocked`
    * `payment_intent_id` - The PaymentIntent ID associated with the payment evaluation. Max length: 5000.
    * `rejected`
    * `succeeded`
    * `type` - Indicates the outcome of the payment evaluation. Possible values: `failed`, `merchant_blocked`, `rejected`, `succeeded`.
    """
    @type t :: %__MODULE__{
            merchant_blocked: __MODULE__.MerchantBlocked.t() | nil,
            payment_intent_id: String.t() | nil,
            rejected: __MODULE__.Rejected.t() | nil,
            succeeded: __MODULE__.Succeeded.t() | nil,
            type: String.t() | nil
          }
    defstruct [:merchant_blocked, :payment_intent_id, :rejected, :succeeded, :type]

    defmodule MerchantBlocked do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `reason` - The reason the payment was blocked by the merchant. Possible values: `authentication_required`, `blocked_for_fraud`, `invalid_payment`, `other`.
      """
      @type t :: %__MODULE__{
              reason: String.t() | nil
            }
      defstruct [:reason]
    end

    defmodule Rejected do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `card`
      """
      @type t :: %__MODULE__{
              card: __MODULE__.Card.t() | nil
            }
      defstruct [:card]

      defmodule Card do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `address_line1_check` - Result of the address line 1 check. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
        * `address_postal_code_check` - Indicates whether the cardholder provided a postal code and if it matched the cardholder’s billing address. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
        * `cvc_check` - Result of the CVC check. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
        * `reason` - Card issuer's reason for the network decline. Possible values: `authentication_failed`, `do_not_honor`, `expired`, `incorrect_cvc`, `incorrect_number`, `incorrect_postal_code`, `insufficient_funds`, `invalid_account`, `lost_card`, `other`, `processing_error`, `reported_stolen`, `try_again_later`.
        """
        @type t :: %__MODULE__{
                address_line1_check: String.t() | nil,
                address_postal_code_check: String.t() | nil,
                cvc_check: String.t() | nil,
                reason: String.t() | nil
              }
        defstruct [:address_line1_check, :address_postal_code_check, :cvc_check, :reason]
      end

      def __inner_types__ do
        %{
          "card" => __MODULE__.Card
        }
      end
    end

    defmodule Succeeded do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `card`
      """
      @type t :: %__MODULE__{
              card: __MODULE__.Card.t() | nil
            }
      defstruct [:card]

      defmodule Card do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `address_line1_check` - Result of the address line 1 check. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
        * `address_postal_code_check` - Indicates whether the cardholder provided a postal code and if it matched the cardholder’s billing address. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
        * `cvc_check` - Result of the CVC check. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
        """
        @type t :: %__MODULE__{
                address_line1_check: String.t() | nil,
                address_postal_code_check: String.t() | nil,
                cvc_check: String.t() | nil
              }
        defstruct [:address_line1_check, :address_postal_code_check, :cvc_check]
      end

      def __inner_types__ do
        %{
          "card" => __MODULE__.Card
        }
      end
    end

    def __inner_types__ do
      %{
        "merchant_blocked" => __MODULE__.MerchantBlocked,
        "rejected" => __MODULE__.Rejected,
        "succeeded" => __MODULE__.Succeeded
      }
    end
  end

  defmodule PaymentDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://docs.stripe.com/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
    * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
    * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
    * `money_movement_details` - Details about the payment's customer presence and type. Nullable.
    * `payment_method_details` - Details about the payment method used for the payment. Nullable.
    * `shipping_details` - Shipping details for the payment evaluation. Nullable.
    * `statement_descriptor` - Payment statement descriptor. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            currency: String.t() | nil,
            description: String.t() | nil,
            money_movement_details: __MODULE__.MoneyMovementDetails.t() | nil,
            payment_method_details: __MODULE__.PaymentMethodDetails.t() | nil,
            shipping_details: __MODULE__.ShippingDetails.t() | nil,
            statement_descriptor: String.t() | nil
          }
    defstruct [
      :amount,
      :currency,
      :description,
      :money_movement_details,
      :payment_method_details,
      :shipping_details,
      :statement_descriptor
    ]

    defmodule MoneyMovementDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `card` - Describes card money movement details for the payment evaluation. Nullable.
      * `money_movement_type` - Describes the type of money movement. Currently only `card` is supported. Possible values: `card`.
      """
      @type t :: %__MODULE__{
              card: __MODULE__.Card.t() | nil,
              money_movement_type: String.t() | nil
            }
      defstruct [:card, :money_movement_type]

      defmodule Card do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `customer_presence` - Describes the presence of the customer during the payment. Possible values: `off_session`, `on_session`. Nullable.
        * `payment_type` - Describes the type of payment. Possible values: `one_off`, `recurring`, `setup_one_off`, `setup_recurring`. Nullable.
        """
        @type t :: %__MODULE__{
                customer_presence: String.t() | nil,
                payment_type: String.t() | nil
              }
        defstruct [:customer_presence, :payment_type]
      end

      def __inner_types__ do
        %{
          "card" => __MODULE__.Card
        }
      end
    end

    defmodule PaymentMethodDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `billing_details` - Billing information associated with the payment evaluation. Nullable.
      * `payment_method` - The payment method used in this payment evaluation.
      """
      @type t :: %__MODULE__{
              billing_details: __MODULE__.BillingDetails.t() | nil,
              payment_method: String.t() | Stripe.Resources.PaymentMethod.t() | nil
            }
      defstruct [:billing_details, :payment_method]

      defmodule BillingDetails do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `address`
        * `email` - Email address. Max length: 5000. Nullable.
        * `name` - Full name. Max length: 5000. Nullable.
        * `phone` - Billing phone number (including extension). Max length: 5000. Nullable.
        """
        @type t :: %__MODULE__{
                address: __MODULE__.Address.t() | nil,
                email: String.t() | nil,
                name: String.t() | nil,
                phone: String.t() | nil
              }
        defstruct [:address, :email, :name, :phone]

        defmodule Address do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
          * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
          * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
          * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
          * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
          * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
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

        def __inner_types__ do
          %{
            "address" => __MODULE__.Address
          }
        end
      end

      def __inner_types__ do
        %{
          "billing_details" => __MODULE__.BillingDetails
        }
      end
    end

    defmodule ShippingDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `address`
      * `name` - Shipping name. Max length: 5000. Nullable.
      * `phone` - Shipping phone number. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              address: __MODULE__.Address.t() | nil,
              name: String.t() | nil,
              phone: String.t() | nil
            }
      defstruct [:address, :name, :phone]

      defmodule Address do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
        * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
        * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
        * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
        * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
        * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
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

      def __inner_types__ do
        %{
          "address" => __MODULE__.Address
        }
      end
    end

    def __inner_types__ do
      %{
        "money_movement_details" => __MODULE__.MoneyMovementDetails,
        "payment_method_details" => __MODULE__.PaymentMethodDetails,
        "shipping_details" => __MODULE__.ShippingDetails
      }
    end
  end

  def __inner_types__ do
    %{
      "client_device_metadata_details" => __MODULE__.ClientDeviceMetadataDetails,
      "customer_details" => __MODULE__.CustomerDetails,
      "events" => __MODULE__.Events,
      "insights" => __MODULE__.Insights,
      "outcome" => __MODULE__.Outcome,
      "payment_details" => __MODULE__.PaymentDetails
    }
  end
end
