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
          discount_amounts: [__MODULE__.DiscountAmounts.t()],
          discountable: boolean(),
          discounts: [String.t() | Stripe.Resources.Discount.t()],
          id: String.t(),
          invoice: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          parent: __MODULE__.Parent.t(),
          period: __MODULE__.Period.t(),
          pretax_credit_amounts: [__MODULE__.PretaxCreditAmounts.t()],
          pricing: __MODULE__.Pricing.t(),
          quantity: integer(),
          quantity_decimal: String.t(),
          subscription: String.t() | Stripe.Resources.Subscription.t(),
          subtotal: integer(),
          taxes: [__MODULE__.Taxes.t()]
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

  defmodule DiscountAmounts do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount, in cents (or local equivalent), of the discount.
    * `discount` - The discount that was applied to get this discount amount.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            discount: String.t() | Stripe.Resources.Discount.t() | nil
          }
    defstruct [:amount, :discount]
  end

  defmodule Parent do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `invoice_item_details` - Details about the invoice item that generated this line item Nullable.
    * `subscription_item_details` - Details about the subscription item that generated this line item Nullable.
    * `type` - The type of parent that generated this line item Possible values: `invoice_item_details`, `subscription_item_details`.
    """
    @type t :: %__MODULE__{
            invoice_item_details: __MODULE__.InvoiceItemDetails.t() | nil,
            subscription_item_details: __MODULE__.SubscriptionItemDetails.t() | nil,
            type: String.t() | nil
          }
    defstruct [:invoice_item_details, :subscription_item_details, :type]

    defmodule InvoiceItemDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `invoice_item` - The invoice item that generated this line item Max length: 5000.
      * `proration` - Whether this is a proration
      * `proration_details` - Additional details for proration line items Nullable.
      * `subscription` - The subscription that the invoice item belongs to Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              invoice_item: String.t() | nil,
              proration: boolean() | nil,
              proration_details: __MODULE__.ProrationDetails.t() | nil,
              subscription: String.t() | nil
            }
      defstruct [:invoice_item, :proration, :proration_details, :subscription]

      defmodule ProrationDetails do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `credited_items` - For a credit proration `line_item`, the original debit line_items to which the credit proration applies. Nullable.
        """
        @type t :: %__MODULE__{
                credited_items: __MODULE__.CreditedItems.t() | nil
              }
        defstruct [:credited_items]

        defmodule CreditedItems do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `invoice` - Invoice containing the credited invoice line items Max length: 5000.
          * `invoice_line_items` - Credited invoice line items
          """
          @type t :: %__MODULE__{
                  invoice: String.t() | nil,
                  invoice_line_items: [String.t()] | nil
                }
          defstruct [:invoice, :invoice_line_items]
        end

        def __inner_types__ do
          %{
            "credited_items" => __MODULE__.CreditedItems
          }
        end
      end

      def __inner_types__ do
        %{
          "proration_details" => __MODULE__.ProrationDetails
        }
      end
    end

    defmodule SubscriptionItemDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `invoice_item` - The invoice item that generated this line item Max length: 5000. Nullable.
      * `proration` - Whether this is a proration
      * `proration_details` - Additional details for proration line items Nullable.
      * `subscription` - The subscription that the subscription item belongs to Max length: 5000. Nullable.
      * `subscription_item` - The subscription item that generated this line item Max length: 5000.
      """
      @type t :: %__MODULE__{
              invoice_item: String.t() | nil,
              proration: boolean() | nil,
              proration_details: __MODULE__.ProrationDetails.t() | nil,
              subscription: String.t() | nil,
              subscription_item: String.t() | nil
            }
      defstruct [:invoice_item, :proration, :proration_details, :subscription, :subscription_item]

      defmodule ProrationDetails do
        @moduledoc "Nested struct within the parent resource."

        @typedoc """
        * `credited_items` - For a credit proration `line_item`, the original debit line_items to which the credit proration applies. Nullable.
        """
        @type t :: %__MODULE__{
                credited_items: __MODULE__.CreditedItems.t() | nil
              }
        defstruct [:credited_items]

        defmodule CreditedItems do
          @moduledoc "Nested struct within the parent resource."

          @typedoc """
          * `invoice` - Invoice containing the credited invoice line items Max length: 5000.
          * `invoice_line_items` - Credited invoice line items
          """
          @type t :: %__MODULE__{
                  invoice: String.t() | nil,
                  invoice_line_items: [String.t()] | nil
                }
          defstruct [:invoice, :invoice_line_items]
        end

        def __inner_types__ do
          %{
            "credited_items" => __MODULE__.CreditedItems
          }
        end
      end

      def __inner_types__ do
        %{
          "proration_details" => __MODULE__.ProrationDetails
        }
      end
    end

    def __inner_types__ do
      %{
        "invoice_item_details" => __MODULE__.InvoiceItemDetails,
        "subscription_item_details" => __MODULE__.SubscriptionItemDetails
      }
    end
  end

  defmodule Period do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `end` - The end of the period, which must be greater than or equal to the start. This value is inclusive. Format: Unix timestamp.
    * `start` - The start of the period. This value is inclusive. Format: Unix timestamp.
    """
    @type t :: %__MODULE__{
            end: integer() | nil,
            start: integer() | nil
          }
    defstruct [:end, :start]
  end

  defmodule PretaxCreditAmounts do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount, in cents (or local equivalent), of the pretax credit amount.
    * `credit_balance_transaction` - The credit balance transaction that was applied to get this pretax credit amount. Nullable.
    * `discount` - The discount that was applied to get this pretax credit amount.
    * `type` - Type of the pretax credit amount referenced. Possible values: `credit_balance_transaction`, `discount`.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            credit_balance_transaction:
              String.t() | Stripe.Resources.Billing.CreditBalanceTransaction.t() | nil,
            discount: String.t() | Stripe.Resources.Discount.t() | nil,
            type: String.t() | nil
          }
    defstruct [:amount, :credit_balance_transaction, :discount, :type]
  end

  defmodule Pricing do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `price_details`
    * `type` - The type of the pricing details. Possible values: `price_details`.
    * `unit_amount_decimal` - The unit amount (in the `currency` specified) of the item which contains a decimal value with at most 12 decimal places. Format: decimal string. Nullable.
    """
    @type t :: %__MODULE__{
            price_details: __MODULE__.PriceDetails.t() | nil,
            type: String.t() | nil,
            unit_amount_decimal: String.t() | nil
          }
    defstruct [:price_details, :type, :unit_amount_decimal]

    defmodule PriceDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `price` - The ID of the price this item is associated with.
      * `product` - The ID of the product this item is associated with. Max length: 5000.
      """
      @type t :: %__MODULE__{
              price: String.t() | Stripe.Resources.Price.t() | nil,
              product: String.t() | nil
            }
      defstruct [:price, :product]
    end

    def __inner_types__ do
      %{
        "price_details" => __MODULE__.PriceDetails
      }
    end
  end

  defmodule Taxes do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount of the tax, in cents (or local equivalent).
    * `tax_behavior` - Whether this tax is inclusive or exclusive. Possible values: `exclusive`, `inclusive`.
    * `tax_rate_details` - Additional details about the tax rate. Only present when `type` is `tax_rate_details`. Nullable.
    * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_available`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`.
    * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
    * `type` - The type of tax information. Possible values: `tax_rate_details`.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            tax_behavior: String.t() | nil,
            tax_rate_details: __MODULE__.TaxRateDetails.t() | nil,
            taxability_reason: String.t() | nil,
            taxable_amount: integer() | nil,
            type: String.t() | nil
          }
    defstruct [
      :amount,
      :tax_behavior,
      :tax_rate_details,
      :taxability_reason,
      :taxable_amount,
      :type
    ]

    defmodule TaxRateDetails do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `tax_rate` - ID of the tax rate Max length: 5000.
      """
      @type t :: %__MODULE__{
              tax_rate: String.t() | nil
            }
      defstruct [:tax_rate]
    end

    def __inner_types__ do
      %{
        "tax_rate_details" => __MODULE__.TaxRateDetails
      }
    end
  end

  def __inner_types__ do
    %{
      "discount_amounts" => __MODULE__.DiscountAmounts,
      "parent" => __MODULE__.Parent,
      "period" => __MODULE__.Period,
      "pretax_credit_amounts" => __MODULE__.PretaxCreditAmounts,
      "pricing" => __MODULE__.Pricing,
      "taxes" => __MODULE__.Taxes
    }
  end
end
