# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.CreditBalance do
  @moduledoc """
  CreditBalance
  """

  @typedoc """
  * `available_balance` - Expandable.
  * `ledger_balance` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:available_balance, :ledger_balance]

  @object_name "credit_balance"
  def object_name, do: @object_name

  def expandable_fields, do: ["available_balance", "ledger_balance"]

  def __nested_fields__ do
    %{
      "available_balance" => %{
        fields: %{
          "monetary" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "ledger_balance" => %{
        fields: %{
          "monetary" => %{
            fields: %{
              "currency" => :scalar,
              "value" => :scalar
            }
          },
          "type" => :scalar
        }
      }
    }
  end
end
