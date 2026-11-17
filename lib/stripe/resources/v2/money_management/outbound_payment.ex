# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.OutboundPayment do
  @moduledoc """
  Outbound Payment

  OutboundPayment represents a single money movement from one FinancialAccount you own to a payout method someone else owns.
  """

  @typedoc """
  * `amount` - The amount and currency requested for this OutboundPayment.
  * `cancelable` - Returns true if the OutboundPayment can be canceled, and false otherwise.
  * `created` - Time at which the OutboundPayment was created.
  Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `description` - An arbitrary string attached to the OutboundPayment. Often useful for displaying to users.
  * `expected_arrival_date` - The date when funds are expected to arrive in the payout method. This field is not set if the payout method is in a `failed`, `canceled`, or `returned` state.
  Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `from` - The FinancialAccount that funds were pulled from.
  * `id` - Unique identifier for the OutboundPayment.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.outbound_payment`.
  * `payout_intent` - The PayoutIntent ID that triggered this OutboundPayment.
  * `recipient_notification` - Details about the OutboundPayment notification settings for recipient.
  * `recipient_verification` - The ID of the RecipientVerification for this OutboundPayment. Required where recipient-name verification is mandated before creating an OutboundPayment.
  * `statement_descriptor` - The description that appears on the receiving end of an OutboundPayment (for example, on a bank statement). Defaults to `STRIPE` if not configured in the account settings.
  * `status` - Current status of the OutboundPayment.
  An OutboundPayment is `processing` after creation. It becomes `posted` when funds leave the account,
  `failed` if it cannot be sent, `canceled` if canceled before posting, or `returned` if the funds are returned. Possible values: `canceled`, `failed`, `posted`, `processing`, `returned`.
  * `status_details` - Status details for an OutboundPayment in a `processing`, `failed`, or `returned` state.
  * `status_transitions` - Hash containing timestamps of when the object transitioned to a particular status.
  * `to` - To which payout method the OutboundPayment was sent.
  * `tracking_details` - Information to track this OutboundPayment with the recipient bank.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :cancelable,
    :created,
    :description,
    :expected_arrival_date,
    :from,
    :id,
    :livemode,
    :metadata,
    :object,
    :payout_intent,
    :recipient_notification,
    :recipient_verification,
    :statement_descriptor,
    :status,
    :status_details,
    :status_transitions,
    :to,
    :tracking_details
  ]

  @object_name "v2.money_management.outbound_payment"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "amount" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "from" => %{
        fields: %{
          "debited" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "financial_account" => :scalar
        }
      },
      "recipient_notification" => %{
        fields: %{
          "setting" => :scalar
        }
      },
      "status_details" => %{
        fields: %{
          "failed" => %{
            fields: %{
              "reason" => :scalar
            }
          },
          "processing" => %{
            fields: %{
              "reason" => :scalar
            }
          },
          "returned" => %{
            fields: %{
              "reason" => :scalar
            }
          }
        }
      },
      "status_transitions" => %{
        fields: %{
          "canceled_at" => :scalar,
          "failed_at" => :scalar,
          "posted_at" => :scalar,
          "returned_at" => :scalar
        }
      },
      "to" => %{
        fields: %{
          "credited" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "payout_method" => :scalar,
          "payout_method_options" => %{
            fields: %{
              "bank_account" => %{
                fields: %{
                  "preferred_network_options" => %{
                    fields: %{
                      "ach" => %{
                        fields: %{
                          "submission" => :scalar,
                          "transaction_purpose" => :scalar
                        }
                      }
                    }
                  },
                  "preferred_networks" => {:list, :scalar}
                }
              }
            }
          },
          "recipient" => :scalar
        }
      },
      "tracking_details" => %{
        fields: %{
          "bank_account" => %{
            fields: %{
              "trace_id" => :scalar
            }
          },
          "card" => %{
            fields: %{
              "retrieval_reference" => :scalar
            }
          },
          "status" => :scalar,
          "type" => :scalar
        }
      }
    }
  end
end
