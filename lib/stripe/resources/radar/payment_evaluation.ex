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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `radar.payment_evaluation`.
  * `outcome` - Indicates the final outcome for the payment evaluation. Nullable. Expandable.
  * `payment_details` - Expandable.
  * `recommended_action` - Recommended action based on the score of the fraudulent_payment signal. Possible values are `block` and `continue`. Possible values: `block`, `continue`.
  * `signals` - Expandable.
  """
  @type t :: %__MODULE__{
          client_device_metadata_details: client_device_metadata_details() | nil,
          created_at: integer(),
          customer_details: customer_details() | nil,
          events: [events()] | nil,
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          outcome: outcome() | nil,
          payment_details: payment_details() | nil,
          recommended_action: String.t(),
          signals: signals()
        }

  defstruct [
    :client_device_metadata_details,
    :created_at,
    :customer_details,
    :events,
    :id,
    :livemode,
    :metadata,
    :object,
    :outcome,
    :payment_details,
    :recommended_action,
    :signals
  ]

  @object_name "radar.payment_evaluation"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "client_device_metadata_details",
      "customer_details",
      "events",
      "outcome",
      "payment_details",
      "signals"
    ]

  @typedoc """
  * `radar_session` - ID for the Radar Session associated with the payment evaluation. A [Radar Session](https://docs.stripe.com/radar/radar-session) is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments. Max length: 5000.
  """
  @type client_device_metadata_details :: %{
          optional(:radar_session) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer` - The ID of the customer associated with the payment evaluation. Max length: 5000. Nullable.
  * `customer_account` - The ID of the Account representing the customer associated with the payment evaluation. Max length: 5000. Nullable.
  * `email` - The customer's email address. Max length: 5000. Nullable.
  * `name` - The customer's full name or business name. Max length: 5000. Nullable.
  * `phone` - The customer's phone number. Max length: 5000. Nullable.
  """
  @type customer_details :: %{
          optional(:customer) => String.t() | nil,
          optional(:customer_account) => String.t() | nil,
          optional(:email) => String.t() | nil,
          optional(:name) => String.t() | nil,
          optional(:phone) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `dispute_opened`
  * `early_fraud_warning_received`
  * `occurred_at` - Timestamp when the event occurred. Format: Unix timestamp.
  * `refunded`
  * `type` - Indicates the type of event attached to the payment evaluation. Possible values: `dispute_opened`, `early_fraud_warning_received`, `refunded`, `user_intervention_raised`, `user_intervention_resolved`.
  * `user_intervention_raised`
  * `user_intervention_resolved`
  """
  @type events :: %{
          optional(:dispute_opened) => events_dispute_opened() | nil,
          optional(:early_fraud_warning_received) => events_early_fraud_warning_received() | nil,
          optional(:occurred_at) => integer() | nil,
          optional(:refunded) => events_refunded() | nil,
          optional(:type) => String.t() | nil,
          optional(:user_intervention_raised) => events_user_intervention_raised() | nil,
          optional(:user_intervention_resolved) => events_user_intervention_resolved() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount to dispute for this payment. A positive integer representing how much to charge in [the smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (for example, 100 cents to charge 1.00 USD or 100 to charge 100 Yen, a zero-decimal currency).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `reason` - Reason given by cardholder for dispute. Possible values: `account_not_available`, `credit_not_processed`, `customer_initiated`, `duplicate`, `fraudulent`, `general`, `noncompliant`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, `unrecognized`.
  """
  @type events_dispute_opened :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fraud_type` - The type of fraud labeled by the issuer. Possible values: `made_with_lost_card`, `made_with_stolen_card`, `other`, `unauthorized_use_of_card`.
  """
  @type events_early_fraud_warning_received :: %{
          optional(:fraud_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount refunded for this payment. A positive integer representing how much to charge in [the smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (for example, 100 cents to charge 1.00 USD or 100 to charge 100 Yen, a zero-decimal currency).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `reason` - Indicates the reason for the refund. Possible values: `duplicate`, `fraudulent`, `other`, `requested_by_customer`.
  """
  @type events_refunded :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `custom`
  * `key` - Unique identifier for the user intervention event. Max length: 5000.
  * `type` - Type of user intervention raised. Possible values: `3ds`, `captcha`, `custom`.
  """
  @type events_user_intervention_raised :: %{
          optional(:custom) => events_user_intervention_raised_custom() | nil,
          optional(:key) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `type` - Custom type of user intervention raised. The string must use a snake case description for the type of intervention performed. Max length: 5000.
  """
  @type events_user_intervention_raised_custom :: %{
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `key` - Unique ID of this intervention. Use this to provide the result. Max length: 5000.
  * `outcome` - Result of the intervention if it has been completed. Possible values: `abandoned`, `failed`, `passed`. Nullable.
  """
  @type events_user_intervention_resolved :: %{
          optional(:key) => String.t() | nil,
          optional(:outcome) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `merchant_blocked`
  * `payment_intent_id` - The PaymentIntent ID associated with the payment evaluation. Max length: 5000.
  * `rejected`
  * `succeeded`
  * `type` - Indicates the outcome of the payment evaluation. Possible values: `failed`, `merchant_blocked`, `rejected`, `succeeded`.
  """
  @type outcome :: %{
          optional(:merchant_blocked) => outcome_merchant_blocked() | nil,
          optional(:payment_intent_id) => String.t() | nil,
          optional(:rejected) => outcome_rejected() | nil,
          optional(:succeeded) => outcome_succeeded() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `reason` - The reason the payment was blocked by the merchant. Possible values: `authentication_required`, `blocked_for_fraud`, `invalid_payment`, `other`.
  """
  @type outcome_merchant_blocked :: %{
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card`
  """
  @type outcome_rejected :: %{
          optional(:card) => outcome_rejected_card() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address_line1_check` - Result of the address line 1 check. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
  * `address_postal_code_check` - Indicates whether the cardholder provided a postal code and if it matched the cardholder’s billing address. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
  * `cvc_check` - Result of the CVC check. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
  * `reason` - Card issuer's reason for the network decline. Possible values: `authentication_failed`, `do_not_honor`, `expired`, `incorrect_cvc`, `incorrect_number`, `incorrect_postal_code`, `insufficient_funds`, `invalid_account`, `lost_card`, `other`, `processing_error`, `reported_stolen`, `try_again_later`.
  """
  @type outcome_rejected_card :: %{
          optional(:address_line1_check) => String.t() | nil,
          optional(:address_postal_code_check) => String.t() | nil,
          optional(:cvc_check) => String.t() | nil,
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card`
  """
  @type outcome_succeeded :: %{
          optional(:card) => outcome_succeeded_card() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address_line1_check` - Result of the address line 1 check. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
  * `address_postal_code_check` - Indicates whether the cardholder provided a postal code and if it matched the cardholder’s billing address. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
  * `cvc_check` - Result of the CVC check. Possible values: `fail`, `pass`, `unavailable`, `unchecked`.
  """
  @type outcome_succeeded_card :: %{
          optional(:address_line1_check) => String.t() | nil,
          optional(:address_postal_code_check) => String.t() | nil,
          optional(:cvc_check) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://docs.stripe.com/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `money_movement_details` - Details about the payment's customer presence and type. Nullable.
  * `payment_method_details` - Details about the payment method used for the payment. Nullable.
  * `shipping_details` - Shipping details for the payment evaluation. Nullable.
  * `statement_descriptor` - Payment statement descriptor. Max length: 5000. Nullable.
  """
  @type payment_details :: %{
          optional(:amount) => integer() | nil,
          optional(:currency) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:money_movement_details) => payment_details_money_movement_details() | nil,
          optional(:payment_method_details) => payment_details_payment_method_details() | nil,
          optional(:shipping_details) => payment_details_shipping_details() | nil,
          optional(:statement_descriptor) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `card` - Describes card money movement details for the payment evaluation. Nullable.
  * `money_movement_type` - Describes the type of money movement. Currently only `card` is supported. Possible values: `card`.
  """
  @type payment_details_money_movement_details :: %{
          optional(:card) => payment_details_money_movement_details_card() | nil,
          optional(:money_movement_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `customer_presence` - Describes the presence of the customer during the payment. Possible values: `off_session`, `on_session`. Nullable.
  * `payment_type` - Describes the type of payment. Possible values: `one_off`, `recurring`, `setup_one_off`, `setup_recurring`. Nullable.
  """
  @type payment_details_money_movement_details_card :: %{
          optional(:customer_presence) => String.t() | nil,
          optional(:payment_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `billing_details` - Billing information associated with the payment evaluation. Nullable.
  * `payment_method` - The payment method used in this payment evaluation.
  """
  @type payment_details_payment_method_details :: %{
          optional(:billing_details) =>
            payment_details_payment_method_details_billing_details() | nil,
          optional(:payment_method) => String.t() | Stripe.Resources.PaymentMethod.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address`
  * `email` - Email address. Max length: 5000. Nullable.
  * `name` - Full name. Max length: 5000. Nullable.
  * `phone` - Billing phone number (including extension). Max length: 5000. Nullable.
  """
  @type payment_details_payment_method_details_billing_details :: %{
          optional(:address) =>
            payment_details_payment_method_details_billing_details_address() | nil,
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
  @type payment_details_payment_method_details_billing_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address`
  * `name` - Shipping name. Max length: 5000. Nullable.
  * `phone` - Shipping phone number. Max length: 5000. Nullable.
  """
  @type payment_details_shipping_details :: %{
          optional(:address) => payment_details_shipping_details_address() | nil,
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
  @type payment_details_shipping_details_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `fraudulent_payment`
  """
  @type signals :: %{
          optional(:fraudulent_payment) => signals_fraudulent_payment() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `evaluated_at` - The time when this signal was evaluated. Format: Unix timestamp.
  * `risk_level` - Risk level of this signal, based on the score. Possible values: `elevated`, `highest`, `normal`.
  * `score` - Score for this insight. Possible values for evaluated payments are -1 and any value between 0 and 100. The value is returned with two decimal places. A score of -1 indicates a test integration and higher scores indicate a higher likelihood of the signal being true.
  """
  @type signals_fraudulent_payment :: %{
          optional(:evaluated_at) => integer() | nil,
          optional(:risk_level) => String.t() | nil,
          optional(:score) => float() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "client_device_metadata_details" => %{
        fields: %{
          "radar_session" => :scalar
        }
      },
      "customer_details" => %{
        fields: %{
          "customer" => :scalar,
          "customer_account" => :scalar,
          "email" => :scalar,
          "name" => :scalar,
          "phone" => :scalar
        }
      },
      "events" => %{
        fields: %{
          "dispute_opened" => %{
            fields: %{
              "amount" => :scalar,
              "currency" => :scalar,
              "reason" => :scalar
            }
          },
          "early_fraud_warning_received" => %{
            fields: %{
              "fraud_type" => :scalar
            }
          },
          "occurred_at" => :scalar,
          "refunded" => %{
            fields: %{
              "amount" => :scalar,
              "currency" => :scalar,
              "reason" => :scalar
            }
          },
          "type" => :scalar,
          "user_intervention_raised" => %{
            fields: %{
              "custom" => %{
                fields: %{
                  "type" => :scalar
                }
              },
              "key" => :scalar,
              "type" => :scalar
            }
          },
          "user_intervention_resolved" => %{
            fields: %{
              "key" => :scalar,
              "outcome" => :scalar
            }
          }
        }
      },
      "outcome" => %{
        fields: %{
          "merchant_blocked" => %{
            fields: %{
              "reason" => :scalar
            }
          },
          "payment_intent_id" => :scalar,
          "rejected" => %{
            fields: %{
              "card" => %{
                fields: %{
                  "address_line1_check" => :scalar,
                  "address_postal_code_check" => :scalar,
                  "cvc_check" => :scalar,
                  "reason" => :scalar
                }
              }
            }
          },
          "succeeded" => %{
            fields: %{
              "card" => %{
                fields: %{
                  "address_line1_check" => :scalar,
                  "address_postal_code_check" => :scalar,
                  "cvc_check" => :scalar
                }
              }
            }
          },
          "type" => :scalar
        }
      },
      "payment_details" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar,
          "description" => :scalar,
          "money_movement_details" => %{
            fields: %{
              "card" => %{
                fields: %{
                  "customer_presence" => :scalar,
                  "payment_type" => :scalar
                }
              },
              "money_movement_type" => :scalar
            }
          },
          "payment_method_details" => %{
            fields: %{
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
              "payment_method" => {:resource, Stripe.Resources.PaymentMethod}
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
          },
          "statement_descriptor" => :scalar
        }
      },
      "signals" => %{
        fields: %{
          "fraudulent_payment" => %{
            fields: %{
              "evaluated_at" => :scalar,
              "risk_level" => :scalar,
              "score" => :scalar
            }
          }
        }
      }
    }
  end
end
