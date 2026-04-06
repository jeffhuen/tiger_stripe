# File generated from our OpenAPI spec
defmodule Stripe.Resources.TaxRate do
  @moduledoc """
  TaxRate

  Tax rates can be applied to [invoices](https://stripe.com/invoicing/taxes/tax-rates), [subscriptions](https://stripe.com/billing/taxes/tax-rates) and [Checkout Sessions](https://stripe.com/payments/checkout/use-manual-tax-rates) to collect tax.

  Related guide: [Tax rates](https://stripe.com/billing/taxes/tax-rates)
  """

  @typedoc """
  * `active` - Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `description` - An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers. Max length: 5000. Nullable.
  * `display_name` - The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page. Max length: 5000.
  * `effective_percentage` - Actual/effective tax rate percentage out of 100. For tax calculations with automatic_tax[enabled]=true,
  this percentage reflects the rate actually used to calculate tax based on the product's taxability
  and whether the user is registered to collect taxes in the corresponding jurisdiction. Nullable.
  * `flat_amount` - The amount of the tax rate when the `rate_type` is `flat_amount`. Tax rates with `rate_type` `percentage` can vary based on the transaction, resulting in this field being `null`. This field exposes the amount and currency of the flat tax rate. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `inclusive` - This specifies if the tax rate is inclusive or exclusive.
  * `jurisdiction` - The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice. Max length: 5000. Nullable.
  * `jurisdiction_level` - The level of the jurisdiction that imposes this tax rate. Will be `null` for manually defined tax rates. Possible values: `city`, `country`, `county`, `district`, `multiple`, `state`. Nullable.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax_rate`.
  * `percentage` - Tax rate percentage out of 100. For tax calculations with automatic_tax[enabled]=true, this percentage includes the statutory tax rate of non-taxable jurisdictions.
  * `rate_type` - Indicates the type of tax rate applied to the taxable amount. This value can be `null` when no tax applies to the location. This field is only present for TaxRates created by Stripe Tax. Possible values: `flat_amount`, `percentage`. Nullable.
  * `state` - [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2), without country prefix. For example, "NY" for New York, United States. Max length: 5000. Nullable.
  * `tax_type` - The high-level tax type, such as `vat` or `sales_tax`. Possible values: `amusement_tax`, `communications_tax`, `gst`, `hst`, `igst`, `jct`, `lease_tax`, `pst`, `qst`, `retail_delivery_fee`, `rst`, `sales_tax`, `service_tax`, `vat`. Nullable.
  """
  @type t :: %__MODULE__{
          active: boolean(),
          country: String.t(),
          created: integer(),
          description: String.t(),
          display_name: String.t(),
          effective_percentage: float(),
          flat_amount: Stripe.Resources.TaxRateFlatAmount.t(),
          id: String.t(),
          inclusive: boolean(),
          jurisdiction: String.t(),
          jurisdiction_level: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          percentage: float(),
          rate_type: String.t(),
          state: String.t(),
          tax_type: String.t()
        }

  defstruct [
    :active,
    :country,
    :created,
    :description,
    :display_name,
    :effective_percentage,
    :flat_amount,
    :id,
    :inclusive,
    :jurisdiction,
    :jurisdiction_level,
    :livemode,
    :metadata,
    :object,
    :percentage,
    :rate_type,
    :state,
    :tax_type
  ]

  @object_name "tax_rate"
  def object_name, do: @object_name

  def expandable_fields, do: ["flat_amount"]

  def __inner_types__ do
    %{
      "flat_amount" => Stripe.Resources.TaxRateFlatAmount
    }
  end
end
