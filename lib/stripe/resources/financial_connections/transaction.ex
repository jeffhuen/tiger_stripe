# File generated from our OpenAPI spec
defmodule Stripe.Resources.FinancialConnections.Transaction do
  @moduledoc """
  BankConnectionsResourceTransaction

  A Transaction represents a real transaction that affects a Financial Connections Account balance.
  """

  @typedoc """
  * `account` - The ID of the Financial Connections Account this transaction belongs to. Max length: 5000.
  * `amount` - The amount of this transaction, in cents (or local equivalent).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `description` - The description of this transaction. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `financial_connections.transaction`.
  * `status` - The status of the transaction. Possible values: `pending`, `posted`, `void`.
  * `status_transitions` - Expandable.
  * `transacted_at` - Time at which the transaction was transacted. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `transaction_refresh` - The token of the transaction refresh that last updated or created this transaction. Max length: 5000.
  * `updated` - Time at which the object was last updated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{
          account: String.t(),
          amount: integer(),
          currency: String.t(),
          description: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          status: String.t(),
          status_transitions: status_transitions(),
          transacted_at: integer(),
          transaction_refresh: String.t(),
          updated: integer()
        }

  defstruct [
    :account,
    :amount,
    :currency,
    :description,
    :id,
    :livemode,
    :object,
    :status,
    :status_transitions,
    :transacted_at,
    :transaction_refresh,
    :updated
  ]

  @object_name "financial_connections.transaction"
  def object_name, do: @object_name

  def expandable_fields, do: ["status_transitions"]

  @typedoc """
  * `posted_at` - Time at which this transaction posted. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  * `void_at` - Time at which this transaction was voided. Measured in seconds since the Unix epoch. Format: Unix timestamp. Nullable.
  """
  @type status_transitions :: %{
          optional(:posted_at) => integer() | nil,
          optional(:void_at) => integer() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "status_transitions" => %{
        fields: %{
          "posted_at" => :scalar,
          "void_at" => :scalar
        }
      }
    }
  end
end
