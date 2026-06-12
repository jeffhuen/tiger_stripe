# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.TransactionEntry do
  @moduledoc """
  TreasuryTransactionsResourceTransactionEntry

  TransactionEntries represent individual units of money movements within a single [Transaction](https://api.stripe.com#transactions).
  """

  @typedoc """
  * `balance_impact` - Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `effective_at` - When the TransactionEntry will impact the FinancialAccount's balance. Format: Unix timestamp.
  * `financial_account` - The FinancialAccount associated with this object. Max length: 5000.
  * `flow` - Token of the flow associated with the TransactionEntry. Max length: 5000. Nullable.
  * `flow_details` - Details of the flow associated with the TransactionEntry. Nullable. Expandable.
  * `flow_type` - Type of the flow associated with the TransactionEntry. Possible values: `credit_reversal`, `debit_reversal`, `inbound_transfer`, `issuing_authorization`, `other`, `outbound_payment`, `outbound_transfer`, `received_credit`, `received_debit`.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.transaction_entry`.
  * `transaction` - The Transaction associated with this object. Expandable.
  * `type` - The specific money movement that generated the TransactionEntry. Possible values: `credit_reversal`, `credit_reversal_posting`, `debit_reversal`, `inbound_transfer`, `inbound_transfer_return`, `issuing_authorization_hold`, `issuing_authorization_release`, `other`, `outbound_payment`, `outbound_payment_cancellation`, `outbound_payment_failure`, `outbound_payment_posting`, `outbound_payment_return`, `outbound_transfer`, `outbound_transfer_cancellation`, `outbound_transfer_failure`, `outbound_transfer_posting`, `outbound_transfer_return`, `received_credit`, `received_debit`.
  """
  @type t :: %__MODULE__{
          balance_impact: balance_impact(),
          created: integer(),
          currency: String.t(),
          effective_at: integer(),
          financial_account: String.t(),
          flow: String.t(),
          flow_details: flow_details() | nil,
          flow_type: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          transaction: String.t() | Stripe.Resources.Treasury.Transaction.t(),
          type: String.t()
        }

  defstruct [
    :balance_impact,
    :created,
    :currency,
    :effective_at,
    :financial_account,
    :flow,
    :flow_details,
    :flow_type,
    :id,
    :livemode,
    :object,
    :transaction,
    :type
  ]

  @object_name "treasury.transaction_entry"
  def object_name, do: @object_name

  def expandable_fields, do: ["balance_impact", "flow_details", "transaction"]

  @typedoc """
  * `cash` - The change made to funds the user can spend right now.
  * `inbound_pending` - The change made to funds that are not spendable yet, but will become available at a later time.
  * `outbound_pending` - The change made to funds in the account, but not spendable because they are being held for pending outbound flows.
  """
  @type balance_impact :: %{
          optional(:cash) => integer() | nil,
          optional(:inbound_pending) => integer() | nil,
          optional(:outbound_pending) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `credit_reversal`
  * `debit_reversal`
  * `inbound_transfer`
  * `issuing_authorization`
  * `outbound_payment`
  * `outbound_transfer`
  * `received_credit`
  * `received_debit`
  * `type` - Type of the flow that created the Transaction. Set to the same value as `flow_type`. Possible values: `credit_reversal`, `debit_reversal`, `inbound_transfer`, `issuing_authorization`, `other`, `outbound_payment`, `outbound_transfer`, `received_credit`, `received_debit`.
  """
  @type flow_details :: %{
          optional(:credit_reversal) => Stripe.Resources.Treasury.CreditReversal.t() | nil,
          optional(:debit_reversal) => Stripe.Resources.Treasury.DebitReversal.t() | nil,
          optional(:inbound_transfer) => Stripe.Resources.Treasury.InboundTransfer.t() | nil,
          optional(:issuing_authorization) => Stripe.Resources.Issuing.Authorization.t() | nil,
          optional(:outbound_payment) => Stripe.Resources.Treasury.OutboundPayment.t() | nil,
          optional(:outbound_transfer) => Stripe.Resources.Treasury.OutboundTransfer.t() | nil,
          optional(:received_credit) => Stripe.Resources.Treasury.ReceivedCredit.t() | nil,
          optional(:received_debit) => Stripe.Resources.Treasury.ReceivedDebit.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "balance_impact" => %{
        fields: %{
          "cash" => :scalar,
          "inbound_pending" => :scalar,
          "outbound_pending" => :scalar
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
      }
    }
  end
end
