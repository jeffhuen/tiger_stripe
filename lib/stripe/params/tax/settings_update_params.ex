# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.SettingsUpdateParams do
  @moduledoc "Parameters for settings update."

  @typedoc """
  * `defaults` - Default configuration to be used on Stripe Tax calculations.
  * `expand` - Specifies which fields in the response should be expanded.
  * `head_office` - The place where your business is located.
  """
  @type t :: %__MODULE__{
          defaults: __MODULE__.Defaults.t() | nil,
          expand: [String.t()] | nil,
          head_office: __MODULE__.HeadOffice.t() | nil
        }

  defstruct [:defaults, :expand, :head_office]

  defmodule Defaults do
    @moduledoc "Nested parameters."

    @typedoc """
    * `tax_behavior` - Specifies the default [tax behavior](https://stripe.com/docs/tax/products-prices-tax-categories-tax-behavior#tax-behavior) to be used when the item's price has unspecified tax behavior. One of inclusive, exclusive, or inferred_by_currency. Once specified, it cannot be changed back to null. Possible values: `exclusive`, `inclusive`, `inferred_by_currency`.
    * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID.
    """
    @type t :: %__MODULE__{
            tax_behavior: String.t() | nil,
            tax_code: String.t() | nil
          }
    defstruct [:tax_behavior, :tax_code]
  end

  defmodule HeadOffice do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - The location of the business for tax purposes.
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil
          }
    defstruct [:address]

    defmodule Address do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
      * `postal_code` - ZIP or postal code. Max length: 5000.
      * `state` - State/province as an [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) subdivision code, without country prefix, such as "NY" or "TX". Max length: 5000.
      """
      @type t :: %__MODULE__{
              city: String.t() | nil,
              country: String.t() | nil,
              line1: String.t() | nil,
              line2: String.t() | nil,
              postal_code: String.t() | nil,
              state: String.t() | nil
            }
      defstruct [:city, :country, :line1, :line2, :postal_code, :state]
    end
  end
end
