# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.Calculation do
  @moduledoc """
  TaxProductResourceTaxCalculation

  A Tax Calculation allows you to calculate the tax to collect from your customer.

  Related guide: [Calculate tax in your custom payment flow](https://docs.stripe.com/tax/custom)
  """

  @typedoc """
  * `amount_total` - Total amount after taxes in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `customer` - The ID of an existing [Customer](https://docs.stripe.com/api/customers/object) used for the resource. Max length: 5000. Nullable.
  * `customer_details` - Expandable.
  * `expires_at` - Timestamp of date at which the tax calculation will expire. Format: Unix timestamp. Nullable.
  * `id` - Unique identifier for the calculation. Max length: 5000. Nullable.
  * `line_items` - The list of items the customer is purchasing. Nullable. Expandable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.calculation`.
  * `ship_from_details` - The details of the ship from location, such as the address. Nullable. Expandable.
  * `shipping_cost` - The shipping cost details for the calculation. Nullable. Expandable.
  * `tax_amount_exclusive` - The amount of tax to be collected on top of the line item prices.
  * `tax_amount_inclusive` - The amount of tax already included in the line item prices.
  * `tax_breakdown` - Breakdown of individual tax amounts that add up to the total. Expandable.
  * `tax_date` - The calculation uses the tax rules and rates that are in effect at this timestamp. You can use a date up to 31 days in the past or up to 31 days in the future. If you use a future date, Stripe doesn't guarantee that the expected tax rules and rate being used match the actual rules and rate that will be in effect on that date. We deploy tax changes before their effective date, but not within a fixed window. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount_total,
    :currency,
    :customer,
    :customer_details,
    :expires_at,
    :id,
    :line_items,
    :livemode,
    :object,
    :ship_from_details,
    :shipping_cost,
    :tax_amount_exclusive,
    :tax_amount_inclusive,
    :tax_breakdown,
    :tax_date
  ]

  @object_name "tax.calculation"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["customer_details", "line_items", "ship_from_details", "shipping_cost", "tax_breakdown"]

  def __nested_fields__ do
    %{
      "customer_details" => %{
        fields: %{
          "address" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar
            }
          },
          "address_source" => :scalar,
          "ip_address" => :scalar,
          "tax_ids" =>
            {:list,
             %{
               fields: %{
                 "type" => :scalar,
                 "value" => :scalar
               }
             }},
          "taxability_override" => :scalar
        }
      },
      "line_items" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.Tax.CalculationLineItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "ship_from_details" => %{
        fields: %{
          "address" => %{
            fields: %{
              "city" => :scalar,
              "country" => :scalar,
              "line1" => :scalar,
              "line2" => :scalar,
              "postal_code" => :scalar,
              "state" => :scalar
            }
          }
        }
      },
      "shipping_cost" => %{
        fields: %{
          "amount" => :scalar,
          "amount_tax" => :scalar,
          "shipping_rate" => :scalar,
          "tax_behavior" => :scalar,
          "tax_breakdown" =>
            {:list,
             %{
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
             }},
          "tax_code" => :scalar
        }
      },
      "tax_breakdown" => %{
        fields: %{
          "amount" => :scalar,
          "inclusive" => :scalar,
          "tax_rate_details" => %{
            fields: %{
              "country" => :scalar,
              "flat_amount" => {:resource, Stripe.Resources.TaxRateFlatAmount},
              "percentage_decimal" => :scalar,
              "rate_type" => :scalar,
              "state" => :scalar,
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
