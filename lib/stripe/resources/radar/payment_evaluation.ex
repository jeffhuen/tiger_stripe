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
  @type t :: %__MODULE__{}

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
      "insights" => %{
        fields: %{
          "card_issuer_decline" => %{
            fields: %{
              "model_score" => :scalar,
              "recommended_action" => :scalar
            }
          },
          "evaluated_at" => :scalar,
          "fraudulent_dispute" => %{
            fields: %{
              "recommended_action" => :scalar,
              "risk_score" => :scalar
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
      }
    }
  end
end
