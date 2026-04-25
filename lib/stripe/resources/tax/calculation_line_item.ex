# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.CalculationLineItem do
  @moduledoc """
  TaxProductResourceTaxCalculationLineItem
  """

  @typedoc """
  * `amount` - The line item amount in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). If `tax_behavior=inclusive`, then this amount includes taxes. Otherwise, taxes were calculated on top of this amount.
  * `amount_tax` - The amount of tax calculated for this line item, in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.calculation_line_item`.
  * `product` - The ID of an existing [Product](https://docs.stripe.com/api/products/object). Max length: 5000. Nullable.
  * `quantity` - The number of units of the item being purchased. For reversals, this is the quantity reversed.
  * `reference` - A custom identifier for this line item. Max length: 5000.
  * `tax_behavior` - Specifies whether the `amount` includes taxes. If `tax_behavior=inclusive`, then the amount includes taxes. Possible values: `exclusive`, `inclusive`.
  * `tax_breakdown` - Detailed account of taxes relevant to this line item. Nullable. Expandable.
  * `tax_code` - The [tax code](https://docs.stripe.com/tax/tax-categories) ID used for this resource. Max length: 5000.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_tax: integer(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          product: String.t(),
          quantity: integer(),
          reference: String.t(),
          tax_behavior: String.t(),
          tax_breakdown: [tax_breakdown()] | nil,
          tax_code: String.t()
        }

  defstruct [
    :amount,
    :amount_tax,
    :id,
    :livemode,
    :metadata,
    :object,
    :product,
    :quantity,
    :reference,
    :tax_behavior,
    :tax_breakdown,
    :tax_code
  ]

  @object_name "tax.calculation_line_item"
  def object_name, do: @object_name

  def expandable_fields, do: ["tax_breakdown"]

  @typedoc """
  * `amount` - The amount of tax, in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `jurisdiction`
  * `sourcing` - Indicates whether the jurisdiction was determined by the origin (merchant's address) or destination (customer's address). Possible values: `destination`, `origin`.
  * `tax_rate_details` - Details regarding the rate for this tax. This field will be `null` when the tax is not imposed, for example if the product is exempt from tax. Nullable.
  * `taxability_reason` - The reasoning behind this tax, for example, if the product is tax exempt. The possible values for this field may be extended as new tax rules are supported. Possible values: `customer_exempt`, `not_collecting`, `not_subject_to_tax`, `not_supported`, `portion_product_exempt`, `portion_reduced_rated`, `portion_standard_rated`, `product_exempt`, `product_exempt_holiday`, `proportionally_rated`, `reduced_rated`, `reverse_charge`, `standard_rated`, `taxable_basis_reduced`, `zero_rated`.
  * `taxable_amount` - The amount on which tax is calculated, in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  """
  @type tax_breakdown :: %{
          optional(:amount) => integer() | nil,
          optional(:jurisdiction) => tax_breakdown_jurisdiction() | nil,
          optional(:sourcing) => String.t() | nil,
          optional(:tax_rate_details) => tax_breakdown_tax_rate_details() | nil,
          optional(:taxability_reason) => String.t() | nil,
          optional(:taxable_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `display_name` - A human-readable name for the jurisdiction imposing the tax. Max length: 5000.
  * `level` - Indicates the level of the jurisdiction imposing the tax. Possible values: `city`, `country`, `county`, `district`, `state`.
  * `state` - [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2), without country prefix. For example, "NY" for New York, United States. Max length: 5000. Nullable.
  """
  @type tax_breakdown_jurisdiction :: %{
          optional(:country) => String.t() | nil,
          optional(:display_name) => String.t() | nil,
          optional(:level) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `display_name` - A localized display name for tax type, intended to be human-readable. For example, "Local Sales and Use Tax", "Value-added tax (VAT)", or "Umsatzsteuer (USt.)". Max length: 5000.
  * `percentage_decimal` - The tax rate percentage as a string. For example, 8.5% is represented as "8.5". Max length: 5000.
  * `tax_type` - The tax type, such as `vat` or `sales_tax`. Possible values: `amusement_tax`, `communications_tax`, `gst`, `hst`, `igst`, `jct`, `lease_tax`, `pst`, `qst`, `retail_delivery_fee`, `rst`, `sales_tax`, `service_tax`, `vat`.
  """
  @type tax_breakdown_tax_rate_details :: %{
          optional(:display_name) => String.t() | nil,
          optional(:percentage_decimal) => String.t() | nil,
          optional(:tax_type) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "tax_breakdown" => %{
        fields: %{
          "amount" => :scalar,
          "jurisdiction" => %{
            fields: %{
              "country" => :scalar,
              "display_name" => :scalar,
              "level" => :scalar,
              "state" => :scalar
            }
          },
          "sourcing" => :scalar,
          "tax_rate_details" => %{
            fields: %{
              "display_name" => :scalar,
              "percentage_decimal" => :scalar,
              "tax_type" => :scalar
            }
          },
          "taxability_reason" => :scalar,
          "taxable_amount" => :scalar
        }
      }
    }
  end
end
