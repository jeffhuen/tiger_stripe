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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
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
          destination_payment_method_details: __MODULE__.DestinationPaymentMethodDetails.t(),
          end_user_details: __MODULE__.EndUserDetails.t(),
          expected_arrival_date: integer(),
          financial_account: String.t(),
          hosted_regulatory_receipt_url: String.t(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          returned_details: __MODULE__.ReturnedDetails.t(),
          statement_descriptor: String.t(),
          status: String.t(),
          status_transitions: Stripe.Resources.StatusTransitions.t(),
          tracking_details: __MODULE__.TrackingDetails.t(),
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

  defmodule DestinationPaymentMethodDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `billing_details`
    * `financial_account`
    * `type` - The type of the payment method used in the OutboundPayment. Possible values: `financial_account`, `us_bank_account`.
    * `us_bank_account`
    """
    @type t :: %__MODULE__{
            billing_details: Stripe.Resources.BillingDetails.t() | nil,
            financial_account: Stripe.Resources.FinancialAccount.t() | nil,
            type: String.t() | nil,
            us_bank_account: Stripe.Resources.UsBankAccount.t() | nil
          }
    defstruct [:billing_details, :financial_account, :type, :us_bank_account]
  end

  defmodule EndUserDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `ip_address` - IP address of the user initiating the OutboundPayment. Set if `present` is set to `true`. IP address collection is required for risk and compliance reasons. This will be used to help determine if the OutboundPayment is authorized or should be blocked. Max length: 5000. Nullable.
    * `present` - `true` if the OutboundPayment creation request is being made on behalf of an end user by a platform. Otherwise, `false`.
    """
    @type t :: %__MODULE__{
            ip_address: String.t() | nil,
            present: boolean() | nil
          }
    defstruct [:ip_address, :present]
  end

  defmodule ReturnedDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `code` - Reason for the return. Possible values: `account_closed`, `account_frozen`, `bank_account_restricted`, `bank_ownership_changed`, `declined`, `incorrect_account_holder_name`, `invalid_account_number`, `invalid_currency`, `no_account`, `other`.
    * `transaction` - The Transaction associated with this object.
    """
    @type t :: %__MODULE__{
            code: String.t() | nil,
            transaction: String.t() | Stripe.Resources.Treasury.Transaction.t() | nil
          }
    defstruct [:code, :transaction]
  end

  defmodule TrackingDetails do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `ach`
    * `type` - The US bank account network used to send funds. Possible values: `ach`, `us_domestic_wire`.
    * `us_domestic_wire`
    """
    @type t :: %__MODULE__{
            ach: __MODULE__.Ach.t() | nil,
            type: String.t() | nil,
            us_domestic_wire: __MODULE__.UsDomesticWire.t() | nil
          }
    defstruct [:ach, :type, :us_domestic_wire]

    defmodule Ach do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `trace_id` - ACH trace ID of the OutboundPayment for payments sent over the `ach` network. Max length: 5000.
      """
      @type t :: %__MODULE__{
              trace_id: String.t() | nil
            }
      defstruct [:trace_id]
    end

    defmodule UsDomesticWire do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `chips` - CHIPS System Sequence Number (SSN) of the OutboundPayment for payments sent over the `us_domestic_wire` network. Max length: 5000. Nullable.
      * `imad` - IMAD of the OutboundPayment for payments sent over the `us_domestic_wire` network. Max length: 5000. Nullable.
      * `omad` - OMAD of the OutboundPayment for payments sent over the `us_domestic_wire` network. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              chips: String.t() | nil,
              imad: String.t() | nil,
              omad: String.t() | nil
            }
      defstruct [:chips, :imad, :omad]
    end

    def __inner_types__ do
      %{
        "ach" => __MODULE__.Ach,
        "us_domestic_wire" => __MODULE__.UsDomesticWire
      }
    end
  end

  def __inner_types__ do
    %{
      "destination_payment_method_details" => __MODULE__.DestinationPaymentMethodDetails,
      "end_user_details" => __MODULE__.EndUserDetails,
      "returned_details" => __MODULE__.ReturnedDetails,
      "status_transitions" => Stripe.Resources.StatusTransitions,
      "tracking_details" => __MODULE__.TrackingDetails
    }
  end
end
