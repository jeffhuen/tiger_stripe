# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.ReceivedDebit do
  @moduledoc """
  TreasuryReceivedDebitsResourceReceivedDebit

  ReceivedDebits represent funds pulled from a [FinancialAccount](https://api.stripe.com#financial_accounts). These are not initiated from the FinancialAccount.
  """

  @typedoc """
  * `amount` - Amount (in cents) transferred.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `failure_code` - Reason for the failure. A ReceivedDebit might fail because the FinancialAccount doesn't have sufficient funds, is closed, or is frozen. Possible values: `account_closed`, `account_frozen`, `insufficient_funds`, `international_transaction`, `other`. Nullable.
  * `financial_account` - The FinancialAccount that funds were pulled from. Max length: 5000. Nullable.
  * `hosted_regulatory_receipt_url` - A [hosted transaction receipt](https://docs.stripe.com/treasury/moving-money/regulatory-receipts) URL that is provided when money movement is considered regulated under Stripe's money transmission licenses. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `initiating_payment_method_details` - Expandable.
  * `linked_flows` - Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `network` - The network used for the ReceivedDebit. Possible values: `ach`, `card`, `stripe`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.received_debit`.
  * `reversal_details` - Details describing when a ReceivedDebit might be reversed. Nullable. Expandable.
  * `status` - Status of the ReceivedDebit. ReceivedDebits are created with a status of either `succeeded` (approved) or `failed` (declined). The failure reason can be found under the `failure_code`. Possible values: `failed`, `succeeded`.
  * `transaction` - The Transaction associated with this object. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          created: integer(),
          currency: String.t(),
          description: String.t(),
          failure_code: String.t(),
          financial_account: String.t(),
          hosted_regulatory_receipt_url: String.t(),
          id: String.t(),
          initiating_payment_method_details: initiating_payment_method_details() | nil,
          linked_flows: linked_flows(),
          livemode: boolean(),
          network: String.t(),
          object: String.t(),
          reversal_details: reversal_details(),
          status: String.t(),
          transaction: String.t() | Stripe.Resources.Treasury.Transaction.t()
        }

  defstruct [
    :amount,
    :created,
    :currency,
    :description,
    :failure_code,
    :financial_account,
    :hosted_regulatory_receipt_url,
    :id,
    :initiating_payment_method_details,
    :linked_flows,
    :livemode,
    :network,
    :object,
    :reversal_details,
    :status,
    :transaction
  ]

  @object_name "treasury.received_debit"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["initiating_payment_method_details", "linked_flows", "reversal_details", "transaction"]

  @typedoc """
  * `balance` - Set when `type` is `balance`. Possible values: `payments`.
  * `billing_details`
  * `financial_account`
  * `issuing_card` - Set when `type` is `issuing_card`. This is an [Issuing Card](https://api.stripe.com#issuing_cards) ID. Max length: 5000.
  * `type` - Polymorphic type matching the originating money movement's source. This can be an external account, a Stripe balance, or a FinancialAccount. Possible values: `balance`, `financial_account`, `issuing_card`, `stripe`, `us_bank_account`.
  * `us_bank_account`
  """
  @type initiating_payment_method_details :: %{
          optional(:balance) => String.t() | nil,
          optional(:billing_details) => Stripe.Resources.BillingDetails.t() | nil,
          optional(:financial_account) => Stripe.Resources.FinancialAccount.t() | nil,
          optional(:issuing_card) => String.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:us_bank_account) => Stripe.Resources.UsBankAccount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `debit_reversal` - The DebitReversal created as a result of this ReceivedDebit being reversed. Max length: 5000. Nullable.
  * `inbound_transfer` - Set if the ReceivedDebit is associated with an InboundTransfer's return of funds. Max length: 5000. Nullable.
  * `issuing_authorization` - Set if the ReceivedDebit was created due to an [Issuing Authorization](https://api.stripe.com#issuing_authorizations) object. Max length: 5000. Nullable.
  * `issuing_transaction` - Set if the ReceivedDebit is also viewable as an [Issuing Dispute](https://api.stripe.com#issuing_disputes) object. Max length: 5000. Nullable.
  * `payout` - Set if the ReceivedDebit was created due to a [Payout](https://api.stripe.com#payouts) object. Max length: 5000. Nullable.
  * `topup` - Set if the ReceivedDebit was created due to a [Topup](https://api.stripe.com#topups) object. Max length: 5000. Nullable.
  """
  @type linked_flows :: %{
          optional(:debit_reversal) => String.t() | nil,
          optional(:inbound_transfer) => String.t() | nil,
          optional(:issuing_authorization) => String.t() | nil,
          optional(:issuing_transaction) => String.t() | nil,
          optional(:payout) => String.t() | nil,
          optional(:topup) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `deadline` - Time before which a ReceivedDebit can be reversed. Format: Unix timestamp. Nullable.
  * `restricted_reason` - Set if a ReceivedDebit can't be reversed. Possible values: `already_reversed`, `deadline_passed`, `network_restricted`, `other`, `source_flow_restricted`. Nullable.
  """
  @type reversal_details :: %{
          optional(:deadline) => integer() | nil,
          optional(:restricted_reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "initiating_payment_method_details" => %{
        fields: %{
          "balance" => :scalar,
          "billing_details" => {:resource, Stripe.Resources.BillingDetails},
          "financial_account" => {:resource, Stripe.Resources.FinancialAccount},
          "issuing_card" => :scalar,
          "type" => :scalar,
          "us_bank_account" => {:resource, Stripe.Resources.UsBankAccount}
        }
      },
      "linked_flows" => %{
        fields: %{
          "debit_reversal" => :scalar,
          "inbound_transfer" => :scalar,
          "issuing_authorization" => :scalar,
          "issuing_transaction" => :scalar,
          "payout" => :scalar,
          "topup" => :scalar
        }
      },
      "reversal_details" => %{
        fields: %{
          "deadline" => :scalar,
          "restricted_reason" => :scalar
        }
      }
    }
  end
end
