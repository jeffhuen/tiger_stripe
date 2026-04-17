# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.InboundTransfer do
  @moduledoc """
  TreasuryInboundTransfersResourceInboundTransfer

  Use [InboundTransfers](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/into/inbound-transfers) to add funds to your [FinancialAccount](https://api.stripe.com#financial_accounts) via a PaymentMethod that is owned by you. The funds will be transferred via an ACH debit.

  Related guide: [Moving money with Treasury using InboundTransfer objects](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/into/inbound-transfers)
  """

  @typedoc """
  * `amount` - Amount (in cents) transferred.
  * `cancelable` - Returns `true` if the InboundTransfer is able to be canceled.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `failure_details` - Details about this InboundTransfer's failure. Only set when status is `failed`. Nullable. Expandable.
  * `financial_account` - The FinancialAccount that received the funds. Max length: 5000.
  * `hosted_regulatory_receipt_url` - A [hosted transaction receipt](https://docs.stripe.com/treasury/moving-money/regulatory-receipts) URL that is provided when money movement is considered regulated under Stripe's money transmission licenses. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `linked_flows` - Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.inbound_transfer`.
  * `origin_payment_method` - The origin payment method to be debited for an InboundTransfer. Max length: 5000. Nullable.
  * `origin_payment_method_details` - Details about the PaymentMethod for an InboundTransfer. Nullable. Expandable.
  * `returned` - Returns `true` if the funds for an InboundTransfer were returned after the InboundTransfer went to the `succeeded` state. Nullable.
  * `statement_descriptor` - Statement descriptor shown when funds are debited from the source. Not all payment networks support `statement_descriptor`. Max length: 5000.
  * `status` - Status of the InboundTransfer: `processing`, `succeeded`, `failed`, and `canceled`. An InboundTransfer is `processing` if it is created and pending. The status changes to `succeeded` once the funds have been "confirmed" and a `transaction` is created and posted. The status changes to `failed` if the transfer fails. Possible values: `canceled`, `failed`, `processing`, `succeeded`.
  * `status_transitions` - Expandable.
  * `transaction` - The Transaction associated with this object. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          cancelable: boolean(),
          created: integer(),
          currency: String.t(),
          description: String.t(),
          failure_details: __MODULE__.FailureDetails.t(),
          financial_account: String.t(),
          hosted_regulatory_receipt_url: String.t(),
          id: String.t(),
          linked_flows: __MODULE__.LinkedFlows.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          origin_payment_method: String.t(),
          origin_payment_method_details: __MODULE__.OriginPaymentMethodDetails.t(),
          returned: boolean(),
          statement_descriptor: String.t(),
          status: String.t(),
          status_transitions: Stripe.Resources.StatusTransitions.t(),
          transaction: String.t() | Stripe.Resources.Treasury.Transaction.t()
        }

  defstruct [
    :amount,
    :cancelable,
    :created,
    :currency,
    :description,
    :failure_details,
    :financial_account,
    :hosted_regulatory_receipt_url,
    :id,
    :linked_flows,
    :livemode,
    :metadata,
    :object,
    :origin_payment_method,
    :origin_payment_method_details,
    :returned,
    :statement_descriptor,
    :status,
    :status_transitions,
    :transaction
  ]

  @object_name "treasury.inbound_transfer"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "failure_details",
      "linked_flows",
      "origin_payment_method_details",
      "status_transitions",
      "transaction"
    ]

  defmodule FailureDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `code` - Reason for the failure. Possible values: `account_closed`, `account_frozen`, `bank_account_restricted`, `bank_ownership_changed`, `debit_not_authorized`, `incorrect_account_holder_address`, `incorrect_account_holder_name`, `incorrect_account_holder_tax_id`, `insufficient_funds`, `invalid_account_number`, `invalid_currency`, `no_account`, `other`.
    """
    @type t :: %__MODULE__{
            code: String.t() | nil
          }
    defstruct [:code]
  end

  defmodule LinkedFlows do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `received_debit` - If funds for this flow were returned after the flow went to the `succeeded` state, this field contains a reference to the ReceivedDebit return. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            received_debit: String.t() | nil
          }
    defstruct [:received_debit]
  end

  defmodule OriginPaymentMethodDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `billing_details`
    * `type` - The type of the payment method used in the InboundTransfer. Possible values: `us_bank_account`.
    * `us_bank_account`
    """
    @type t :: %__MODULE__{
            billing_details: Stripe.Resources.BillingDetails.t() | nil,
            type: String.t() | nil,
            us_bank_account: Stripe.Resources.UsBankAccount.t() | nil
          }
    defstruct [:billing_details, :type, :us_bank_account]
  end

  def __inner_types__ do
    %{
      "failure_details" => __MODULE__.FailureDetails,
      "linked_flows" => __MODULE__.LinkedFlows,
      "origin_payment_method_details" => __MODULE__.OriginPaymentMethodDetails,
      "status_transitions" => Stripe.Resources.StatusTransitions
    }
  end
end
