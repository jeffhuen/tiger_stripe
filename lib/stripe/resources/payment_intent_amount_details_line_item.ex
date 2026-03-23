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

  For Cards, this field is truncated to 26 alphanumeric characters before being sent to the card networks. For PayPal, this field is truncated to 127 characters. Max length: 5000.
  * `quantity` - The quantity of items. Required for L3 rates. An integer greater than 0.
  * `tax` - Contains information about the tax on the item. Nullable. Expandable.
  * `unit_cost` - The unit cost of the line item represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Required for L3 rates. An integer greater than or equal to 0.
  * `unit_of_measure` - A unit of measure for the line item, such as gallons, feet, meters, etc. Required for L3 rates. At most 12 alphanumeric characters long. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          discount_amount: integer(),
          id: String.t(),
          object: String.t(),
          payment_method_options: __MODULE__.PaymentMethodOptions.t(),
          product_code: String.t(),
          product_name: String.t(),
          quantity: integer(),
          tax: __MODULE__.Tax.t(),
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

  defmodule PaymentMethodOptions do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `card`
    * `card_present`
    * `klarna`
    * `paypal`
    """
    @type t :: %__MODULE__{
            card: __MODULE__.Card.t() | nil,
            card_present: __MODULE__.CardPresent.t() | nil,
            klarna: __MODULE__.Klarna.t() | nil,
            paypal: __MODULE__.Paypal.t() | nil
          }
    defstruct [:card, :card_present, :klarna, :paypal]

    defmodule Card do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `commodity_code` - Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              commodity_code: String.t() | nil
            }
      defstruct [:commodity_code]
    end

    defmodule CardPresent do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `commodity_code` - Max length: 5000. Nullable.
      """
      @type t :: %__MODULE__{
              commodity_code: String.t() | nil
            }
      defstruct [:commodity_code]
    end

    defmodule Klarna do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `image_url` - Max length: 2048. Nullable.
      * `product_url` - Max length: 2048. Nullable.
      * `reference` - Max length: 255. Nullable.
      * `subscription_reference` - Max length: 2048. Nullable.
      """
      @type t :: %__MODULE__{
              image_url: String.t() | nil,
              product_url: String.t() | nil,
              reference: String.t() | nil,
              subscription_reference: String.t() | nil
            }
      defstruct [:image_url, :product_url, :reference, :subscription_reference]
    end

    defmodule Paypal do
      @moduledoc "Nested struct within the parent resource."

      @typedoc """
      * `category` - Type of the line item. Possible values: `digital_goods`, `donation`, `physical_goods`.
      * `description` - Description of the line item. Max length: 5000.
      * `sold_by` - The Stripe account ID of the connected account that sells the item. This is only needed when using [Separate Charges and Transfers](https://docs.stripe.com/connect/separate-charges-and-transfers). Max length: 5000.
      """
      @type t :: %__MODULE__{
              category: String.t() | nil,
              description: String.t() | nil,
              sold_by: String.t() | nil
            }
      defstruct [:category, :description, :sold_by]
    end

    def __inner_types__ do
      %{
        "card" => __MODULE__.Card,
        "card_present" => __MODULE__.CardPresent,
        "klarna" => __MODULE__.Klarna,
        "paypal" => __MODULE__.Paypal
      }
    end
  end

  defmodule Tax do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `total_tax_amount` - The total amount of tax on the transaction represented in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). Required for L2 rates. An integer greater than or equal to 0.

    This field is mutually exclusive with the `amount_details[line_items][#][tax][total_tax_amount]` field.
    """
    @type t :: %__MODULE__{
            total_tax_amount: integer() | nil
          }
    defstruct [:total_tax_amount]
  end

  def __inner_types__ do
    %{
      "payment_method_options" => __MODULE__.PaymentMethodOptions,
      "tax" => __MODULE__.Tax
    }
  end
end
