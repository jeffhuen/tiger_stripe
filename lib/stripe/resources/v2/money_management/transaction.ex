# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.Transaction do
  @moduledoc """
  Transaction

  A Transaction records how a money movement flow affects your FinancialAccount balance.
  A flow can create one or more Transactions.
  """

  @typedoc """
  * `amount` - The amount of the Transaction.
  * `balance_impact` - The change to the FinancialAccount's balance. This is the sum of the balance impacts of this Transaction's
  TransactionEntries with `effective_at` timestamps in the past.
  * `category` - Open Enum. A category used to classify the Transaction. Possible values: `adjustment`, `currency_conversion`, `inbound_transfer`, `inbound_transfer_reversal`, `outbound_payment`, `outbound_payment_reversal`, `outbound_transfer`, `outbound_transfer_reversal`, `received_credit`, `received_credit_reversal`, `received_debit`, `received_debit_reversal`, `stripe_fee`, `stripe_fee_tax`.
  * `counterparty` - Details about the counterparty to this Transaction.
  * `created` - Time at which the object was created. Represented as an RFC 3339 timestamp in UTC with millisecond precision, for example `2022-09-18T13:22:18.123Z`. Format: date-time.
  * `description` - A description of the Transaction. When applicable, the description is copied from the flow object when
  the Transaction is created. You can update it using the Update Transaction endpoint.
  * `financial_account` - The ID of the FinancialAccount affected by this Transaction.
  * `flow` - Details about the flow object that created the Transaction, such as an InboundTransfer or OutboundPayment.
  `flow.type` identifies the kind of object. The corresponding field contains its ID, when available:
  for an InboundTransfer, `flow.inbound_transfer` contains the InboundTransfer's ID. Pass that ID to
  the `flow` parameter on List Transactions.
  * `id` - Unique identifier for the object.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of key-value pairs that you can attach to an object. This can be useful for storing additional information
  about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.transaction`.
  * `regulatory_receipt` - Hosted transaction receipt that is provided when money movement is considered regulated under Stripe's money transmission licenses. If not applicable, `regulatory_receipt.status` will be `not_applicable` and no URL will be provided unless you opt in by calling `/refresh_regulatory_receipt`.
  * `status` - Closed Enum. The current status of the Transaction.
  A Transaction is `pending` if either `balance_impact.inbound_pending` or `balance_impact.outbound_pending` is non-zero.
  A Transaction is `posted` if only `balance_impact.available` is non-zero.
  A Transaction is `void` if there is no balance impact.
  `posted` and `void` are terminal states, and no additional TransactionEntries will be added to the Transaction. Possible values: `pending`, `posted`, `void`.
  * `status_transitions` - Timestamps for when the Transaction transitioned to each status.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :balance_impact,
    :category,
    :counterparty,
    :created,
    :description,
    :financial_account,
    :flow,
    :id,
    :livemode,
    :metadata,
    :object,
    :regulatory_receipt,
    :status,
    :status_transitions
  ]

  @object_name "v2.money_management.transaction"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "amount" => %{
        fields: %{
          "currency" => :scalar,
          "value" => :scalar
        }
      },
      "balance_impact" => %{
        fields: %{
          "available" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "inbound_pending" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "outbound_pending" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "counterparty" => %{
        fields: %{
          "name" => :scalar
        }
      },
      "flow" => %{
        fields: %{
          "adjustment" => :scalar,
          "currency_conversion" => :scalar,
          "fee_batch" => :scalar,
          "inbound_transfer" => :scalar,
          "outbound_payment" => :scalar,
          "outbound_transfer" => :scalar,
          "received_credit" => :scalar,
          "received_debit" => :scalar,
          "type" => :scalar
        }
      },
      "regulatory_receipt" => %{
        fields: %{
          "status" => :scalar,
          "url" => :scalar,
          "url_expires_at" => :scalar
        }
      },
      "status_transitions" => %{
        fields: %{
          "posted_at" => :scalar,
          "void_at" => :scalar
        }
      }
    }
  end
end
