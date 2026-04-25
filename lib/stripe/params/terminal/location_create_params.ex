# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.LocationCreateParams do
  @moduledoc "Parameters for location create."

  @typedoc """
  * `address` - The full address of the location.
  * `address_kana` - The Kana variation of the full address of the location (Japan only).
  * `address_kanji` - The Kanji variation of the full address of the location (Japan only).
  * `configuration_overrides` - The ID of a configuration that will be used to customize all readers in this location. Max length: 500.
  * `display_name` - A name for the location. Maximum length is 1000 characters. Max length: 1000.
  * `display_name_kana` - The Kana variation of the name for the location (Japan only). Maximum length is 1000 characters. Max length: 1000.
  * `display_name_kanji` - The Kanji variation of the name for the location (Japan only). Maximum length is 1000 characters. Max length: 1000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `phone` - The phone number for the location.
  """
  @type t :: %__MODULE__{
          address: address() | nil,
          address_kana: address_kana() | nil,
          address_kanji: address_kanji() | nil,
          configuration_overrides: String.t() | nil,
          display_name: String.t() | nil,
          display_name_kana: String.t() | nil,
          display_name_kanji: String.t() | nil,
          expand: [String.t()] | nil,
          metadata: map() | nil,
          phone: String.t() | nil
        }

  defstruct [
    :address,
    :address_kana,
    :address_kanji,
    :configuration_overrides,
    :display_name,
    :display_name_kana,
    :display_name_kanji,
    :expand,
    :metadata,
    :phone
  ]

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000.
  * `postal_code` - ZIP or postal code. Max length: 5000.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000.
  """
  @type address :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City or ward. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Block or building number. Max length: 5000.
  * `line2` - Building details. Max length: 5000.
  * `postal_code` - Postal code. Max length: 5000.
  * `state` - Prefecture. Max length: 5000.
  * `town` - Town or cho-me. Max length: 5000.
  """
  @type address_kana :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `city` - City or ward. Max length: 5000.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000.
  * `line1` - Block or building number. Max length: 5000.
  * `line2` - Building details. Max length: 5000.
  * `postal_code` - Postal code. Max length: 5000.
  * `state` - Prefecture. Max length: 5000.
  * `town` - Town or cho-me. Max length: 5000.
  """
  @type address_kanji :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:line1) => String.t() | nil,
          optional(:line2) => String.t() | nil,
          optional(:postal_code) => String.t() | nil,
          optional(:state) => String.t() | nil,
          optional(:town) => String.t() | nil,
          optional(String.t()) => term()
        }
end
