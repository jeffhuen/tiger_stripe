# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.Association do
  @moduledoc """
  TaxProductResourceTaxAssociation

  A Tax Association exposes the Tax Transactions that Stripe attempted to create on your behalf based on the PaymentIntent input
  """

  @typedoc """
  * `calculation` - The [Tax Calculation](https://docs.stripe.com/api/tax/calculations/object) that was included in PaymentIntent. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.association`.
  * `payment_intent` - The [PaymentIntent](https://docs.stripe.com/api/payment_intents/object) that this Tax Association is tracking. Max length: 5000.
  * `tax_transaction_attempts` - Information about the tax transactions linked to this payment intent Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          calculation: String.t(),
          id: String.t(),
          object: String.t(),
          payment_intent: String.t(),
          tax_transaction_attempts: [tax_transaction_attempts()]
        }

  defstruct [:calculation, :id, :object, :payment_intent, :tax_transaction_attempts]

  @object_name "tax.association"
  def object_name, do: @object_name

  def expandable_fields, do: ["tax_transaction_attempts"]

  @typedoc """
  * `committed`
  * `errored`
  * `source` - The source of the tax transaction attempt. This is either a refund or a payment intent. Max length: 5000.
  * `status` - The status of the transaction attempt. This can be `errored` or `committed`. Max length: 5000.
  """
  @type tax_transaction_attempts :: %{
          optional(:committed) => tax_transaction_attempts_committed() | nil,
          optional(:errored) => tax_transaction_attempts_errored() | nil,
          optional(:source) => String.t() | nil,
          optional(:status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `transaction` - The [Tax Transaction](https://docs.stripe.com/api/tax/transaction/object) Max length: 5000.
  """
  @type tax_transaction_attempts_committed :: %{
          optional(:transaction) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `reason` - Details on why we couldn't commit the tax transaction. Possible values: `another_payment_associated_with_calculation`, `calculation_expired`, `currency_mismatch`, `original_transaction_voided`, `unique_reference_violation`.
  """
  @type tax_transaction_attempts_errored :: %{
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "tax_transaction_attempts" => %{
        fields: %{
          "committed" => %{
            fields: %{
              "transaction" => :scalar
            }
          },
          "errored" => %{
            fields: %{
              "reason" => :scalar
            }
          },
          "source" => :scalar,
          "status" => :scalar
        }
      }
    }
  end
end
