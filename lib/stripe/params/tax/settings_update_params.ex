# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.SettingsUpdateParams do
  @moduledoc "Parameters for settings update."

  @typedoc """
  * `defaults` - Default configuration to be used on Stripe Tax calculations.
  * `expand` - Specifies which fields in the response should be expanded.
  * `head_office` - The place where your business is located.
  """
  @type t :: %__MODULE__{
          defaults: defaults() | nil,
          expand: [String.t()] | nil,
          head_office: head_office() | nil
        }

  defstruct [:defaults, :expand, :head_office]

  @typedoc """
  * `tax_behavior` - Specifies the default [tax behavior](https://stripe.com/docs/tax/products-prices-tax-categories-tax-behavior#tax-behavior) to be used when the item's price has unspecified tax behavior. One of inclusive, exclusive, or inferred_by_currency. Once specified, it cannot be changed back to null. Possible values: `exclusive`, `inclusive`, `inferred_by_currency`.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID.
  """
  @type defaults :: %{
          optional(:tax_behavior) => String.t() | nil,
          optional(:tax_code) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `address` - The location of the business for tax purposes.
  """
  @type head_office :: %{
          optional(:address) => head_office_address() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State/province as an [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) subdivision code, without country prefix, such as "NY" or "TX". Max length: 5000.
  """
  @type head_office_address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }
end
