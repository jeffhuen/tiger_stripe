# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.Transaction do
  @moduledoc """
  TaxProductResourceTaxTransaction

  A Tax Transaction records the tax collected from or refunded to your customer.

  Related guide: [Calculate tax in your custom payment flow](https://docs.stripe.com/tax/custom#tax-transaction)
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Max length: 5000.
  * `customer` - The ID of an existing [Customer](https://docs.stripe.com/api/customers/object) used for the resource. Max length: 5000. Nullable.
  * `customer_details` - Expandable.
  * `id` - Unique identifier for the transaction. Max length: 5000.
  * `line_items` - The tax collected or refunded, by line item. Nullable. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.transaction`.
  * `posted_at` - The Unix timestamp representing when the tax liability is assumed or reduced. Format: Unix timestamp.
  * `reference` - A custom unique identifier, such as 'myOrder_123'. Max length: 5000.
  * `reversal` - If `type=reversal`, contains information about what was reversed. Nullable. Expandable.
  * `ship_from_details` - The details of the ship from location, such as the address. Nullable. Expandable.
  * `shipping_cost` - The shipping cost details for the transaction. Nullable. Expandable.
  * `tax_date` - Timestamp of date at which the tax rules and rates in effect applies for the calculation. Format: Unix timestamp.
  * `type` - If `reversal`, this transaction reverses an earlier transaction. Possible values: `reversal`, `transaction`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :created,
    :currency,
    :customer,
    :customer_details,
    :id,
    :line_items,
    :livemode,
    :metadata,
    :object,
    :posted_at,
    :reference,
    :reversal,
    :ship_from_details,
    :shipping_cost,
    :tax_date,
    :type
  ]

  @object_name "tax.transaction"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["customer_details", "line_items", "reversal", "ship_from_details", "shipping_cost"]

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
          "data" => {:list, {:resource, Stripe.Resources.Tax.TransactionLineItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      },
      "reversal" => %{
        fields: %{
          "original_transaction" => :scalar
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
      }
    }
  end
end
