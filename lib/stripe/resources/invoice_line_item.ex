# File generated from our OpenAPI spec
defmodule Stripe.Resources.InvoiceLineItem do
  @moduledoc """
  InvoiceLineItem

  Invoice Line Items represent the individual lines within an [invoice](https://docs.stripe.com/api/invoices) and only exist within the context of an invoice.

  Each line item is backed by either an [invoice item](https://docs.stripe.com/api/invoiceitems) or a [subscription item](https://docs.stripe.com/api/subscription_items).
  """

  @typedoc """
  * `amount` - The amount, in cents (or local equivalent).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `discount_amounts` - The amount of discount calculated per discount for this line item. Nullable. Expandable.
  * `discountable` - If true, discounts will apply to this line item. Always false for prorations.
  * `discounts` - The discounts applied to the invoice line item. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - The ID of the invoice that contains this line item. Max length: 5000. Nullable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Note that for line items with `type=subscription`, `metadata` reflects the current metadata from the subscription associated with the line item, unless the invoice line was directly updated with different metadata after creation.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `line_item`.
  * `parent` - The parent that generated this line item. Nullable. Expandable.
  * `period` - Expandable.
  * `pretax_credit_amounts` - Contains pretax credit amounts (ex: discount, credit grants, etc) that apply to this line item. Nullable. Expandable.
  * `pricing` - The pricing information of the line item. Nullable. Expandable.
  * `quantity` - Quantity of units for the invoice line item in integer format, with any decimal precision truncated. For the line item's full-precision decimal quantity, use `quantity_decimal`. This field will be deprecated in favor of `quantity_decimal` in a future version. If the line item is a proration or subscription, the quantity of the subscription that the proration was computed for. Nullable.
  * `quantity_decimal` - Non-negative decimal with at most 12 decimal places. The quantity of units for the line item. Format: decimal string. Nullable.
  * `subscription` - Nullable. Expandable.
  * `subtotal` - The subtotal of the line item, in cents (or local equivalent), before any discounts or taxes.
  * `taxes` - The tax information of the line item. Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :currency,
    :description,
    :discount_amounts,
    :discountable,
    :discounts,
    :id,
    :invoice,
    :livemode,
    :metadata,
    :object,
    :parent,
    :period,
    :pretax_credit_amounts,
    :pricing,
    :quantity,
    :quantity_decimal,
    :subscription,
    :subtotal,
    :taxes
  ]

  @object_name "line_item"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "discount_amounts",
      "discounts",
      "parent",
      "period",
      "pretax_credit_amounts",
      "pricing",
      "subscription",
      "taxes"
    ]

  def __nested_fields__ do
    %{
      "discount_amounts" => %{
        fields: %{
          "amount" => :scalar,
          "discount" => {:resource, Stripe.Resources.Discount}
        }
      },
      "parent" => %{
        fields: %{
          "invoice_item_details" => %{
            fields: %{
              "invoice_item" => :scalar,
              "proration" => :scalar,
              "proration_details" => %{
                fields: %{
                  "credited_items" => %{
                    fields: %{
                      "invoice" => :scalar,
                      "invoice_line_items" => {:list, :scalar}
                    }
                  }
                }
              },
              "subscription" => :scalar
            }
          },
          "subscription_item_details" => %{
            fields: %{
              "invoice_item" => :scalar,
              "proration" => :scalar,
              "proration_details" => %{
                fields: %{
                  "credited_items" => %{
                    fields: %{
                      "invoice" => :scalar,
                      "invoice_line_items" => {:list, :scalar}
                    }
                  }
                }
              },
              "subscription" => :scalar,
              "subscription_item" => :scalar
            }
          },
          "type" => :scalar
        }
      },
      "period" => %{
        fields: %{
          "end" => :scalar,
          "start" => :scalar
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
      "pricing" => %{
        fields: %{
          "price_details" => %{
            fields: %{
              "price" => {:resource, Stripe.Resources.Price},
              "product" => :scalar
            }
          },
          "type" => :scalar,
          "unit_amount_decimal" => :scalar
        }
      },
      "taxes" => %{
        fields: %{
          "amount" => :scalar,
          "tax_behavior" => :scalar,
          "tax_rate_details" => %{
            fields: %{
              "tax_rate" => {:resource, Stripe.Resources.TaxRate}
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
