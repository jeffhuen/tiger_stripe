# File generated from our OpenAPI spec
defmodule Stripe.Resources.Billing.CreditBalance do
  @moduledoc """
  CreditBalance
  """

  @typedoc """
  * `available_balance` - Expandable.
  * `ledger_balance` - Expandable.
  """
  @type t :: %__MODULE__{
          available_balance: available_balance(),
          ledger_balance: ledger_balance()
        }

  defstruct [:available_balance, :ledger_balance]

  @object_name "credit_balance"
  def object_name, do: @object_name

  def expandable_fields, do: ["available_balance", "ledger_balance"]

  @typedoc """
  * `monetary` - The monetary amount. Nullable.
  * `type` - The type of this amount. We currently only support `monetary` billing credits. Possible values: `monetary`.
  """
  @type available_balance :: %{
          optional(:monetary) => available_balance_monetary() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `value` - A positive integer representing the amount.
  """
  @type available_balance_monetary :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `monetary` - The monetary amount. Nullable.
  * `type` - The type of this amount. We currently only support `monetary` billing credits. Possible values: `monetary`.
  """
  @type ledger_balance :: %{
          optional(:monetary) => ledger_balance_monetary() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `value` - A positive integer representing the amount.
  """
  @type ledger_balance_monetary :: %{
          optional(:currency) => String.t() | nil,
          optional(:value) => integer() | nil,
          optional(String.t()) => term()
        }

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
