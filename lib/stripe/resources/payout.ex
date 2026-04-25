# File generated from our OpenAPI spec
defmodule Stripe.Resources.Payout do
  @moduledoc """
  Payout

  A `Payout` object is created when you receive funds from Stripe, or when you
  initiate a payout to either a bank account or debit card of a [connected
  Stripe account](https://docs.stripe.com/docs/connect/bank-debit-card-payouts). You can retrieve individual payouts,
  and list all payouts. Payouts are made on [varying
  schedules](https://docs.stripe.com/docs/connect/manage-payout-schedule), depending on your country and
  industry.

  Related guide: [Receiving payouts](https://docs.stripe.com/payouts)
  """

  @typedoc """
  * `amount` - The amount (in cents (or local equivalent)) that transfers to your bank account or debit card.
  * `application_fee` - The application fee (if any) for the payout. [See the Connect documentation](https://docs.stripe.com/connect/instant-payouts#monetization-and-fees) for details. Nullable. Expandable.
  * `application_fee_amount` - The amount of the application fee (if any) requested for the payout. [See the Connect documentation](https://docs.stripe.com/connect/instant-payouts#monetization-and-fees) for details. Nullable.
  * `arrival_date` - Date that you can expect the payout to arrive in the bank. This factors in delays to account for weekends or bank holidays. Format: Unix timestamp.
  * `automatic` - Returns `true` if the payout is created by an [automated payout schedule](https://docs.stripe.com/payouts#payout-schedule) and `false` if it's [requested manually](https://stripe.com/docs/payouts#manual-payouts).
  * `balance_transaction` - ID of the balance transaction that describes the impact of this payout on your account balance. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `destination` - ID of the bank account or card the payout is sent to. Nullable. Expandable.
  * `failure_balance_transaction` - If the payout fails or cancels, this is the ID of the balance transaction that reverses the initial balance transaction and returns the funds from the failed payout back in your balance. Nullable. Expandable.
  * `failure_code` - Error code that provides a reason for a payout failure, if available. View our [list of failure codes](https://docs.stripe.com/api#payout_failures). Max length: 5000. Nullable.
  * `failure_message` - Message that provides the reason for a payout failure, if available. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `method` - The method used to send this payout, which can be `standard` or `instant`. `instant` is supported for payouts to debit cards and bank accounts in certain countries. Learn more about [bank support for Instant Payouts](https://stripe.com/docs/payouts/instant-payouts-banks). Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payout`.
  * `original_payout` - If the payout reverses another, this is the ID of the original payout. Nullable. Expandable.
  * `payout_method` - ID of the v2 FinancialAccount the funds are sent to. Max length: 5000. Nullable.
  * `reconciliation_status` - If `completed`, you can use the [Balance Transactions API](https://docs.stripe.com/api/balance_transactions/list#balance_transaction_list-payout) to list all balance transactions that are paid out in this payout. Possible values: `completed`, `in_progress`, `not_applicable`.
  * `reversed_by` - If the payout reverses, this is the ID of the payout that reverses this payout. Nullable. Expandable.
  * `source_type` - The source balance this payout came from, which can be one of the following: `card`, `fpx`, or `bank_account`. Max length: 5000.
  * `statement_descriptor` - Extra information about a payout that displays on the user's bank statement. Max length: 5000. Nullable.
  * `status` - Current status of the payout: `paid`, `pending`, `in_transit`, `canceled` or `failed`. A payout is `pending` until it's submitted to the bank, when it becomes `in_transit`. The status changes to `paid` if the transaction succeeds, or to `failed` or `canceled` (within 5 business days). Some payouts that fail might initially show as `paid`, then change to `failed`. Max length: 5000.
  * `trace_id` - A value that generates from the beneficiary's bank that allows users to track payouts with their bank. Banks might call this a "reference number" or something similar. Nullable. Expandable.
  * `type` - Can be `bank_account` or `card`. Possible values: `bank_account`, `card`.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          application_fee: String.t() | Stripe.Resources.ApplicationFee.t(),
          application_fee_amount: integer(),
          arrival_date: integer(),
          automatic: boolean(),
          balance_transaction: String.t() | Stripe.Resources.BalanceTransaction.t(),
          created: integer(),
          currency: String.t(),
          description: String.t(),
          destination: String.t() | Stripe.Resources.ExternalAccount.t(),
          failure_balance_transaction: String.t() | Stripe.Resources.BalanceTransaction.t(),
          failure_code: String.t(),
          failure_message: String.t(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          method: String.t(),
          object: String.t(),
          original_payout: String.t() | Stripe.Resources.Payout.t(),
          payout_method: String.t(),
          reconciliation_status: String.t(),
          reversed_by: String.t() | Stripe.Resources.Payout.t(),
          source_type: String.t(),
          statement_descriptor: String.t(),
          status: String.t(),
          trace_id: trace_id(),
          type: String.t()
        }

  defstruct [
    :amount,
    :application_fee,
    :application_fee_amount,
    :arrival_date,
    :automatic,
    :balance_transaction,
    :created,
    :currency,
    :description,
    :destination,
    :failure_balance_transaction,
    :failure_code,
    :failure_message,
    :id,
    :livemode,
    :metadata,
    :method,
    :object,
    :original_payout,
    :payout_method,
    :reconciliation_status,
    :reversed_by,
    :source_type,
    :statement_descriptor,
    :status,
    :trace_id,
    :type
  ]

  @object_name "payout"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "application_fee",
      "balance_transaction",
      "destination",
      "failure_balance_transaction",
      "original_payout",
      "reversed_by",
      "trace_id"
    ]

  @typedoc """
  * `status` - Possible values are `pending`, `supported`, and `unsupported`. When `payout.status` is `pending` or `in_transit`, this will be `pending`. When the payout transitions to `paid`, `failed`, or `canceled`, this status will become `supported` or `unsupported` shortly after in most cases. In some cases, this may appear as `pending` for up to 10 days after `arrival_date` until transitioning to `supported` or `unsupported`. Max length: 5000.
  * `value` - The trace ID value if `trace_id.status` is `supported`, otherwise `nil`. Max length: 5000. Nullable.
  """
  @type trace_id :: %{
          optional(:status) => String.t() | nil,
          optional(:value) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "trace_id" => %{
        fields: %{
          "status" => :scalar,
          "value" => :scalar
        }
      }
    }
  end
end
