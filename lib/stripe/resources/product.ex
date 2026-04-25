# File generated from our OpenAPI spec
defmodule Stripe.Resources.Product do
  @moduledoc """
  Product

  Products describe the specific goods or services you offer to your customers.
  For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product.
  They can be used in conjunction with [Prices](https://api.stripe.com#prices) to configure pricing in Payment Links, Checkout, and Subscriptions.

  Related guides: [Set up a subscription](https://docs.stripe.com/billing/subscriptions/set-up-subscription),
  [share a Payment Link](https://docs.stripe.com/payment-links),
  [accept payments with Checkout](https://docs.stripe.com/payments/accept-a-payment#create-product-prices-upfront),
  and more about [Products and Prices](https://docs.stripe.com/products-prices/overview)
  """

  @typedoc """
  * `active` - Whether the product is currently available for purchase.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `default_price` - The ID of the [Price](https://docs.stripe.com/api/prices) object that is the default price for this product. Nullable. Expandable.
  * `description` - The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes. Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `images` - A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `marketing_features` - A list of up to 15 marketing features for this product. These are displayed in [pricing tables](https://docs.stripe.com/payments/checkout/pricing-table). Expandable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - The product's name, meant to be displayable to the customer. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `product`.
  * `package_dimensions` - The dimensions of this product for shipping purposes. Nullable. Expandable.
  * `shippable` - Whether this product is shipped (i.e., physical goods). Nullable.
  * `statement_descriptor` - Extra information about a product which will appear on your customer's credit card statement. In the case that multiple products are billed at once, the first statement descriptor will be used. Only used for subscription payments. Max length: 5000. Nullable.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. Nullable. Expandable.
  * `type` - The type of the product. The product is either of type `good`, which is eligible for use with Orders and SKUs, or `service`, which is eligible for use with Subscriptions and Plans. Possible values: `good`, `service`.
  * `unit_label` - A label that represents units of this product. When set, this will be included in customers' receipts, invoices, Checkout, and the customer portal. Max length: 5000. Nullable.
  * `updated` - Time at which the object was last updated. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `url` - A URL of a publicly-accessible webpage for this product. Max length: 2048. Nullable.
  """
  @type t :: %__MODULE__{
          active: boolean(),
          created: integer(),
          default_price: String.t() | Stripe.Resources.Price.t() | nil,
          description: String.t(),
          id: String.t(),
          images: [String.t()],
          livemode: boolean(),
          marketing_features: [marketing_features()],
          metadata: %{String.t() => String.t()},
          name: String.t(),
          object: String.t(),
          package_dimensions: package_dimensions(),
          shippable: boolean(),
          statement_descriptor: String.t() | nil,
          tax_code: String.t() | Stripe.Resources.TaxCode.t() | nil,
          type: String.t(),
          unit_label: String.t() | nil,
          updated: integer(),
          url: String.t()
        }

  defstruct [
    :active,
    :created,
    :default_price,
    :description,
    :id,
    :images,
    :livemode,
    :marketing_features,
    :metadata,
    :name,
    :object,
    :package_dimensions,
    :shippable,
    :statement_descriptor,
    :tax_code,
    :type,
    :unit_label,
    :updated,
    :url
  ]

  @object_name "product"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["default_price", "marketing_features", "package_dimensions", "tax_code"]

  @typedoc """
  * `name` - The marketing feature name. Up to 80 characters long. Max length: 5000.
  """
  @type marketing_features :: %{
          optional(:name) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `height` - Height, in inches.
  * `length` - Length, in inches.
  * `weight` - Weight, in ounces.
  * `width` - Width, in inches.
  """
  @type package_dimensions :: %{
          optional(:height) => float() | nil,
          optional(:length) => float() | nil,
          optional(:weight) => float() | nil,
          optional(:width) => float() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "marketing_features" => %{
        fields: %{
          "name" => :scalar
        }
      },
      "package_dimensions" => %{
        fields: %{
          "height" => :scalar,
          "length" => :scalar,
          "weight" => :scalar,
          "width" => :scalar
        }
      }
    }
  end
end
