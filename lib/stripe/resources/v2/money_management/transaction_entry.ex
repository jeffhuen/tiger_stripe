# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.TransactionEntry do
  @moduledoc """
  Transaction Entry

  TransactionEntries model funds moving between availability states for a given Transaction.
  """

  @typedoc """
  * `balance_impact` - The change to the FinancialAccount's balance that takes effect at this TransactionEntry's `effective_at` timestamp.
  * `created` - Time at which the object was created. Represented as an RFC 3339 timestamp in UTC with millisecond precision, for example `2022-09-18T13:22:18.123Z`. Format: date-time.
  * `effective_at` - Time at which the TransactionEntry affects the FinancialAccount balance. This can be in the past or future. Format: date-time.
  * `id` - Unique identifier for the object.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.transaction_entry`.
  * `transaction` - The ID of the Transaction that this TransactionEntry belongs to.
  * `transaction_details` - Details copied from the Transaction that this TransactionEntry belongs to.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :balance_impact,
    :created,
    :effective_at,
    :id,
    :livemode,
    :object,
    :transaction,
    :transaction_details
  ]

  @object_name "v2.money_management.transaction_entry"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
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
      "transaction_details" => %{
        fields: %{
          "category" => :scalar,
          "financial_account" => :scalar,
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
          }
        }
      }
    }
  end
end
