# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.ReceivedCredit do
  @moduledoc """
  Received Credit

  Use ReceivedCredits API to retrieve information on when, where, and how funds are sent into your FinancialAccount.
  """

  @typedoc """
  * `amount` - The amount and currency credited to the FinancialAccount.
  * `amount_received` - The amount and currency Stripe received from the external source, before any conversion or fees.
  * `balance_transfer` - This object stores details about the originating Stripe transaction that resulted in the ReceivedCredit. Present if `type` field value is `balance_transfer`.
  * `bank_transfer` - This object stores details about the originating banking transaction that resulted in the ReceivedCredit. Present if `type` field value is `bank_transfer`.
  * `created` - Time at which the ReceivedCredit was created.
  Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `description` - Freeform string set by originator of the ReceivedCredit.
  * `financial_account` - Financial Account ID on which funds for ReceivedCredit were received.
  * `id` - Unique identifier for the ReceivedCredit.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.received_credit`.
  * `status` - Open Enum. The status of the ReceivedCredit. Possible values: `failed`, `pending`, `returned`, `succeeded`.
  * `status_details` - This hash contains detailed information that elaborates on the specific status of the ReceivedCredit. e.g the reason behind a failure if the status is marked as `failed`.
  * `status_transitions` - Hash containing timestamps of when the object transitioned to a particular status.
  * `type` - Open Enum. The type of flow that caused the ReceivedCredit. Possible values: `balance_transfer`, `bank_transfer`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :amount_received,
    :balance_transfer,
    :bank_transfer,
    :created,
    :description,
    :financial_account,
    :id,
    :livemode,
    :object,
    :status,
    :status_details,
    :status_transitions,
    :type
  ]

  @object_name "v2.money_management.received_credit"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "amount" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "amount_received" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "balance_transfer" => %{
        fields: %{
          "from_account" => :scalar,
          "outbound_payment" => :scalar,
          "outbound_transfer" => :scalar,
          "payout" => :scalar,
          "transfer" => :scalar,
          "type" => :scalar
        }
      },
      "bank_transfer" => %{
        fields: %{
          "financial_address" => :scalar,
          "network" => :scalar,
          "originating_bank_account" => %{
            fields: %{
              "aba" => %{
                fields: %{
                  "account_holder_name" => :scalar,
                  "bank_name" => :scalar,
                  "last4" => :scalar,
                  "routing_number" => :scalar
                }
              },
              "iban" => %{
                fields: %{
                  "account_holder_name" => :scalar,
                  "bank_name" => :scalar,
                  "bic" => :scalar,
                  "country" => :scalar,
                  "iban" => :scalar
                }
              },
              "sort_code" => %{
                fields: %{
                  "account_holder_name" => :scalar,
                  "bank_name" => :scalar,
                  "last4" => :scalar,
                  "sort_code" => :scalar
                }
              },
              "type" => :scalar
            }
          },
          "statement_descriptor" => :scalar
        }
      },
      "status_details" => %{
        fields: %{
          "failed" => %{
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
          "failed_at" => :scalar,
          "returned_at" => :scalar,
          "succeeded_at" => :scalar
        }
      }
    }
  end
end
