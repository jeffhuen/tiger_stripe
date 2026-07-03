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
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `loss_reason` - The enum that describes the dispute loss outcome. If the dispute is not lost, this field will be absent. New enum values may be added in the future, so be sure to handle unknown values. Possible values: `cardholder_authentication_issuer_liability`, `eci5_token_transaction_with_tavv`, `excess_disputes_in_timeframe`, `has_not_met_the_minimum_dispute_amount_requirements`, `invalid_duplicate_dispute`, `invalid_incorrect_amount_dispute`, `invalid_no_authorization`, `invalid_use_of_disputes`, `merchandise_delivered_or_shipped`, `merchandise_or_service_as_described`, `not_cancelled`, `other`, `refund_issued`, `submitted_beyond_allowable_time_limit`, `transaction_3ds_required`, `transaction_approved_after_prior_fraud_dispute`, `transaction_authorized`, `transaction_electronically_read`, `transaction_qualifies_for_visa_easy_payment_service`, `transaction_unattended`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.dispute`.
  * `status` - Current status of the dispute. Possible values: `expired`, `lost`, `submitted`, `unsubmitted`, `won`.
  * `transaction` - The transaction being disputed. Expandable.
  * `treasury` - [Treasury](https://docs.stripe.com/api/treasury) details related to this dispute if it was created on a [FinancialAccount](/docs/api/treasury/financial_accounts Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

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
