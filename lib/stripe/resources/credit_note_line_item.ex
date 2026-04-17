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
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `credit_note_line_item`.
  * `pretax_credit_amounts` - The pretax credit amounts (ex: discount, credit grants, etc) for this line item. Expandable.
  * `quantity` - The number of units of product being credited. Nullable.
  * `tax_rates` - The tax rates which apply to the line item. Expandable.
  * `taxes` - The tax information of the line item. Nullable. Expandable.
  * `type` - The type of the credit note line item, one of `invoice_line_item` or `custom_line_item`. When the type is `invoice_line_item` there is an additional `invoice_line_item` property on the resource the value of which is the id of the credited line item on the invoice. Possible values: `custom_line_item`, `invoice_line_item`.
  * `unit_amount` - The cost of each unit of product being credited. Nullable.
  * `unit_amount_decimal` - Same as `unit_amount`, but contains a decimal value with at most 12 decimal places. Format: decimal string. Nullable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          description: String.t(),
          discount_amount: integer(),
          discount_amounts: [__MODULE__.DiscountAmounts.t()],
          id: String.t(),
          invoice_line_item: String.t() | nil,
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          pretax_credit_amounts: [__MODULE__.PretaxCreditAmounts.t()],
          quantity: integer(),
          tax_rates: [Stripe.Resources.TaxRate.t()],
          taxes: [__MODULE__.Taxes.t()],
          type: String.t(),
          unit_amount: integer(),
          unit_amount_decimal: String.t()
        }

  defstruct [
    :amount,
    :description,
    :discount_amount,
    :discount_amounts,
    :id,
    :invoice_line_item,
    :livemode,
    :metadata,
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

  defmodule PretaxCreditAmounts do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `amount` - The amount, in cents (or local equivalent), of the pretax credit amount.
    * `credit_balance_transaction` - The credit balance transaction that was applied to get this pretax credit amount.
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
      "pretax_credit_amounts" => __MODULE__.PretaxCreditAmounts,
      "taxes" => __MODULE__.Taxes
    }
  end
end
