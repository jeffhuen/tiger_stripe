# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.ReceivedCredit do
  @moduledoc """
  TreasuryReceivedCreditsResourceReceivedCredit

  ReceivedCredits represent funds sent to a [FinancialAccount](https://api.stripe.com#financial_accounts) (for example, via ACH or wire). These money movements are not initiated from the FinancialAccount.
  """

  @typedoc """
  * `amount` - Amount (in cents) transferred.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `failure_code` - Reason for the failure. A ReceivedCredit might fail because the receiving FinancialAccount is closed or frozen. Possible values: `account_closed`, `account_frozen`, `international_transaction`, `other`. Nullable.
  * `financial_account` - The FinancialAccount that received the funds. Max length: 5000. Nullable.
  * `hosted_regulatory_receipt_url` - A [hosted transaction receipt](https://docs.stripe.com/treasury/moving-money/regulatory-receipts) URL that is provided when money movement is considered regulated under Stripe's money transmission licenses. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `initiating_payment_method_details` - Expandable.
  * `linked_flows` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `network` - The rails used to send the funds. Possible values: `ach`, `card`, `stripe`, `us_domestic_wire`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.received_credit`.
  * `reversal_details` - Details describing when a ReceivedCredit may be reversed. Nullable. Expandable.
  * `status` - Status of the ReceivedCredit. ReceivedCredits are created either `succeeded` (approved) or `failed` (declined). If a ReceivedCredit is declined, the failure reason can be found in the `failure_code` field. Possible values: `failed`, `succeeded`.
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
          initiating_payment_method_details: __MODULE__.InitiatingPaymentMethodDetails.t(),
          linked_flows: __MODULE__.LinkedFlows.t(),
          livemode: boolean(),
          network: String.t(),
          object: String.t(),
          reversal_details: __MODULE__.ReversalDetails.t(),
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

  @object_name "treasury.received_credit"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["initiating_payment_method_details", "linked_flows", "reversal_details", "transaction"]

  defmodule InitiatingPaymentMethodDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `balance` - Set when `type` is `balance`. Possible values: `payments`.
    * `billing_details`
    * `financial_account`
    * `issuing_card` - Set when `type` is `issuing_card`. This is an [Issuing Card](https://api.stripe.com#issuing_cards) ID. Max length: 5000.
    * `type` - Polymorphic type matching the originating money movement's source. This can be an external account, a Stripe balance, or a FinancialAccount. Possible values: `balance`, `financial_account`, `issuing_card`, `stripe`, `us_bank_account`.
    * `us_bank_account`
    """
    @type t :: %__MODULE__{
            balance: String.t() | nil,
            billing_details: Stripe.Resources.BillingDetails.t() | nil,
            financial_account: Stripe.Resources.FinancialAccount.t() | nil,
            issuing_card: String.t() | nil,
            type: String.t() | nil,
            us_bank_account: Stripe.Resources.UsBankAccount.t() | nil
          }
    defstruct [
      :balance,
      :billing_details,
      :financial_account,
      :issuing_card,
      :type,
      :us_bank_account
    ]
  end

  defmodule LinkedFlows do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `credit_reversal` - The CreditReversal created as a result of this ReceivedCredit being reversed. Max length: 5000. Nullable.
    * `issuing_authorization` - Set if the ReceivedCredit was created due to an [Issuing Authorization](https://api.stripe.com#issuing_authorizations) object. Max length: 5000. Nullable.
    * `issuing_transaction` - Set if the ReceivedCredit is also viewable as an [Issuing transaction](https://api.stripe.com#issuing_transactions) object. Max length: 5000. Nullable.
    * `source_flow` - ID of the source flow. Set if `network` is `stripe` and the source flow is visible to the user. Examples of source flows include OutboundPayments, payouts, or CreditReversals. Max length: 5000. Nullable.
    * `source_flow_details` - The expandable object of the source flow. Nullable.
    * `source_flow_type` - The type of flow that originated the ReceivedCredit (for example, `outbound_payment`). Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            credit_reversal: String.t() | nil,
            issuing_authorization: String.t() | nil,
            issuing_transaction: String.t() | nil,
            source_flow: String.t() | nil,
            source_flow_details: __MODULE__.SourceFlowDetails.t() | nil,
            source_flow_type: String.t() | nil
          }
    defstruct [
      :credit_reversal,
      :issuing_authorization,
      :issuing_transaction,
      :source_flow,
      :source_flow_details,
      :source_flow_type
    ]

    defmodule SourceFlowDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `credit_reversal`
      * `outbound_payment`
      * `outbound_transfer`
      * `payout`
      * `type` - The type of the source flow that originated the ReceivedCredit. Possible values: `credit_reversal`, `other`, `outbound_payment`, `outbound_transfer`, `payout`.
      """
      @type t :: %__MODULE__{
              credit_reversal: Stripe.Resources.Treasury.CreditReversal.t() | nil,
              outbound_payment: Stripe.Resources.Treasury.OutboundPayment.t() | nil,
              outbound_transfer: Stripe.Resources.Treasury.OutboundTransfer.t() | nil,
              payout: Stripe.Resources.Payout.t() | nil,
              type: String.t() | nil
            }
      defstruct [:credit_reversal, :outbound_payment, :outbound_transfer, :payout, :type]
    end

    def __inner_types__ do
      %{
        "source_flow_details" => __MODULE__.SourceFlowDetails
      }
    end
  end

  defmodule ReversalDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `deadline` - Time before which a ReceivedCredit can be reversed. Format: Unix timestamp. Nullable.
    * `restricted_reason` - Set if a ReceivedCredit cannot be reversed. Possible values: `already_reversed`, `deadline_passed`, `network_restricted`, `other`, `source_flow_restricted`. Nullable.
    """
    @type t :: %__MODULE__{
            deadline: integer() | nil,
            restricted_reason: String.t() | nil
          }
    defstruct [:deadline, :restricted_reason]
  end

  def __inner_types__ do
    %{
      "initiating_payment_method_details" => __MODULE__.InitiatingPaymentMethodDetails,
      "linked_flows" => __MODULE__.LinkedFlows,
      "reversal_details" => __MODULE__.ReversalDetails
    }
  end
end
