# File generated from our OpenAPI spec
defmodule Stripe.Params.ProductUpdateParams do
  @moduledoc "Parameters for product update."

  @typedoc """
  * `active` - Whether the product is available for purchase.
  * `default_price` - The ID of the [Price](https://docs.stripe.com/api/prices) object that is the default price for this product. Max length: 5000.
  * `description` - The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
  * `expand` - Specifies which fields in the response should be expanded.
  * `images` - A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
  * `marketing_features` - A list of up to 15 marketing features for this product. These are displayed in [pricing tables](https://docs.stripe.com/payments/checkout/pricing-table).
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - The product's name, meant to be displayable to the customer. Max length: 5000.
  * `package_dimensions` - The dimensions of this product for shipping purposes.
  * `shippable` - Whether this product is shipped (i.e., physical goods).
  * `statement_descriptor` - An arbitrary string to be displayed on your customer's credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all.

  This may be up to 22 characters. The statement description may not include `, `\\`, `"`, `'` characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped.
  It must contain at least one letter. May only be set if `type=service`. Only used for subscription payments. Max length: 22.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID.
  * `unit_label` - A label that represents units of this product. When set, this will be included in customers' receipts, invoices, Checkout, and the customer portal. May only be set if `type=service`.
  * `url` - A URL of a publicly-accessible webpage for this product.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :default_price,
    :description,
    :expand,
    :images,
    :marketing_features,
    :metadata,
    :name,
    :package_dimensions,
    :shippable,
    :statement_descriptor,
    :tax_code,
    :unit_label,
    :url
  ]
end
