# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.PayoutIntent do
  @moduledoc """
  Payout Intent

  PayoutIntent represents an intent to send funds from a Financial Account to a payout method.
  """

  @typedoc """
  * `amount` - The monetary amount to be sent.
  * `confirmation_method` - Controls whether the PayoutIntent requires explicit confirmation before transitioning to `pending`.
  Even when `automatic`, regulatory requirements may require confirmation. See [Send money with Global Payouts](https://docs.stripe.com/global-payouts/send-money) for details. Possible values: `automatic`, `manual`.
  * `created` - Time at which the PayoutIntent was created.
  Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `description` - An arbitrary string attached to the PayoutIntent. Often useful for displaying to users.
  * `estimated_fees` - Estimated fees and taxes.
  * `from` - The FinancialAccount that funds are pulled from.
  * `fx_quote` - FX rate information for fee transparency.
  * `id` - Unique identifier for the PayoutIntent.
  * `latest_payout` - Details about the latest payout associated with this PayoutIntent.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `next_action` - Next action required for a PayoutIntent in the `requires_action` state. Populated when `status` is `requires_action`.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.payout_intent`.
  * `recipient_notification` - Recipient notification settings for the PayoutIntent. Only applicable when the PayoutIntent creates an OutboundPayment.
  * `recipient_verification` - Recipient verification details for this PayoutIntent.
  * `schedule_options` - Scheduling options for the payout. If omitted, the payout is scheduled for immediate execution.
  * `statement_descriptor` - The description that appears on the receiving end for the payout (for example, on a bank statement).
  * `status` - Current status of the PayoutIntent. Possible values: `canceled`, `pending`, `posted`, `processing`, `requires_action`.
  * `status_transitions` - Hash containing timestamps of when transitioned to a particular status.
  * `to` - To which payout method the payout is sent.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :confirmation_method,
    :created,
    :description,
    :estimated_fees,
    :from,
    :fx_quote,
    :id,
    :latest_payout,
    :livemode,
    :metadata,
    :next_action,
    :object,
    :recipient_notification,
    :recipient_verification,
    :schedule_options,
    :statement_descriptor,
    :status,
    :status_transitions,
    :to
  ]

  @object_name "v2.money_management.payout_intent"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "amount" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "estimated_fees" => %{
        fields: %{
          "amount" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "network_fee_details" => %{
            fields: %{
              "network" => :scalar,
              "network_options" => %{
                fields: %{
                  "ach" => %{
                    fields: %{
                      "submission" => :scalar
                    }
                  }
                }
              }
            }
          },
          "tax_amount" => %{
            fields: %{
              "currency" => :scalar,
              "value_decimal" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "from" => %{
        fields: %{
          "currency" => :scalar,
          "debited" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "financial_account" => :scalar
        }
      },
      "fx_quote" => %{
        fields: %{
          "lock_duration" => :scalar,
          "lock_expires_at" => :scalar,
          "lock_status" => :scalar,
          "rates" =>
            {:map,
             %{
               fields: %{
                 "exchange_rate" => :scalar
               }
             }},
          "to_currency" => :scalar
        }
      },
      "latest_payout" => %{
        fields: %{
          "outbound_payment" => :scalar,
          "outbound_transfer" => :scalar,
          "type" => :scalar
        }
      },
      "next_action" => %{
        fields: %{
          "confirm" => %{
            fields: %{
              "fields_to_review" => {:list, :scalar},
              "reason" => :scalar
            }
          },
          "handle_failure" => %{
            fields: %{
              "failure_reason" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "recipient_notification" => %{
        fields: %{
          "setting" => :scalar
        }
      },
      "recipient_verification" => %{
        fields: %{
          "match_result" => :scalar,
          "match_result_details" => %{
            fields: %{
              "matched_business_type" => :scalar,
              "matched_name" => :scalar,
              "message" => :scalar,
              "provided_business_type" => :scalar,
              "provided_name" => :scalar
            }
          }
        }
      },
      "schedule_options" => %{
        fields: %{
          "execute_on" => :scalar
        }
      },
      "status_transitions" => %{
        fields: %{
          "canceled_at" => :scalar,
          "posted_at" => :scalar,
          "processing_at" => :scalar,
          "requires_action_at" => :scalar
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
          "currency" => :scalar,
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
      }
    }
  end
end
