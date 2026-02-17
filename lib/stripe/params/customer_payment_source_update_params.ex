# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerPaymentSourceUpdateParams do
  @moduledoc "Parameters for customer payment source update."

  @typedoc """
  * `account_holder_name` - The name of the person or business that owns the bank account. Max length: 5000.
  * `account_holder_type` - The type of entity that holds the account. This can be either `individual` or `company`. Possible values: `company`, `individual`. Max length: 5000.
  * `address_city` - City/District/Suburb/Town/Village. Max length: 5000.
  * `address_country` - Billing address country, if provided when creating card. Max length: 5000.
  * `address_line1` - Address line 1 (Street address/PO Box/Company name). Max length: 5000.
  * `address_line2` - Address line 2 (Apartment/Suite/Unit/Building). Max length: 5000.
  * `address_state` - State/County/Province/Region. Max length: 5000.
  * `address_zip` - ZIP or postal code. Max length: 5000.
  * `exp_month` - Two digit number representing the card’s expiration month. Max length: 5000.
  * `exp_year` - Four digit number representing the card’s expiration year. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - Cardholder name. Max length: 5000.
  * `owner`
  """
  @type t :: %__MODULE__{
          account_holder_name: String.t() | nil,
          account_holder_type: String.t() | nil,
          address_city: String.t() | nil,
          address_country: String.t() | nil,
          address_line1: String.t() | nil,
          address_line2: String.t() | nil,
          address_state: String.t() | nil,
          address_zip: String.t() | nil,
          exp_month: String.t() | nil,
          exp_year: String.t() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          name: String.t() | nil,
          owner: __MODULE__.Owner.t() | nil
        }

  defstruct [
    :account_holder_name,
    :account_holder_type,
    :address_city,
    :address_country,
    :address_line1,
    :address_line2,
    :address_state,
    :address_zip,
    :exp_month,
    :exp_year,
    :expand,
    :metadata,
    :name,
    :owner
  ]

  defmodule Owner do
    @moduledoc "Nested parameters."

    @typedoc """
    * `address` - Owner's address.
    * `email` - Owner's email address.
    * `name` - Owner's full name. Max length: 5000.
    * `phone` - Owner's phone number. Max length: 5000.
    """
    @type t :: %__MODULE__{
            address: __MODULE__.Address.t() | nil,
            email: String.t() | nil,
            name: String.t() | nil,
            phone: String.t() | nil
          }
    defstruct [:address, :email, :name, :phone]

    defmodule Address do
      @moduledoc "Nested parameters."

      @typedoc """
      * `city` - City, district, suburb, town, or village. Max length: 5000.
      * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
      * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
      * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
      * `postal_code` - ZIP or postal code. Max length: 5000.
      * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
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
