# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.InboundTransfer do
  @moduledoc """
  Inbound Transfer

  An InboundTransfer object, representing a money movement from a
  user owned PaymentMethod to a FinancialAccount belonging to the same user.
  """

  @typedoc """
  * `amount` - The amount in specified currency that will land in the FinancialAccount balance.
  * `created` - Creation time of the InboundTransfer. Represented as a RFC 3339 date & time UTC value in millisecond precision, for example: 2022-09-18T13:22:18.123Z. Format: date-time.
  * `description` - A freeform text field provided by user, containing metadata.
  * `from` - A nested object containing information about the origin of the InboundTransfer.
  * `id` - Unique identifier for the InboundTransfer.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.inbound_transfer`.
  * `to` - A nested object containing information about the destination of the InboundTransfer.
  * `transfer_history` - A list of history objects, representing changes in the state of the InboundTransfer. The most recent entry's type indicates the current status of the InboundTransfer.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :created,
    :description,
    :from,
    :id,
    :livemode,
    :object,
    :to,
    :transfer_history
  ]

  @object_name "v2.money_management.inbound_transfer"
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
          "payment_method" => %{
            fields: %{
              "type" => :scalar,
              "us_bank_account" => :scalar
            }
          }
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
          "financial_account" => :scalar
        }
      },
      "transfer_history" => %{
        fields: %{
          "bank_debit_failed" => %{
            fields: %{
              "failure_reason" => :scalar
            }
          },
          "bank_debit_processing" => :scalar,
          "bank_debit_queued" => :scalar,
          "bank_debit_returned" => %{
            fields: %{
              "return_reason" => :scalar
            }
          },
          "bank_debit_succeeded" => :scalar,
          "created" => :scalar,
          "effective_at" => :scalar,
          "id" => :scalar,
          "type" => :scalar
        }
      }
    }
  end
end
