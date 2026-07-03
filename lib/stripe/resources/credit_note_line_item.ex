# File generated from our OpenAPI spec
defmodule Stripe.Resources.CreditNoteLineItem do
  @moduledoc """
  CreditNoteLineItem

  The credit note line item object
  """

  @typedoc """
  * `amount` - The integer amount in cents (or local equivalent) representing the gross amount being credited for this line item, excluding (exclusive) tax and discounts.
  * `description` - Description of the item being credited. Max length: 5000. Nullable.
  * `discount_amount` - The integer amount in cents (or local equivalent) representing the discount being credited for this line item.
  * `discount_amounts` - The amount of discount calculated per discount for this line item Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice_line_item` - ID of the invoice line item being credited Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `credit_note_line_item`.
  * `pretax_credit_amounts` - The pretax credit amounts (ex: discount, credit grants, etc) for this line item. Expandable.
  * `quantity` - The number of units of product being credited. Nullable.
  * `tax_rates` - The tax rates which apply to the line item. Expandable.
  * `taxes` - The tax information of the line item. Nullable. Expandable.
  * `type` - The type of the credit note line item, one of `invoice_line_item` or `custom_line_item`. When the type is `invoice_line_item` there is an additional `invoice_line_item` property on the resource the value of which is the id of the credited line item on the invoice. Possible values: `custom_line_item`, `invoice_line_item`.
  * `unit_amount` - The cost of each unit of product being credited. Nullable.
  * `unit_amount_decimal` - Same as `unit_amount`, but contains a decimal value with at most 12 decimal places. Format: decimal string. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :description,
    :discount_amount,
    :discount_amounts,
    :id,
    :invoice_line_item,
    :livemode,
    :object,
    :pretax_credit_amounts,
    :quantity,
    :tax_rates,
    :taxes,
    :type,
    :unit_amount,
    :unit_amount_decimal
  ]

  @object_name "credit_note_line_item"
  def object_name, do: @object_name

  def expandable_fields, do: ["discount_amounts", "pretax_credit_amounts", "tax_rates", "taxes"]

  def __nested_fields__ do
    %{
      "discount_amounts" => %{
        fields: %{
          "amount" => :scalar,
          "discount" => {:resource, Stripe.Resources.Discount}
        }
      },
      "pretax_credit_amounts" => %{
        fields: %{
          "amount" => :scalar,
          "credit_balance_transaction" =>
            {:resource, Stripe.Resources.Billing.CreditBalanceTransaction},
          "discount" => {:resource, Stripe.Resources.Discount},
          "type" => :scalar
        }
      },
      "taxes" => %{
        fields: %{
          "amount" => :scalar,
          "tax_behavior" => :scalar,
          "tax_rate_details" => %{
            fields: %{
              "tax_rate" => :scalar
            }
          },
          "taxability_reason" => :scalar,
          "taxable_amount" => :scalar,
          "type" => :scalar
        }
      }
    }
  end
end
