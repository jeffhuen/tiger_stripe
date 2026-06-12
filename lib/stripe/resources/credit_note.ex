# File generated from our OpenAPI spec
defmodule Stripe.Resources.CreditNote do
  @moduledoc """
  CreditNote

  Issue a credit note to adjust an invoice's amount after the invoice is finalized.

  Related guide: [Credit notes](https://docs.stripe.com/billing/invoices/credit-notes)
  """

  @typedoc """
  * `amount` - The integer amount in cents (or local equivalent) representing the total amount of the credit note, including tax.
  * `amount_shipping` - This is the sum of all the shipping amounts.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `customer` - ID of the customer. Expandable.
  * `customer_account` - ID of the account representing the customer. Max length: 5000. Nullable.
  * `customer_balance_transaction` - Customer balance transaction related to this credit note. Nullable. Expandable.
  * `discount_amount` - The integer amount in cents (or local equivalent) representing the total amount of discount that was credited.
  * `discount_amounts` - The aggregate amounts calculated per discount for all line items. Expandable.
  * `effective_at` - The date when this credit note is in effect. Same as `created` unless overwritten. When defined, this value replaces the system-generated 'Date of issue' printed on the credit note PDF. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `invoice` - ID of the invoice. Expandable.
  * `lines` - Line items that make up the credit note Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `memo` - Customer-facing text that appears on the credit note PDF. Max length: 5000. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `number` - A unique number that identifies this particular credit note and appears on the PDF of the credit note and its associated invoice. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `credit_note`.
  * `out_of_band_amount` - Amount that was credited outside of Stripe. Nullable.
  * `pdf` - The link to download the PDF of the credit note. Max length: 5000.
  * `post_payment_amount` - The amount of the credit note that was refunded to the customer, credited to the customer's balance, credited outside of Stripe, or any combination thereof.
  * `pre_payment_amount` - The amount of the credit note by which the invoice's `amount_remaining` and `amount_due` were reduced.
  * `pretax_credit_amounts` - The pretax credit amounts (ex: discount, credit grants, etc) for all line items. Expandable.
  * `reason` - Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory` Possible values: `duplicate`, `fraudulent`, `order_change`, `product_unsatisfactory`. Nullable.
  * `refunds` - Refunds related to this credit note. Expandable.
  * `shipping_cost` - The details of the cost of shipping, including the ShippingRate applied to the invoice. Nullable. Expandable.
  * `status` - Status of this credit note, one of `issued` or `void`. Learn more about [voiding credit notes](https://docs.stripe.com/billing/invoices/credit-notes#voiding). Possible values: `issued`, `void`.
  * `subtotal` - The integer amount in cents (or local equivalent) representing the amount of the credit note, excluding exclusive tax and invoice level discounts.
  * `subtotal_excluding_tax` - The integer amount in cents (or local equivalent) representing the amount of the credit note, excluding all tax and invoice level discounts. Nullable.
  * `total` - The integer amount in cents (or local equivalent) representing the total amount of the credit note, including tax and all discount.
  * `total_excluding_tax` - The integer amount in cents (or local equivalent) representing the total amount of the credit note, excluding tax, but including discounts. Nullable.
  * `total_taxes` - The aggregate tax information for all line items. Nullable. Expandable.
  * `type` - Type of this credit note, one of `pre_payment` or `post_payment`. A `pre_payment` credit note means it was issued when the invoice was open. A `post_payment` credit note means it was issued when the invoice was paid. Possible values: `mixed`, `post_payment`, `pre_payment`.
  * `voided_at` - The time that the credit note was voided. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_shipping: integer(),
          created: integer(),
          currency: String.t(),
          customer: String.t() | Stripe.Resources.Customer.t(),
          customer_account: String.t(),
          customer_balance_transaction:
            String.t() | Stripe.Resources.CustomerBalanceTransaction.t(),
          discount_amount: integer(),
          discount_amounts: [discount_amounts()],
          effective_at: integer(),
          id: String.t(),
          invoice: String.t() | Stripe.Resources.Invoice.t(),
          lines: lines(),
          livemode: boolean(),
          memo: String.t(),
          metadata: %{String.t() => String.t()},
          number: String.t(),
          object: String.t(),
          out_of_band_amount: integer(),
          pdf: String.t(),
          post_payment_amount: integer(),
          pre_payment_amount: integer(),
          pretax_credit_amounts: [pretax_credit_amounts()],
          reason: String.t(),
          refunds: [refunds()],
          shipping_cost: shipping_cost(),
          status: String.t(),
          subtotal: integer(),
          subtotal_excluding_tax: integer(),
          total: integer(),
          total_excluding_tax: integer(),
          total_taxes: [total_taxes()],
          type: String.t(),
          voided_at: integer()
        }

  defstruct [
    :amount,
    :amount_shipping,
    :created,
    :currency,
    :customer,
    :customer_account,
    :customer_balance_transaction,
    :discount_amount,
    :discount_amounts,
    :effective_at,
    :id,
    :invoice,
    :lines,
    :livemode,
    :memo,
    :metadata,
    :number,
    :object,
    :out_of_band_amount,
    :pdf,
    :post_payment_amount,
    :pre_payment_amount,
    :pretax_credit_amounts,
    :reason,
    :refunds,
    :shipping_cost,
    :status,
    :subtotal,
    :subtotal_excluding_tax,
    :total,
    :total_excluding_tax,
    :total_taxes,
    :type,
    :voided_at
  ]

  @object_name "credit_note"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "customer",
      "customer_balance_transaction",
      "discount_amounts",
      "invoice",
      "lines",
      "pretax_credit_amounts",
      "refunds",
      "shipping_cost",
      "total_taxes"
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
  * `data` - Details about each object.
  * `has_more` - True if this list has another page of items after this one that can be fetched.
  * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
  * `url` - The URL where this list can be accessed. Max length: 5000.
  """
  @type lines :: %{
          optional(:data) => [Stripe.Resources.CreditNoteLineItem.t()] | nil,
          optional(:has_more) => boolean() | nil,
          optional(:object) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - The amount, in cents (or local equivalent), of the pretax credit amount.
  * `credit_balance_transaction` - The credit balance transaction that was applied to get this pretax credit amount.
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
  * `amount_refunded` - Amount of the refund that applies to this credit note, in cents (or local equivalent).
  * `payment_record_refund` - The PaymentRecord refund details associated with this credit note refund. Nullable.
  * `refund` - ID of the refund.
  * `type` - Type of the refund, one of `refund` or `payment_record_refund`. Possible values: `payment_record_refund`, `refund`. Nullable.
  """
  @type refunds :: %{
          optional(:amount_refunded) => integer() | nil,
          optional(:payment_record_refund) => refunds_payment_record_refund() | nil,
          optional(:refund) => String.t() | Stripe.Resources.Refund.t() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `payment_record` - ID of the payment record. Max length: 5000.
  * `refund_group` - ID of the refund group. Max length: 5000.
  """
  @type refunds_payment_record_refund :: %{
          optional(:payment_record) => String.t() | nil,
          optional(:refund_group) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount_subtotal` - Total shipping cost before any taxes are applied.
  * `amount_tax` - Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
  * `amount_total` - Total shipping cost after taxes are applied.
  * `shipping_rate` - The ID of the ShippingRate for this invoice. Nullable.
  * `taxes` - The taxes applied to the shipping rate.
  """
  @type shipping_cost :: %{
          optional(:amount_subtotal) => integer() | nil,
          optional(:amount_tax) => integer() | nil,
          optional(:amount_total) => integer() | nil,
          optional(:shipping_rate) => String.t() | Stripe.Resources.ShippingRate.t() | nil,
          optional(:taxes) => [shipping_cost_taxes()] | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `amount` - Amount of tax applied for this rate.
  * `rate`
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`. Nullable.
  * `taxable_amount` - The amount on which tax is calculated, in cents (or local equivalent). Nullable.
  """
  @type shipping_cost_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:rate) => Stripe.Resources.TaxRate.t() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
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
  @type total_taxes :: %{
          optional(:amount) => integer() | nil,
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_rate_details) => total_taxes_tax_rate_details() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(:type) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `tax_rate` - ID of the tax rate Max length: 5000.
  """
  @type total_taxes_tax_rate_details :: %{
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
      "lines" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.CreditNoteLineItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
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
      "refunds" => %{
        fields: %{
          "amount_refunded" => :scalar,
          "payment_record_refund" => %{
            fields: %{
              "payment_record" => :scalar,
              "refund_group" => :scalar
            }
          },
          "refund" => {:resource, Stripe.Resources.Refund},
          "type" => :scalar
        }
      },
      "shipping_cost" => %{
        fields: %{
          "amount_subtotal" => :scalar,
          "amount_tax" => :scalar,
          "amount_total" => :scalar,
          "shipping_rate" => {:resource, Stripe.Resources.ShippingRate},
          "taxes" =>
            {:list,
             %{
               fields: %{
                 "amount" => :scalar,
                 "rate" => {:resource, Stripe.Resources.TaxRate},
                 "taxability_reason" => :scalar,
                 "taxable_amount" => :scalar
               }
             }}
        }
      },
      "total_taxes" => %{
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
