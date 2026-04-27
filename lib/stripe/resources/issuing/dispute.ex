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
          evidence: evidence(),
          id: String.t(),
          livemode: boolean(),
          loss_reason: String.t() | nil,
          metadata: %{String.t() => String.t()},
          object: String.t(),
          status: String.t(),
          transaction: String.t() | Stripe.Resources.Issuing.Transaction.t(),
          treasury: treasury() | nil
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
  @type evidence :: %{
          optional(:canceled) => evidence_canceled() | nil,
          optional(:duplicate) => evidence_duplicate() | nil,
          optional(:fraudulent) => evidence_fraudulent() | nil,
          optional(:merchandise_not_as_described) =>
            evidence_merchandise_not_as_described() | nil,
          optional(:no_valid_authorization) => evidence_no_valid_authorization() | nil,
          optional(:not_received) => evidence_not_received() | nil,
          optional(:other) => evidence_other() | nil,
          optional(:reason) => String.t() | nil,
          optional(:service_not_as_described) => evidence_service_not_as_described() | nil,
          optional(String.t()) => term()
        }

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
  @type evidence_canceled :: %{
          optional(:additional_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:canceled_at) => integer() | nil,
          optional(:cancellation_policy_provided) => boolean() | nil,
          optional(:cancellation_reason) => String.t() | nil,
          optional(:expected_at) => integer() | nil,
          optional(:explanation) => String.t() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:product_type) => String.t() | nil,
          optional(:return_status) => String.t() | nil,
          optional(:returned_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
  * `card_statement` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the card statement showing that the product had already been paid for. Nullable.
  * `cash_receipt` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the receipt showing that the product had been paid for in cash. Nullable.
  * `check_image` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Image of the front and back of the check that was used to pay for the product. Nullable.
  * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
  * `original_transaction` - Transaction (e.g., ipi_...) that the disputed transaction is a duplicate of. Of the two or more transactions that are copies of each other, this is original undisputed one. Max length: 5000. Nullable.
  """
  @type evidence_duplicate :: %{
          optional(:additional_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:card_statement) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:cash_receipt) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:check_image) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:explanation) => String.t() | nil,
          optional(:original_transaction) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
  * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
  """
  @type evidence_fraudulent :: %{
          optional(:additional_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:explanation) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
  * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
  * `received_at` - Date when the product was received. Format: Unix timestamp. Nullable.
  * `return_description` - Description of the cardholder's attempt to return the product. Max length: 5000. Nullable.
  * `return_status` - Result of cardholder's attempt to return the product. Possible values: `merchant_rejected`, `successful`. Nullable.
  * `returned_at` - Date when the product was returned or attempted to be returned. Format: Unix timestamp. Nullable.
  """
  @type evidence_merchandise_not_as_described :: %{
          optional(:additional_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:explanation) => String.t() | nil,
          optional(:received_at) => integer() | nil,
          optional(:return_description) => String.t() | nil,
          optional(:return_status) => String.t() | nil,
          optional(:returned_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
  * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
  """
  @type evidence_no_valid_authorization :: %{
          optional(:additional_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:explanation) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
  * `expected_at` - Date when the cardholder expected to receive the product. Format: Unix timestamp. Nullable.
  * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
  * `product_description` - Description of the merchandise or service that was purchased. Max length: 5000. Nullable.
  * `product_type` - Whether the product was a merchandise or service. Possible values: `merchandise`, `service`. Nullable.
  """
  @type evidence_not_received :: %{
          optional(:additional_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:expected_at) => integer() | nil,
          optional(:explanation) => String.t() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:product_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
  * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
  * `product_description` - Description of the merchandise or service that was purchased. Max length: 5000. Nullable.
  * `product_type` - Whether the product was a merchandise or service. Possible values: `merchandise`, `service`. Nullable.
  """
  @type evidence_other :: %{
          optional(:additional_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:explanation) => String.t() | nil,
          optional(:product_description) => String.t() | nil,
          optional(:product_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `additional_documentation` - (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute. Nullable.
  * `canceled_at` - Date when order was canceled. Format: Unix timestamp. Nullable.
  * `cancellation_reason` - Reason for canceling the order. Max length: 5000. Nullable.
  * `explanation` - Explanation of why the cardholder is disputing this transaction. Max length: 5000. Nullable.
  * `received_at` - Date when the product was received. Format: Unix timestamp. Nullable.
  """
  @type evidence_service_not_as_described :: %{
          optional(:additional_documentation) => String.t() | Stripe.Resources.File.t() | nil,
          optional(:canceled_at) => integer() | nil,
          optional(:cancellation_reason) => String.t() | nil,
          optional(:explanation) => String.t() | nil,
          optional(:received_at) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `debit_reversal` - The Treasury [DebitReversal](https://docs.stripe.com/api/treasury/debit_reversals) representing this Issuing dispute Max length: 5000. Nullable.
  * `received_debit` - The Treasury [ReceivedDebit](https://docs.stripe.com/api/treasury/received_debits) that is being disputed. Max length: 5000.
  """
  @type treasury :: %{
          optional(:debit_reversal) => String.t() | nil,
          optional(:received_debit) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "evidence" => %{
        fields: %{
          "canceled" => %{
            fields: %{
              "additional_documentation" => {:resource, Stripe.Resources.File},
              "canceled_at" => :scalar,
              "cancellation_policy_provided" => :scalar,
              "cancellation_reason" => :scalar,
              "expected_at" => :scalar,
              "explanation" => :scalar,
              "product_description" => :scalar,
              "product_type" => :scalar,
              "return_status" => :scalar,
              "returned_at" => :scalar
            }
          },
          "duplicate" => %{
            fields: %{
              "additional_documentation" => {:resource, Stripe.Resources.File},
              "card_statement" => {:resource, Stripe.Resources.File},
              "cash_receipt" => {:resource, Stripe.Resources.File},
              "check_image" => {:resource, Stripe.Resources.File},
              "explanation" => :scalar,
              "original_transaction" => :scalar
            }
          },
          "fraudulent" => %{
            fields: %{
              "additional_documentation" => {:resource, Stripe.Resources.File},
              "explanation" => :scalar
            }
          },
          "merchandise_not_as_described" => %{
            fields: %{
              "additional_documentation" => {:resource, Stripe.Resources.File},
              "explanation" => :scalar,
              "received_at" => :scalar,
              "return_description" => :scalar,
              "return_status" => :scalar,
              "returned_at" => :scalar
            }
          },
          "no_valid_authorization" => %{
            fields: %{
              "additional_documentation" => {:resource, Stripe.Resources.File},
              "explanation" => :scalar
            }
          },
          "not_received" => %{
            fields: %{
              "additional_documentation" => {:resource, Stripe.Resources.File},
              "expected_at" => :scalar,
              "explanation" => :scalar,
              "product_description" => :scalar,
              "product_type" => :scalar
            }
          },
          "other" => %{
            fields: %{
              "additional_documentation" => {:resource, Stripe.Resources.File},
              "explanation" => :scalar,
              "product_description" => :scalar,
              "product_type" => :scalar
            }
          },
          "reason" => :scalar,
          "service_not_as_described" => %{
            fields: %{
              "additional_documentation" => {:resource, Stripe.Resources.File},
              "canceled_at" => :scalar,
              "cancellation_reason" => :scalar,
              "explanation" => :scalar,
              "received_at" => :scalar
            }
          }
        }
      },
      "treasury" => %{
        fields: %{
          "debit_reversal" => :scalar,
          "received_debit" => :scalar
        }
      }
    }
  end
end
