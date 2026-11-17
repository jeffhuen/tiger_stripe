# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.MoneyManagement.FinancialAddress do
  @moduledoc """
  Financial Address

  A FinancialAddress contains information needed to transfer money to a Financial Account. A Financial Account can have more than one Financial Address.
  """

  @typedoc """
  * `bank_account` - Bank account details for this FinancialAddress.
  * `created` - The creation timestamp of the FinancialAddress. Format: date-time.
  * `financial_account` - The ID of the FinancialAccount this FinancialAddress corresponds to.
  * `id` - The ID of the FinancialAddress.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.money_management.financial_address`.
  * `settlement_currency`
  * `status` - Closed Enum. The status of the FinancialAddress. Possible values: `active`, `archived`, `failed`, `pending`.
  * `type` - Open Enum. The type of FinancialAddress. Possible values: `bank_account`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :bank_account,
    :created,
    :financial_account,
    :id,
    :livemode,
    :object,
    :settlement_currency,
    :status,
    :type
  ]

  @object_name "v2.money_management.financial_address"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "bank_account" => %{
        fields: %{
          "aba" => %{
            fields: %{
              "account_holder_name" => :scalar,
              "account_number" => :scalar,
              "address" => %{
                fields: %{
                  "city" => :scalar,
                  "country" => :scalar,
                  "line1" => :scalar,
                  "line2" => :scalar,
                  "postal_code" => :scalar,
                  "state" => :scalar,
                  "town" => :scalar
                }
              },
              "bank_name" => :scalar,
              "routing_number" => :scalar
            }
          },
          "country" => :scalar,
          "currency" => :scalar,
          "iban" => %{
            fields: %{
              "account_holder_name" => :scalar,
              "bank_name" => :scalar,
              "iban" => :scalar
            }
          },
          "sort_code" => %{
            fields: %{
              "account_holder_name" => :scalar,
              "account_number" => :scalar,
              "sort_code" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
