# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.CreditReversal do
  @moduledoc """
  TreasuryReceivedCreditsResourceCreditReversal

  You can reverse some [ReceivedCredits](https://api.stripe.com#received_credits) depending on their network and source flow. Reversing a ReceivedCredit leads to the creation of a new object known as a CreditReversal.
  """

  @typedoc """
  * `amount` - Amount (in cents) transferred.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `financial_account` - The FinancialAccount to reverse funds from. Max length: 5000.
  * `hosted_regulatory_receipt_url` - A [hosted transaction receipt](https://docs.stripe.com/treasury/moving-money/regulatory-receipts) URL that is provided when money movement is considered regulated under Stripe's money transmission licenses. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `network` - The rails used to reverse the funds. Possible values: `ach`, `stripe`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.credit_reversal`.
  * `received_credit` - The ReceivedCredit being reversed. Max length: 5000.
  * `status` - Status of the CreditReversal Possible values: `canceled`, `posted`, `processing`.
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
    :livemode,
    :metadata,
    :network,
    :object,
    :received_credit,
    :status,
    :status_transitions,
    :transaction
  ]

  @object_name "treasury.credit_reversal"
  def object_name, do: @object_name

  def expandable_fields, do: ["status_transitions", "transaction"]

  def __nested_fields__ do
    %{
      "status_transitions" => %{
        fields: %{
          "posted_at" => :scalar
        }
      }
    }
  end
end
