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

  @object_name "treasury.received_credit"
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
          "credit_reversal" => :scalar,
          "issuing_authorization" => :scalar,
          "issuing_transaction" => :scalar,
          "source_flow" => :scalar,
          "source_flow_details" => %{
            fields: %{
              "credit_reversal" => {:resource, Stripe.Resources.Treasury.CreditReversal},
              "outbound_payment" => {:resource, Stripe.Resources.Treasury.OutboundPayment},
              "outbound_transfer" => {:resource, Stripe.Resources.Treasury.OutboundTransfer},
              "payout" => {:resource, Stripe.Resources.Payout},
              "type" => :scalar
            }
          },
          "source_flow_type" => :scalar
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
