# File generated from our OpenAPI spec
defmodule Stripe.Resources.Treasury.OutboundPayment do
  @moduledoc """
  TreasuryOutboundPaymentsResourceOutboundPayment

  Use [OutboundPayments](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/out-of/outbound-payments) to send funds to another party's external bank account or [FinancialAccount](https://api.stripe.com#financial_accounts). To send money to an account belonging to the same user, use an [OutboundTransfer](https://api.stripe.com#outbound_transfers).

  Simulate OutboundPayment state changes with the `/v1/test_helpers/treasury/outbound_payments` endpoints. These methods can only be called on test mode objects.

  Related guide: [Moving money with Treasury using OutboundPayment objects](https://docs.stripe.com/docs/treasury/moving-money/financial-accounts/out-of/outbound-payments)
  """

  @typedoc """
  * `amount` - Amount (in cents) transferred.
  * `cancelable` - Returns `true` if the object can be canceled, and `false` otherwise.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - ID of the [customer](https://docs.stripe.com/api/customers) to whom an OutboundPayment is sent. Max length: 5000. Nullable.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `destination_payment_method` - The PaymentMethod via which an OutboundPayment is sent. This field can be empty if the OutboundPayment was created using `destination_payment_method_data`. Max length: 5000. Nullable.
  * `destination_payment_method_details` - Details about the PaymentMethod for an OutboundPayment. Nullable. Expandable.
  * `end_user_details` - Details about the end user. Nullable. Expandable.
  * `expected_arrival_date` - The date when funds are expected to arrive in the destination account. Format: Unix timestamp.
  * `financial_account` - The FinancialAccount that funds were pulled from. Max length: 5000.
  * `hosted_regulatory_receipt_url` - A [hosted transaction receipt](https://docs.stripe.com/treasury/moving-money/regulatory-receipts) URL that is provided when money movement is considered regulated under Stripe's money transmission licenses. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `treasury.outbound_payment`.
  * `returned_details` - Details about a returned OutboundPayment. Only set when the status is `returned`. Nullable. Expandable.
  * `statement_descriptor` - The description that appears on the receiving end for an OutboundPayment (for example, bank statement for external bank transfer). Max length: 5000.
  * `status` - Current status of the OutboundPayment: `processing`, `failed`, `posted`, `returned`, `canceled`. An OutboundPayment is `processing` if it has been created and is pending. The status changes to `posted` once the OutboundPayment has been "confirmed" and funds have left the account, or to `failed` or `canceled`. If an OutboundPayment fails to arrive at its destination, its status will change to `returned`. Possible values: `canceled`, `failed`, `posted`, `processing`, `returned`.
  * `status_transitions` - Expandable.
  * `tracking_details` - Details about network-specific tracking information if available. Nullable. Expandable.
  * `transaction` - The Transaction associated with this object. Expandable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          cancelable: boolean(),
          created: integer(),
          currency: String.t(),
          customer: String.t(),
          description: String.t(),
          destination_payment_method: String.t(),
          destination_payment_method_details: destination_payment_method_details(),
          end_user_details: end_user_details(),
          expected_arrival_date: integer(),
          financial_account: String.t(),
          hosted_regulatory_receipt_url: String.t(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          returned_details: returned_details(),
          statement_descriptor: String.t(),
          status: String.t(),
          status_transitions: Stripe.Resources.StatusTransitions.t(),
          tracking_details: tracking_details(),
          transaction: String.t() | Stripe.Resources.Treasury.Transaction.t()
        }

  defstruct [
    :amount,
    :cancelable,
    :created,
    :currency,
    :customer,
    :description,
    :destination_payment_method,
    :destination_payment_method_details,
    :end_user_details,
    :expected_arrival_date,
    :financial_account,
    :hosted_regulatory_receipt_url,
    :id,
    :livemode,
    :metadata,
    :object,
    :returned_details,
    :statement_descriptor,
    :status,
    :status_transitions,
    :tracking_details,
    :transaction
  ]

  @object_name "treasury.outbound_payment"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "destination_payment_method_details",
      "end_user_details",
      "returned_details",
      "status_transitions",
      "tracking_details",
      "transaction"
    ]

  @typedoc """
  * `billing_details`
  * `financial_account`
  * `type` - The type of the payment method used in the OutboundPayment. Possible values: `financial_account`, `us_bank_account`.
  * `us_bank_account`
  """
  @type destination_payment_method_details :: %{
          optional(:billing_details) => Stripe.Resources.BillingDetails.t() | nil,
          optional(:financial_account) => Stripe.Resources.FinancialAccount.t() | nil,
          optional(:type) => String.t() | nil,
          optional(:us_bank_account) => Stripe.Resources.UsBankAccount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ip_address` - IP address of the user initiating the OutboundPayment. Set if `present` is set to `true`. IP address collection is required for risk and compliance reasons. This will be used to help determine if the OutboundPayment is authorized or should be blocked. Max length: 5000. Nullable.
  * `present` - `true` if the OutboundPayment creation request is being made on behalf of an end user by a platform. Otherwise, `false`.
  """
  @type end_user_details :: %{
          optional(:ip_address) => String.t() | nil,
          optional(:present) => boolean() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `code` - Reason for the return. Possible values: `account_closed`, `account_frozen`, `bank_account_restricted`, `bank_ownership_changed`, `declined`, `incorrect_account_holder_name`, `invalid_account_number`, `invalid_currency`, `no_account`, `other`.
  * `transaction` - The Transaction associated with this object.
  """
  @type returned_details :: %{
          optional(:code) => String.t() | nil,
          optional(:transaction) => String.t() | Stripe.Resources.Treasury.Transaction.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `ach`
  * `type` - The US bank account network used to send funds. Possible values: `ach`, `us_domestic_wire`.
  * `us_domestic_wire`
  """
  @type tracking_details :: %{
          optional(:ach) => tracking_details_ach() | nil,
          optional(:type) => String.t() | nil,
          optional(:us_domestic_wire) => tracking_details_us_domestic_wire() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `trace_id` - ACH trace ID of the OutboundPayment for payments sent over the `ach` network. Max length: 5000.
  """
  @type tracking_details_ach :: %{
          optional(:trace_id) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `chips` - CHIPS System Sequence Number (SSN) of the OutboundPayment for payments sent over the `us_domestic_wire` network. Max length: 5000. Nullable.
  * `imad` - IMAD of the OutboundPayment for payments sent over the `us_domestic_wire` network. Max length: 5000. Nullable.
  * `omad` - OMAD of the OutboundPayment for payments sent over the `us_domestic_wire` network. Max length: 5000. Nullable.
  """
  @type tracking_details_us_domestic_wire :: %{
          optional(:chips) => String.t() | nil,
          optional(:imad) => String.t() | nil,
          optional(:omad) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "destination_payment_method_details" => %{
        fields: %{
          "billing_details" => {:resource, Stripe.Resources.BillingDetails},
          "financial_account" => {:resource, Stripe.Resources.FinancialAccount},
          "type" => :scalar,
          "us_bank_account" => {:resource, Stripe.Resources.UsBankAccount}
        }
      },
      "end_user_details" => %{
        fields: %{
          "ip_address" => :scalar,
          "present" => :scalar
        }
      },
      "returned_details" => %{
        fields: %{
          "code" => :scalar,
          "transaction" => {:resource, Stripe.Resources.Treasury.Transaction}
        }
      },
      "tracking_details" => %{
        fields: %{
          "ach" => %{
            fields: %{
              "trace_id" => :scalar
            }
          },
          "type" => :scalar,
          "us_domestic_wire" => %{
            fields: %{
              "chips" => :scalar,
              "imad" => :scalar,
              "omad" => :scalar
            }
          }
        }
      },
      "status_transitions" => {:resource, Stripe.Resources.StatusTransitions}
    }
  end
end
