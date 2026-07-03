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
  @type t :: %__MODULE__{}

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
