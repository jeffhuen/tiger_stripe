# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.Dispute do
  @moduledoc """
  IssuingDispute

  As a [card issuer](https://docs.stripe.com/issuing), you can dispute transactions that the cardholder does not recognize, suspects to be fraudulent, or has other issues with.

  Related guide: [Issuing disputes](https://docs.stripe.com/issuing/purchases/disputes)
  """

  @typedoc """
  * `amount` - Disputed amount in the card's currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Usually the amount of the `transaction`, but can differ (usually because of currency fluctuation).
  * `balance_transactions` - List of balance transactions associated with the dispute. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - The currency the `transaction` was made in. Format: ISO 4217 currency code.
  * `evidence` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `loss_reason` - The enum that describes the dispute loss outcome. If the dispute is not lost, this field will be absent. New enum values may be added in the future, so be sure to handle unknown values. Possible values: `cardholder_authentication_issuer_liability`, `eci5_token_transaction_with_tavv`, `excess_disputes_in_timeframe`, `has_not_met_the_minimum_dispute_amount_requirements`, `invalid_duplicate_dispute`, `invalid_incorrect_amount_dispute`, `invalid_no_authorization`, `invalid_use_of_disputes`, `merchandise_delivered_or_shipped`, `merchandise_or_service_as_described`, `not_cancelled`, `other`, `refund_issued`, `submitted_beyond_allowable_time_limit`, `transaction_3ds_required`, `transaction_approved_after_prior_fraud_dispute`, `transaction_authorized`, `transaction_electronically_read`, `transaction_qualifies_for_visa_easy_payment_service`, `transaction_unattended`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.dispute`.
  * `status` - Current status of the dispute. Possible values: `expired`, `lost`, `submitted`, `unsubmitted`, `won`.
  * `transaction` - The transaction being disputed. Expandable.
  * `treasury` - [Treasury](https://docs.stripe.com/api/treasury) details related to this dispute if it was created on a [FinancialAccount](/docs/api/treasury/financial_accounts Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          balance_transactions: [Stripe.Resources.BalanceTransaction.t()] | nil,
          created: integer(),
          currency: String.t(),
          evidence: __MODULE__.Evidence.t(),
          id: String.t(),
          livemode: boolean(),
          loss_reason: String.t() | nil,
          metadata: %{String.t() => String.t()},
          object: String.t(),
          status: String.t(),
          transaction: String.t() | Stripe.Resources.Issuing.Transaction.t(),
          treasury: __MODULE__.Treasury.t() | nil
        }

  defstruct [
    :amount,
    :balance_transactions,
    :created,
    :currency,
    :evidence,
    :id,
    :livemode,
    :loss_reason,
    :metadata,
    :object,
    :status,
    :transaction,
    :treasury
  ]

  @object_name "issuing.dispute"
  def object_name, do: @object_name

  def expandable_fields, do: ["balance_transactions", "evidence", "transaction", "treasury"]

  defmodule Evidence do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `canceled`
    * `duplicate`
    * `fraudulent`
    * `merchandise_not_as_described`
    * `no_valid_authorization`
    * `not_received`
    * `other`
    * `reason` - The reason for filing the dispute. Its value will match the field containing the evidence. Possible values: `canceled`, `duplicate`, `fraudulent`, `merchandise_not_as_described`, `no_valid_authorization`, `not_received`, `other`, `service_not_as_described`.
    * `service_not_as_described`
    """
    @type t :: %__MODULE__{
            canceled: __MODULE__.Canceled.t() | nil,
            duplicate: __MODULE__.Duplicate.t() | nil,
            fraudulent: __MODULE__.Fraudulent.t() | nil,
            merchandise_not_as_described: __MODULE__.MerchandiseNotAsDescribed.t() | nil,
            no_valid_authorization: __MODULE__.NoValidAuthorization.t() | nil,
            not_received: __MODULE__.NotReceived.t() | nil,
            other: __MODULE__.Other.t() | nil,
            reason: String.t() | nil,
            service_not_as_described: __MODULE__.ServiceNotAsDescribed.t() | nil
          }
    defstruct [
      :canceled,
      :duplicate,
      :fraudulent,
      :merchandise_not_as_described,
      :no_valid_authorization,
      :not_received,
      :other,
      :reason,
      :service_not_as_described
    ]

    defmodule Canceled do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
      * `canceled_at` - Date when order was canceled. Format: Unix timestamp. Nullable.
      * `cancellation_policy_provided` - Whether the cardholder was provided with a cancellation policy. Nullable.
      * `cancellation_reason` - Reason for canceling the order. Max length: 5000. Nullable.
      * `expected_at` - Date when the cardholder expected to receive the product. Format: Unix timestamp. Nullable.
      * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
      * `product_description` - Description of the merchandise or service that was purchased. Max length: 5000. Nullable.
      * `product_type` - Whether the product was a merchandise or service. Possible values: `merchandise`, `service`. Nullable.
      * `return_status` - Result of cardholder's attempt to return the product. Possible values: `merchant_rejected`, `successful`. Nullable.
      * `returned_at` - Date when the product was returned or attempted to be returned. Format: Unix timestamp. Nullable.
      """
      @type t :: %__MODULE__{
              additional_documentation: String.t() | Stripe.Resources.File.t() | nil,
              canceled_at: integer() | nil,
              cancellation_policy_provided: boolean() | nil,
              cancellation_reason: String.t() | nil,
              expected_at: integer() | nil,
              explanation: String.t() | nil,
              product_description: String.t() | nil,
              product_type: String.t() | nil,
              return_status: String.t() | nil,
              returned_at: integer() | nil
            }
      defstruct [
        :additional_documentation,
        :canceled_at,
        :cancellation_policy_provided,
        :cancellation_reason,
        :expected_at,
        :explanation,
        :product_description,
        :product_type,
        :return_status,
        :returned_at
      ]
    end

    defmodule Duplicate do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
      * `card_statement` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the card statement showing that the product had already been paid for. Nullable.
      * `cash_receipt` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the receipt showing that the product had been paid for in cash. Nullable.
      * `check_image` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Image of the front and back of the check that was used to pay for the product. Nullable.
      * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
      * `original_transaction` - Transaction (e.g., ipi_...) that the disputed transaction is a duplicate of. Of the two or more transactions that are copies of each other, this is original undisputed one. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              additional_documentation: String.t() | Stripe.Resources.File.t() | nil,
              card_statement: String.t() | Stripe.Resources.File.t() | nil,
              cash_receipt: String.t() | Stripe.Resources.File.t() | nil,
              check_image: String.t() | Stripe.Resources.File.t() | nil,
              explanation: String.t() | nil,
              original_transaction: String.t() | nil
            }
      defstruct [
        :additional_documentation,
        :card_statement,
        :cash_receipt,
        :check_image,
        :explanation,
        :original_transaction
      ]
    end

    defmodule Fraudulent do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
      * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              additional_documentation: String.t() | Stripe.Resources.File.t() | nil,
              explanation: String.t() | nil
            }
      defstruct [:additional_documentation, :explanation]
    end

    defmodule MerchandiseNotAsDescribed do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
      * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
      * `received_at` - Date when the product was received. Format: Unix timestamp. Nullable.
      * `return_description` - Description of the cardholder's attempt to return the product. Max length: 5000. Nullable.
      * `return_status` - Result of cardholder's attempt to return the product. Possible values: `merchant_rejected`, `successful`. Nullable.
      * `returned_at` - Date when the product was returned or attempted to be returned. Format: Unix timestamp. Nullable.
      """
      @type t :: %__MODULE__{
              additional_documentation: String.t() | Stripe.Resources.File.t() | nil,
              explanation: String.t() | nil,
              received_at: integer() | nil,
              return_description: String.t() | nil,
              return_status: String.t() | nil,
              returned_at: integer() | nil
            }
      defstruct [
        :additional_documentation,
        :explanation,
        :received_at,
        :return_description,
        :return_status,
        :returned_at
      ]
    end

    defmodule NoValidAuthorization do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
      * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              additional_documentation: String.t() | Stripe.Resources.File.t() | nil,
              explanation: String.t() | nil
            }
      defstruct [:additional_documentation, :explanation]
    end

    defmodule NotReceived do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
      * `expected_at` - Date when the cardholder expected to receive the product. Format: Unix timestamp. Nullable.
      * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
      * `product_description` - Description of the merchandise or service that was purchased. Max length: 5000. Nullable.
      * `product_type` - Whether the product was a merchandise or service. Possible values: `merchandise`, `service`. Nullable.
      """
      @type t :: %__MODULE__{
              additional_documentation: String.t() | Stripe.Resources.File.t() | nil,
              expected_at: integer() | nil,
              explanation: String.t() | nil,
              product_description: String.t() | nil,
              product_type: String.t() | nil
            }
      defstruct [
        :additional_documentation,
        :expected_at,
        :explanation,
        :product_description,
        :product_type
      ]
    end

    defmodule Other do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
      * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
      * `product_description` - Description of the merchandise or service that was purchased. Max length: 5000. Nullable.
      * `product_type` - Whether the product was a merchandise or service. Possible values: `merchandise`, `service`. Nullable.
      """
      @type t :: %__MODULE__{
              additional_documentation: String.t() | Stripe.Resources.File.t() | nil,
              explanation: String.t() | nil,
              product_description: String.t() | nil,
              product_type: String.t() | nil
            }
      defstruct [:additional_documentation, :explanation, :product_description, :product_type]
    end

    defmodule ServiceNotAsDescribed do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
      * `canceled_at` - Date when order was canceled. Format: Unix timestamp. Nullable.
      * `cancellation_reason` - Reason for canceling the order. Max length: 5000. Nullable.
      * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
      * `received_at` - Date when the product was received. Format: Unix timestamp. Nullable.
      """
      @type t :: %__MODULE__{
              additional_documentation: String.t() | Stripe.Resources.File.t() | nil,
              canceled_at: integer() | nil,
              cancellation_reason: String.t() | nil,
              explanation: String.t() | nil,
              received_at: integer() | nil
            }
      defstruct [
        :additional_documentation,
        :canceled_at,
        :cancellation_reason,
        :explanation,
        :received_at
      ]
    end

    def __inner_types__ do
      %{
        "canceled" => __MODULE__.Canceled,
        "duplicate" => __MODULE__.Duplicate,
        "fraudulent" => __MODULE__.Fraudulent,
        "merchandise_not_as_described" => __MODULE__.MerchandiseNotAsDescribed,
        "no_valid_authorization" => __MODULE__.NoValidAuthorization,
        "not_received" => __MODULE__.NotReceived,
        "other" => __MODULE__.Other,
        "service_not_as_described" => __MODULE__.ServiceNotAsDescribed
      }
    end
  end

  defmodule Treasury do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `debit_reversal` - The Treasury [DebitReversal](https://docs.stripe.com/api/treasury/debit_reversals) representing this Issuing dispute Max length: 5000. Nullable.
    * `received_debit` - The Treasury [ReceivedDebit](https://docs.stripe.com/api/treasury/received_debits) that is being disputed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            debit_reversal: String.t() | nil,
            received_debit: String.t() | nil
          }
    defstruct [:debit_reversal, :received_debit]
  end

  def __inner_types__ do
    %{
      "evidence" => __MODULE__.Evidence,
      "treasury" => __MODULE__.Treasury
    }
  end
end
