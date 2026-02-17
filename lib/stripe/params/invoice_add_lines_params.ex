# File generated from our OpenAPI spec
defmodule Stripe.Params.InvoiceAddLinesParams do
  @moduledoc "Parameters for invoice add lines."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `invoice_metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `lines` - The line items to add.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          invoice_metadata: map() | nil,
          lines: [__MODULE__.Lines.t()]
        }

  defstruct [:expand, :invoice_metadata, :lines]

  defmodule Lines do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount` - The integer amount in cents (or local equivalent) of the charge to be applied to the upcoming invoice. If you want to apply a credit to the customer's account, pass a negative amount.
    * `description` - An arbitrary string which you can attach to the invoice item. The description is displayed in the invoice for easy tracking. Max length: 5000.
    * `discountable` - Controls whether discounts apply to this line item. Defaults to false for prorations or negative line items, and true for all other line items. Cannot be set to true for prorations.
    * `discounts` - The coupons, promotion codes & existing discounts which apply to the line item. Item discounts are applied before invoice discounts. Pass an empty string to remove previously-defined discounts.
    * `invoice_item` - ID of an unassigned invoice item to assign to this invoice. If not provided, a new item will be created. Max length: 5000.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    * `period` - The period associated with this invoice item. When set to different values, the period will be rendered on the invoice. If you have [Stripe Revenue Recognition](https://docs.stripe.com/revenue-recognition) enabled, the period will be used to recognize and defer revenue. See the [Revenue Recognition documentation](https://docs.stripe.com/revenue-recognition/methodology/subscriptions-and-invoicing) for details.
    * `price_data` - Data used to generate a new [Price](https://docs.stripe.com/api/prices) object inline.
    * `pricing` - The pricing information for the invoice item.
    * `quantity` - Non-negative integer. The quantity of units for the line item.
    * `tax_amounts` - A list of up to 10 tax amounts for this line item. This can be useful if you calculate taxes on your own or use a third-party to calculate them. You cannot set tax amounts if any line item has [tax_rates](https://docs.stripe.com/api/invoices/line_item#invoice_line_item_object-tax_rates) or if the invoice has [default_tax_rates](https://docs.stripe.com/api/invoices/object#invoice_object-default_tax_rates) or uses [automatic tax](https://docs.stripe.com/tax/invoicing). Pass an empty string to remove previously defined tax amounts.
    * `tax_rates` - The tax rates which apply to the line item. When set, the `default_tax_rates` on the invoice do not apply to this line item. Pass an empty string to remove previously-defined tax rates.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            description: String.t() | nil,
            discountable: boolean() | nil,
            discounts: map() | nil,
            invoice_item: String.t() | nil,
            metadata: map() | nil,
            period: __MODULE__.Period.t() | nil,
            price_data: __MODULE__.PriceData.t() | nil,
            pricing: __MODULE__.Pricing.t() | nil,
            quantity: integer() | nil,
            tax_amounts: map() | nil,
            tax_rates: map() | nil
          }
    defstruct [
      :amount,
      :description,
      :discountable,
      :discounts,
      :invoice_item,
      :metadata,
      :period,
      :price_data,
      :pricing,
      :quantity,
      :tax_amounts,
      :tax_rates
    ]

    defmodule Period do
      @moduledoc "Nested parameters."

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

    defmodule PriceData do
      @moduledoc "Nested parameters."

      @typedoc """
      * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
      * `product` - The ID of the [Product](https://docs.stripe.com/api/products) that this [Price](https://docs.stripe.com/api/prices) will belong to. One of `product` or `product_data` is required. Max length: 5000.
      * `product_data` - Data used to generate a new [Product](https://docs.stripe.com/api/products) object inline. One of `product` or `product_data` is required.
      * `tax_behavior` - Only required if a [default tax behavior](https://docs.stripe.com/tax/products-prices-tax-categories-tax-behavior#setting-a-default-tax-behavior-(recommended)) was not provided in the Stripe Tax settings. Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed. Possible values: `exclusive`, `inclusive`, `unspecified`.
      * `unit_amount` - A non-negative integer in cents (or local equivalent) representing how much to charge. One of `unit_amount` or `unit_amount_decimal` is required.
      * `unit_amount_decimal` - Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set. Format: decimal string.
      """
      @type t :: %__MODULE__{
              currency: String.t() | nil,
              product: String.t() | nil,
              product_data: __MODULE__.ProductData.t() | nil,
              tax_behavior: String.t() | nil,
              unit_amount: integer() | nil,
              unit_amount_decimal: String.t() | nil
            }
      defstruct [
        :currency,
        :product,
        :product_data,
        :tax_behavior,
        :unit_amount,
        :unit_amount_decimal
      ]

      defmodule ProductData do
        @moduledoc "Nested parameters."

        @typedoc """
        * `description` - The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes. Max length: 40000.
        * `images` - A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
        * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
        * `name` - The product's name, meant to be displayable to the customer. Max length: 5000.
        * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. Max length: 5000.
        * `unit_label` - A label that represents units of this product. When set, this will be included in customers' receipts, invoices, Checkout, and the customer portal. Max length: 12.
        """
        @type t :: %__MODULE__{
                description: String.t() | nil,
                images: [String.t()] | nil,
                metadata: %{String.t() => String.t()} | nil,
                name: String.t() | nil,
                tax_code: String.t() | nil,
                unit_label: String.t() | nil
              }
        defstruct [:description, :images, :metadata, :name, :tax_code, :unit_label]
      end
    end

    defmodule Pricing do
      @moduledoc "Nested parameters."

      @typedoc """
      * `price` - The ID of the price object. Max length: 5000.
      """
      @type t :: %__MODULE__{
              price: String.t() | nil
            }
      defstruct [:price]
    end
  end
end
