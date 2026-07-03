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
  @type t :: %__MODULE__{}

  defstruct [:calculation, :id, :object, :payment_intent, :tax_transaction_attempts]

  @object_name "tax.association"
  def object_name, do: @object_name

  def expandable_fields, do: ["tax_transaction_attempts"]

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
