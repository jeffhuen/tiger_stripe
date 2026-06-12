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
  @type t :: %__MODULE__{
          amount: integer(),
          currency: String.t(),
          description: String.t(),
          discount_amounts: [discount_amounts()],
          discountable: boolean(),
          discounts: [String.t() | Stripe.Resources.Discount.t()],
          id: String.t(),
          invoice: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          parent: parent(),
          period: period(),
          pretax_credit_amounts: [pretax_credit_amounts()],
          pricing: pricing(),
          quantity: integer(),
          quantity_decimal: String.t(),
          subscription: String.t() | Stripe.Resources.Subscription.t(),
          subtotal: integer(),
          taxes: [taxes()]
        }

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

  @typedoc """
  * `amount` - The amount, in cents (or local equivalent), of the discount.
  * `discount` - The discount that was applied to get this discount amount.
  """
  @type discount_amounts :: %{
          optional(:amount) => integer() | nil,
          optional(:discount) => String.t() | Stripe.Resources.Discount.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `invoice_item_details` - Details about the invoice item that generated this line item Nullable.
  * `subscription_item_details` - Details about the subscription item that generated this line item Nullable.
  * `type` - The type of parent that generated this line item Possible values: `invoice_item_details`, `subscription_item_details`.
  """
  @type parent :: %{
          optional(:invoice_item_details) => parent_invoice_item_details() | nil,
          optional(:subscription_item_details) => parent_subscription_item_details() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `invoice_item` - The invoice item that generated this line item Max length: 5000.
  * `proration` - Whether this is a proration
  * `proration_details` - Additional details for proration line items Nullable.
  * `subscription` - The subscription that the invoice item belongs to Max length: 5000. Nullable.
  """
  @type parent_invoice_item_details :: %{
          optional(:invoice_item) => String.t() | nil,
          optional(:proration) => boolean() | nil,
          optional(:proration_details) => parent_invoice_item_details_proration_details() | nil,
          optional(:subscription) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `credited_items` - For a credit proration `line_item`, the original debit line_items to which the credit proration applies. Nullable.
  """
  @type parent_invoice_item_details_proration_details :: %{
          optional(:credited_items) =>
            parent_invoice_item_details_proration_details_credited_items() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `invoice` - Invoice containing the credited invoice line items Max length: 5000.
  * `invoice_line_items` - Credited invoice line items
  """
  @type parent_invoice_item_details_proration_details_credited_items :: %{
          optional(:invoice) => String.t() | nil,
          optional(:invoice_line_items) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `invoice_item` - The invoice item that generated this line item Max length: 5000. Nullable.
  * `proration` - Whether this is a proration
  * `proration_details` - Additional details for proration line items Nullable.
  * `subscription` - The subscription that the subscription item belongs to Max length: 5000. Nullable.
  * `subscription_item` - The subscription item that generated this line item Max length: 5000.
  """
  @type parent_subscription_item_details :: %{
          optional(:invoice_item) => String.t() | nil,
          optional(:proration) => boolean() | nil,
          optional(:proration_details) =>
            parent_subscription_item_details_proration_details() | nil,
          optional(:subscription) => String.t() | nil,
          optional(:subscription_item) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `credited_items` - For a credit proration `line_item`, the original debit line_items to which the credit proration applies. Nullable.
  """
  @type parent_subscription_item_details_proration_details :: %{
          optional(:credited_items) =>
            parent_subscription_item_details_proration_details_credited_items() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `invoice` - Invoice containing the credited invoice line items Max length: 5000.
  * `invoice_line_items` - Credited invoice line items
  """
  @type parent_subscription_item_details_proration_details_credited_items :: %{
          optional(:invoice) => String.t() | nil,
          optional(:invoice_line_items) => [String.t()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `end` - The end of the period, which must be greater than or equal to the start. This value is inclusive. Format: Unix timestamp.
  * `start` - The start of the period. This value is inclusive. Format: Unix timestamp.
  """
  @type period :: %{
          optional(:end) => integer() | nil,
          optional(:start) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount, in cents (or local equivalent), of the pretax credit amount.
  * `credit_balance_transaction` - The credit balance transaction that was applied to get this pretax credit amount. Nullable.
  * `discount` - The discount that was applied to get this pretax credit amount.
  * `type` - Type of the pretax credit amount referenced. Possible values: `credit_balance_transaction`, `discount`.
  """
  @type pretax_credit_amounts :: %{
          optional(:amount) => integer() | nil,
          optional(:credit_balance_transaction) =>
            String.t() | Stripe.Resources.Billing.CreditBalanceTransaction.t() | nil,
          optional(:discount) => String.t() | Stripe.Resources.Discount.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `price_details`
  * `type` - The type of the pricing details. Possible values: `price_details`.
  * `unit_amount_decimal` - The unit amount (in the `currency` specified) of the item which contains a decimal value with at most 12 decimal places. Format: decimal string. Nullable.
  """
  @type pricing :: %{
          optional(:price_details) => pricing_price_details() | nil,
          optional(:type) => String.t() | nil,
          optional(:unit_amount_decimal) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `price` - The ID of the price this item is associated with.
  * `product` - The ID of the product this item is associated with. Max length: 5000.
  """
  @type pricing_price_details :: %{
          optional(:price) => String.t() | Stripe.Resources.Price.t() | nil,
          optional(:product) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount of the tax, in cents (or local equivalent).
  * `tax_behavior` - Whether this tax is inclusive or exclusive. Possible values: `exclusive`, `inclusive`.
  * `tax_rate_details` - Additional details about the tax rate. Only present when `type` is `tax_rate_details`. Nullable.
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_available`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  * `type` - The type of tax information. Possible values: `tax_rate_details`.
  """
  @type taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_rate_details) => taxes_tax_rate_details() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tax_rate` - ID of the tax rate Max length: 5000.
  """
  @type taxes_tax_rate_details :: %{
          optional(:tax_rate) => String.t() | nil,
          optional(String.t()) => term()
        }

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
