# File generated from our OpenAPI spec
defmodule Stripe.Resources.PaymentIntentAmountDetailsLineItem do
  @moduledoc """
  PaymentFlowsAmountDetailsResourceLineItemsListResourceLineItem
  """

  @typedoc """
  * `discount_amount` - The discount applied on this line item represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). An integer greater than 0.

  This field is mutually exclusive with the `amount_details[discount_amount]` field. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `payment_intent_amount_details_line_item`.
  * `payment_method_options` - Payment method-specific information for line items. Nullable. Expandable.
  * `product_code` - The product code of the line item, such as an SKU. Required for L3 rates. At most 12 characters long. Max length: 5000. Nullable.
  * `product_name` - The product name of the line item. Required for L3 rates. At most 1024 characters long.

  For Cards, this field is truncated to 26 alphanumeric characters before being sent to the card networks. For Paypal, this field is truncated to 127 characters. Max length: 5000.
  * `quantity` - The quantity of items. Required for L3 rates. An integer greater than 0.
  * `tax` - Contains information about the tax on the item. Nullable. Expandable.
  * `unit_cost` - The unit cost of the line item represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Required for L3 rates. An integer greater than or equal to 0.
  * `unit_of_measure` - A unit of measure for the line item, such as gallons, feet, meters, etc. Required for L3 rates. At most 12 alphanumeric characters long. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          discount_amount: integer(),
          id: String.t(),
          object: String.t(),
          payment_method_options: payment_method_options(),
          product_code: String.t(),
          product_name: String.t(),
          quantity: integer(),
          tax: tax(),
          unit_cost: integer(),
          unit_of_measure: String.t()
        }

  defstruct [
    :discount_amount,
    :id,
    :object,
    :payment_method_options,
    :product_code,
    :product_name,
    :quantity,
    :tax,
    :unit_cost,
    :unit_of_measure
  ]

  @object_name "payment_intent_amount_details_line_item"
  def object_name, do: @object_name

  def expandable_fields, do: ["payment_method_options", "tax"]

  @typedoc """
  * `card`
  * `card_present`
  * `klarna`
  * `paypal`
  """
  @type payment_method_options :: %{
          optional(:card) => payment_method_options_card() | nil,
          optional(:card_present) => payment_method_options_card_present() | nil,
          optional(:klarna) => payment_method_options_klarna() | nil,
          optional(:paypal) => payment_method_options_paypal() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `commodity_code` - Max length: 5000. Nullable.
  """
  @type payment_method_options_card :: %{
          optional(:commodity_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `commodity_code` - Max length: 5000. Nullable.
  """
  @type payment_method_options_card_present :: %{
          optional(:commodity_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `image_url` - Max length: 2048. Nullable.
  * `product_url` - Max length: 2048. Nullable.
  * `reference` - Max length: 255. Nullable.
  * `subscription_reference` - Max length: 2048. Nullable.
  """
  @type payment_method_options_klarna :: %{
          optional(:image_url) => String.t() | nil,
          optional(:product_url) => String.t() | nil,
          optional(:reference) => String.t() | nil,
          optional(:subscription_reference) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `category` - Type of the line item. Possible values: `digital_goods`, `donation`, `physical_goods`.
  * `description` - Description of the line item. Max length: 5000.
  * `sold_by` - The Stripe account ID of the connected account that sells the item. This is only needed when using [Separate Charges and Transfers](https://docs.stripe.com/connect/separate-charges-and-transfers). Max length: 5000.
  """
  @type payment_method_options_paypal :: %{
          optional(:category) => String.t() | nil,
          optional(:description) => String.t() | nil,
          optional(:sold_by) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `total_tax_amount` - The total amount of tax on the transaction represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Required for L2 rates. An integer greater than or equal to 0.

  This field is mutually exclusive with the `amount_details[line_items][#][tax][total_tax_amount]` field.
  """
  @type tax :: %{
          optional(:total_tax_amount) => integer() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "payment_method_options" => %{
        fields: %{
          "card" => %{
            fields: %{
              "commodity_code" => :scalar
            }
          },
          "card_present" => %{
            fields: %{
              "commodity_code" => :scalar
            }
          },
          "klarna" => %{
            fields: %{
              "image_url" => :scalar,
              "product_url" => :scalar,
              "reference" => :scalar,
              "subscription_reference" => :scalar
            }
          },
          "paypal" => %{
            fields: %{
              "category" => :scalar,
              "description" => :scalar,
              "sold_by" => :scalar
            }
          }
        }
      },
      "tax" => %{
        fields: %{
          "total_tax_amount" => :scalar
        }
      }
    }
  end
end
