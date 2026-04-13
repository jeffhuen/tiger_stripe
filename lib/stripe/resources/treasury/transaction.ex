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
  @type t :: %__MODULE__{
          amount: integer(),
          balance_impact: __MODULE__.BalanceImpact.t(),
          created: integer(),
          currency: String.t(),
          description: String.t(),
          entries: __MODULE__.Entries.t() | nil,
          financial_account: String.t(),
          flow: String.t(),
          flow_details: __MODULE__.FlowDetails.t() | nil,
          flow_type: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          status: String.t(),
          status_transitions: __MODULE__.StatusTransitions.t()
        }

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

  defmodule BalanceImpact do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `cash` - The change made to funds the user can spend right now.
    * `inbound_pending` - The change made to funds that are not spendable yet, but will become available at a later time.
    * `outbound_pending` - The change made to funds in the account, but not spendable because they are being held for pending outbound flows.
    """
    @type t :: %__MODULE__{
            cash: integer() | nil,
            inbound_pending: integer() | nil,
            outbound_pending: integer() | nil
          }
    defstruct [:cash, :inbound_pending, :outbound_pending]
  end

  defmodule Entries do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.Treasury.TransactionEntry.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  defmodule FlowDetails do
    @moduledoc "Nested struct within the parent resource."

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
    @type t :: %__MODULE__{
            credit_reversal: Stripe.Resources.Treasury.CreditReversal.t() | nil,
            debit_reversal: Stripe.Resources.Treasury.DebitReversal.t() | nil,
            inbound_transfer: Stripe.Resources.Treasury.InboundTransfer.t() | nil,
            issuing_authorization: Stripe.Resources.Issuing.Authorization.t() | nil,
            outbound_payment: Stripe.Resources.Treasury.OutboundPayment.t() | nil,
            outbound_transfer: Stripe.Resources.Treasury.OutboundTransfer.t() | nil,
            received_credit: Stripe.Resources.Treasury.ReceivedCredit.t() | nil,
            received_debit: Stripe.Resources.Treasury.ReceivedDebit.t() | nil,
            type: String.t() | nil
          }
    defstruct [
      :credit_reversal,
      :debit_reversal,
      :inbound_transfer,
      :issuing_authorization,
      :outbound_payment,
      :outbound_transfer,
      :received_credit,
      :received_debit,
      :type
    ]
  end

  defmodule StatusTransitions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `posted_at` - Timestamp describing when the Transaction changed status to `posted`. Format: Unix timestamp. Nullable.
    * `void_at` - Timestamp describing when the Transaction changed status to `void`. Format: Unix timestamp. Nullable.
    """
    @type t :: %__MODULE__{
            posted_at: integer() | nil,
            void_at: integer() | nil
          }
    defstruct [:posted_at, :void_at]
  end

  def __inner_types__ do
    %{
      "balance_impact" => __MODULE__.BalanceImpact,
      "entries" => __MODULE__.Entries,
      "flow_details" => __MODULE__.FlowDetails,
      "status_transitions" => __MODULE__.StatusTransitions
    }
  end
end
