# File generated from our OpenAPI spec
defmodule Stripe.Params.TaxRateCreateParams do
  @moduledoc "Parameters for tax rate create."

  @typedoc """
  * `active` - Flag determining whether the tax rate is active or inactive (archived). Inactive tax rates cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `description` - An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers. Max length: 5000.
  * `display_name` - The display name of the tax rate, which will be shown to users. Max length: 50.
  * `expand` - Specifies which fields in the response should be expanded.
  * `inclusive` - This specifies if the tax rate is inclusive or exclusive.
  * `jurisdiction` - The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice. Max length: 50.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `percentage` - This represents the tax rate percent out of 100.
  * `state` - [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2), without country prefix. For example, "NY" for New York, United States. Max length: 5000.
  * `tax_type` - The high-level tax type, such as `vat` or `sales_tax`. Possible values: `amusement_tax`, `communications_tax`, `gst`, `hst`, `igst`, `jct`, `lease_tax`, `mass_transit_parking_tax`, `parking_tax`, `pst`, `qst`, `retail_delivery_fee`, `rst`, `sales_tax`, `service_tax`, `vat`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :country,
    :description,
    :display_name,
    :expand,
    :inclusive,
    :jurisdiction,
    :metadata,
    :percentage,
    :state,
    :tax_type
  ]
end
