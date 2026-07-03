# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.DebitReversal do
  @moduledoc """
  TreasuryReceivedDebitsResourceDebitReversal

  You can reverse some [ReceivedDebits](https://api.stripe.com#received_debits) depending on their network and source flow. Reversing a ReceivedDebit leads to the creation of a new object known as a DebitReversal.
  """

  @typedoc """
  * `amount` - Amount (in cents) transferred.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `financial_account` - The FinancialAccount to reverse funds from. Max length: 5000. Nullable.
  * `hosted_regulatory_receipt_url` - A [hosted transaction receipt](https://docs.stripe.com/treasury/moving-money/regulatory-receipts) URL that is provided when money movement is considered regulated under Stripe's money transmission licenses. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `linked_flows` - Other flows linked to a DebitReversal. Nullable. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `network` - The rails used to reverse the funds. Possible values: `ach`, `card`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.debit_reversal`.
  * `received_debit` - The ReceivedDebit being reversed. Max length: 5000.
  * `status` - Status of the DebitReversal Possible values: `failed`, `processing`, `succeeded`.
  * `status_transitions` - Expandable.
  * `transaction` - The Transaction associated with this object. Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :created,
    :currency,
    :financial_account,
    :hosted_regulatory_receipt_url,
    :id,
    :linked_flows,
    :livemode,
    :metadata,
    :network,
    :object,
    :received_debit,
    :status,
    :status_transitions,
    :transaction
  ]

  @object_name "treasury.debit_reversal"
  def object_name, do: @object_name

  def expandable_fields, do: ["linked_flows", "status_transitions", "transaction"]

  def __nested_fields__ do
    %{
      "linked_flows" => %{
        fields: %{
          "issuing_dispute" => :scalar
        }
      },
      "status_transitions" => %{
        fields: %{
          "completed_at" => :scalar
        }
      }
    }
  end
end
