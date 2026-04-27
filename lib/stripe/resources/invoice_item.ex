# File generated from our OpenAPI spec
defmodule Stripe.Resources.InvoiceItem do
  @moduledoc """
  InvoiceItem

  Invoice Items represent the component lines of an [invoice](https://docs.stripe.com/api/invoices). When you create an invoice item with an `invoice` field, it is attached to the specified invoice and included as [an invoice line item](https://docs.stripe.com/api/invoices/line_item) within [invoice.lines](https://docs.stripe.com/api/invoices/object#invoice_object-lines).

  Invoice Items can be created before you are ready to actually send the invoice. This can be particularly useful when combined
  with a [subscription](https://docs.stripe.com/api/subscriptions). Sometimes you want to add a charge or credit to a customer, but actually charge
  or credit the customer's card only at the end of a regular billing cycle. This is useful for combining several charges
  (to minimize per-transaction fees), or for having Stripe tabulate your usage-based billing totals.

  Related guides: [Integrate with the Invoicing API](https://docs.stripe.com/invoicing/integration), [Subscription Invoices](https://docs.stripe.com/billing/invoices/subscription#adding-upcoming-invoice-items).
  """

  @typedoc """
  * `amount` - Amount (in the `currency` specified) of the invoice item. This should always be equal to `unit_amount * quantity`.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - The ID of the customer to bill for this invoice item. Expandable.
  * `customer_account` - The ID of the account to bill for this invoice item. Max length: 5000. Nullable.
  * `date` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `discountable` - If true, discounts will apply to this invoice item. Always false for prorations.
  * `discounts` - The discounts which apply to the invoice item. Item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - The ID of the invoice this invoice item belongs to. Nullable. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `net_amount` - The amount after discounts, but before credits and taxes. This field is `null` for `discountable=true` items.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `invoiceitem`.
  * `parent` - The parent that generated this invoice item. Nullable. Expandable.
  * `period` - Expandable.
  * `pricing` - The pricing information of the invoice item. Nullable. Expandable.
  * `proration` - Whether the invoice item was created automatically as a proration adjustment when the customer switched plans.
  * `proration_details` - Expandable.
  * `quantity` - Quantity of units for the invoice item in integer format, with any decimal precision truncated. For the item's full-precision decimal quantity, use `quantity_decimal`. This field will be deprecated in favor of `quantity_decimal` in a future version. If the invoice item is a proration, the quantity of the subscription that the proration was computed for.
  * `quantity_decimal` - Non-negative decimal with at most 12 decimal places. The quantity of units for the invoice item. Format: decimal string.
  * `tax_rates` - The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item. Nullable. Expandable.
  * `test_clock` - ID of the test clock this invoice item belongs to. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          currency: String.t(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          date: integer(),
          description: String.t(),
          discountable: boolean(),
          discounts: [String.t() | Stripe.Resources.Discount.t()],
          id: String.t(),
          invoice: String.t() | Stripe.Resources.Invoice.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          net_amount: integer() | nil,
          object: String.t(),
          parent: parent(),
          period: period(),
          pricing: pricing(),
          proration: boolean(),
          proration_details: proration_details() | nil,
          quantity: integer(),
          quantity_decimal: String.t(),
          tax_rates: [Stripe.Resources.TaxRate.t()],
          test_clock: String.t() | Stripe.Resources.TestHelpers.TestClock.t()
        }

  defstruct [
    :amount,
    :currency,
    :customer,
    :customer_account,
    :date,
    :description,
    :discountable,
    :discounts,
    :id,
    :invoice,
    :livemode,
    :metadata,
    :net_amount,
    :object,
    :parent,
    :period,
    :pricing,
    :proration,
    :proration_details,
    :quantity,
    :quantity_decimal,
    :tax_rates,
    :test_clock
  ]

  @object_name "invoiceitem"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "customer",
      "discounts",
      "invoice",
      "parent",
      "period",
      "pricing",
      "proration_details",
      "tax_rates",
      "test_clock"
    ]

  @typedoc """
  * `subscription_details` - Details about the subscription that generated this invoice item Nullable.
  * `type` - The type of parent that generated this invoice item Possible values: `subscription_details`.
  """
  @type parent :: %{
          optional(:subscription_details) => parent_subscription_details() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `subscription` - The subscription that generated this invoice item Max length: 5000.
  * `subscription_item` - The subscription item that generated this invoice item Max length: 5000.
  """
  @type parent_subscription_details :: %{
          optional(:subscription) => String.t() | nil,
          optional(:subscription_item) => String.t() | nil,
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
  * `discount_amounts` - Discount amounts applied when the proration was created.
  """
  @type proration_details :: %{
          optional(:discount_amounts) => [proration_details_discount_amounts()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount, in cents (or local equivalent), of the discount.
  * `discount` - The discount that was applied to get this discount amount.
  """
  @type proration_details_discount_amounts :: %{
          optional(:amount) => integer() | nil,
          optional(:discount) => String.t() | Stripe.Resources.Discount.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "parent" => %{
        fields: %{
          "subscription_details" => %{
            fields: %{
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
      "proration_details" => %{
        fields: %{
          "discount_amounts" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "discount" => {:resource, Stripe.Resources.Discount}
               }
             }}
        }
      }
    }
  end
end
