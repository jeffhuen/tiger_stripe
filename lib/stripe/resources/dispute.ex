# File generated from our OpenAPI spec
defmodule Stripe.Resources.Dispute do
  @moduledoc """
  Dispute

  A dispute occurs when a customer questions your charge with their card issuer.
  When this happens, you have the opportunity to respond to the dispute with
  evidence that shows that the charge is legitimate.

  Related guide: [Disputes and fraud](https://docs.stripe.com/disputes)
  """

  @typedoc """
  * `amount` - Disputed amount. Usually the amount of the charge, but it can differ (usually because of currency fluctuation or because only part of the order is disputed).
  * `balance_transactions` - List of zero, one, or two balance transactions that show funds withdrawn and reinstated to your Stripe account as a result of this dispute. Expandable.
  * `charge` - ID of the charge that's disputed. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `enhanced_eligibility_types` - List of eligibility types that are included in `enhanced_evidence`.
  * `evidence` - Expandable.
  * `evidence_details` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `is_charge_refundable` - If true, it's still possible to refund the disputed payment. After the payment has been fully refunded, no further funds are withdrawn from your Stripe account as a result of this dispute.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `network_reason_code` - Network-dependent reason code for the dispute. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `dispute`.
  * `payment_intent` - ID of the PaymentIntent that's disputed. Nullable. Expandable.
  * `payment_method_details` - Expandable.
  * `reason` - Reason given by cardholder for dispute. Possible values are `bank_cannot_process`, `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`, `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`, `noncompliant`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`. Learn more about [dispute reasons](https://docs.stripe.com/disputes/categories). Max length: 5000.
  * `status` - The current status of a dispute. Possible values include:`warning_needs_response`, `warning_under_review`, `warning_closed`, `needs_response`, `under_review`, `won`, `lost`, or `prevented`. Possible values: `lost`, `needs_response`, `prevented`, `under_review`, `warning_closed`, `warning_needs_response`, `warning_under_review`, `won`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :balance_transactions,
    :charge,
    :created,
    :currency,
    :enhanced_eligibility_types,
    :evidence,
    :evidence_details,
    :id,
    :is_charge_refundable,
    :livemode,
    :metadata,
    :network_reason_code,
    :object,
    :payment_intent,
    :payment_method_details,
    :reason,
    :status
  ]

  @object_name "dispute"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "balance_transactions",
      "charge",
      "evidence",
      "evidence_details",
      "payment_intent",
      "payment_method_details"
    ]

  def __nested_fields__ do
    %{
      "evidence" => %{
        fields: %{
          "access_activity_log" => :scalar,
          "billing_address" => :scalar,
          "cancellation_policy" => {:resource, Stripe.Resources.File},
          "cancellation_policy_disclosure" => :scalar,
          "cancellation_rebuttal" => :scalar,
          "customer_communication" => {:resource, Stripe.Resources.File},
          "customer_email_address" => :scalar,
          "customer_name" => :scalar,
          "customer_purchase_ip" => :scalar,
          "customer_signature" => {:resource, Stripe.Resources.File},
          "duplicate_charge_documentation" => {:resource, Stripe.Resources.File},
          "duplicate_charge_explanation" => :scalar,
          "duplicate_charge_id" => :scalar,
          "enhanced_evidence" => %{
            fields: %{
              "mastercard_compliance" => %{
                fields: %{
                  "fee_acknowledged" => :scalar
                }
              },
              "visa_compelling_evidence_3" => %{
                fields: %{
                  "disputed_transaction" => %{
                    fields: %{
                      "customer_account_id" => :scalar,
                      "customer_device_fingerprint" => :scalar,
                      "customer_device_id" => :scalar,
                      "customer_email_address" => :scalar,
                      "customer_purchase_ip" => :scalar,
                      "merchandise_or_services" => :scalar,
                      "product_description" => :scalar,
                      "shipping_address" => %{
                        fields: %{
                          "city" => :scalar,
                          "country" => :scalar,
                          "line1" => :scalar,
                          "line2" => :scalar,
                          "postal_code" => :scalar,
                          "state" => :scalar
                        }
                      }
                    }
                  },
                  "prior_undisputed_transactions" =>
                    {:list,
                     %{
                       fields: %{
                         "charge" => :scalar,
                         "customer_account_id" => :scalar,
                         "customer_device_fingerprint" => :scalar,
                         "customer_device_id" => :scalar,
                         "customer_email_address" => :scalar,
                         "customer_purchase_ip" => :scalar,
                         "product_description" => :scalar,
                         "shipping_address" => %{
                           fields: %{
                             "city" => :scalar,
                             "country" => :scalar,
                             "line1" => :scalar,
                             "line2" => :scalar,
                             "postal_code" => :scalar,
                             "state" => :scalar
                           }
                         }
                       }
                     }}
                }
              },
              "visa_compliance" => %{
                fields: %{
                  "fee_acknowledged" => :scalar
                }
              }
            }
          },
          "product_description" => :scalar,
          "receipt" => {:resource, Stripe.Resources.File},
          "refund_policy" => {:resource, Stripe.Resources.File},
          "refund_policy_disclosure" => :scalar,
          "refund_refusal_explanation" => :scalar,
          "service_date" => :scalar,
          "service_documentation" => {:resource, Stripe.Resources.File},
          "shipping_address" => :scalar,
          "shipping_carrier" => :scalar,
          "shipping_date" => :scalar,
          "shipping_documentation" => {:resource, Stripe.Resources.File},
          "shipping_tracking_number" => :scalar,
          "uncategorized_file" => {:resource, Stripe.Resources.File},
          "uncategorized_text" => :scalar
        }
      },
      "evidence_details" => %{
        fields: %{
          "due_by" => :scalar,
          "enhanced_eligibility" => %{
            fields: %{
              "mastercard_compliance" => %{
                fields: %{
                  "status" => :scalar
                }
              },
              "visa_compelling_evidence_3" => %{
                fields: %{
                  "required_actions" => {:list, :scalar},
                  "status" => :scalar
                }
              },
              "visa_compliance" => %{
                fields: %{
                  "status" => :scalar
                }
              }
            }
          },
          "has_evidence" => :scalar,
          "past_due" => :scalar,
          "submission_count" => :scalar
        }
      },
      "payment_method_details" => %{
        fields: %{
          "amazon_pay" => %{
            fields: %{
              "dispute_type" => :scalar
            }
          },
          "card" => %{
            fields: %{
              "brand" => :scalar,
              "case_type" => :scalar,
              "network" => :scalar,
              "network_reason_code" => :scalar
            }
          },
          "klarna" => %{
            fields: %{
              "chargeback_loss_reason_code" => :scalar,
              "reason_code" => :scalar
            }
          },
          "paypal" => %{
            fields: %{
              "case_id" => :scalar,
              "reason_code" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
