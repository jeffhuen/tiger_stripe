# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.Transaction do
  @moduledoc """
  TreasuryTransactionsResourceTransaction

  Transactions represent changes to a [FinancialAccount's](https://api.stripe.com#financial_accounts) balance.
  """

  @typedoc """
  * `amount` - Amount (in cents) transferred.
  * `balance_impact` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `entries` - A list of TransactionEntries that are part of this Transaction. This cannot be expanded in any list endpoints. Nullable. Expandable.
  * `financial_account` - The FinancialAccount associated with this object. Max length: 5000.
  * `flow` - ID of the flow that created the Transaction. Max length: 5000. Nullable.
  * `flow_details` - Details of the flow that created the Transaction. Nullable. Expandable.
  * `flow_type` - Type of the flow that created the Transaction. Possible values: `credit_reversal`, `debit_reversal`, `inbound_transfer`, `issuing_authorization`, `other`, `outbound_payment`, `outbound_transfer`, `received_credit`, `received_debit`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.transaction`.
  * `status` - Status of the Transaction. Possible values: `open`, `posted`, `void`.
  * `status_transitions` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :balance_impact,
    :created,
    :currency,
    :description,
    :entries,
    :financial_account,
    :flow,
    :flow_details,
    :flow_type,
    :id,
    :livemode,
    :object,
    :status,
    :status_transitions
  ]

  @object_name "treasury.transaction"
  def object_name, do: @object_name

  def expandable_fields, do: ["balance_impact", "entries", "flow_details", "status_transitions"]

  def __nested_fields__ do
    %{
      "balance_impact" => %{
        fields: %{
          "cash" => :scalar,
          "inbound_pending" => :scalar,
          "outbound_pending" => :scalar
        }
      },
      "entries" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.Treasury.TransactionEntry}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "flow_details" => %{
        fields: %{
          "credit_reversal" => {:resource, Stripe.Resources.Treasury.CreditReversal},
          "debit_reversal" => {:resource, Stripe.Resources.Treasury.DebitReversal},
          "inbound_transfer" => {:resource, Stripe.Resources.Treasury.InboundTransfer},
          "issuing_authorization" => {:resource, Stripe.Resources.Issuing.Authorization},
          "outbound_payment" => {:resource, Stripe.Resources.Treasury.OutboundPayment},
          "outbound_transfer" => {:resource, Stripe.Resources.Treasury.OutboundTransfer},
          "received_credit" => {:resource, Stripe.Resources.Treasury.ReceivedCredit},
          "received_debit" => {:resource, Stripe.Resources.Treasury.ReceivedDebit},
          "type" => :scalar
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
