# File generated from our OpenAPI spec
defmodule Stripe.Resources.Terminal.Location do
  @moduledoc """
  TerminalLocationLocation

  A Location represents a grouping of readers.

  Related guide: [Fleet management](https://docs.stripe.com/terminal/fleet/locations)
  """

  @typedoc """
  * `address` - Expandable.
  * `address_kana` - Expandable.
  * `address_kanji` - Expandable.
  * `configuration_overrides` - The ID of a configuration that will be used to customize all readers in this location. Max length: 5000.
  * `display_name` - The display name of the location. Max length: 5000.
  * `display_name_kana` - The Kana variation of the display name of the location. Max length: 5000.
  * `display_name_kanji` - The Kanji variation of the display name of the location. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `terminal.location`.
  * `phone` - The phone number of the location. Max length: 5000.
  """
  @type t :: %__MODULE__{
          address: Stripe.Resources.Address.t(),
          address_kana: __MODULE__.AddressKana.t() | nil,
          address_kanji: __MODULE__.AddressKanji.t() | nil,
          configuration_overrides: String.t() | nil,
          display_name: String.t(),
          display_name_kana: String.t() | nil,
          display_name_kanji: String.t() | nil,
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
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
    :id,
    :livemode,
    :metadata,
    :object,
    :phone
  ]

  @object_name "terminal.location"
  def object_name, do: @object_name

  def expandable_fields, do: ["address", "address_kana", "address_kanji"]

  defmodule AddressKana do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `city` - City/Ward. Max length: 5000. Nullable.
    * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
    * `line1` - Block/Building number. Max length: 5000. Nullable.
    * `line2` - Building details. Max length: 5000. Nullable.
    * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
    * `state` - Prefecture. Max length: 5000. Nullable.
    * `town` - Town/cho-me. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            city: String.t() | nil,
            country: String.t() | nil,
            line1: String.t() | nil,
            line2: String.t() | nil,
            postal_code: String.t() | nil,
            state: String.t() | nil,
            town: String.t() | nil
          }
    defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
  end

  defmodule AddressKanji do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `city` - City/Ward. Max length: 5000. Nullable.
    * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
    * `line1` - Block/Building number. Max length: 5000. Nullable.
    * `line2` - Building details. Max length: 5000. Nullable.
    * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
    * `state` - Prefecture. Max length: 5000. Nullable.
    * `town` - Town/cho-me. Max length: 5000. Nullable.
    """
    @type t :: %__MODULE__{
            city: String.t() | nil,
            country: String.t() | nil,
            line1: String.t() | nil,
            line2: String.t() | nil,
            postal_code: String.t() | nil,
            state: String.t() | nil,
            town: String.t() | nil
          }
    defstruct [:city, :country, :line1, :line2, :postal_code, :state, :town]
  end

  def __inner_types__ do
    %{
      "address" => Stripe.Resources.Address,
      "address_kana" => __MODULE__.AddressKana,
      "address_kanji" => __MODULE__.AddressKanji
    }
  end
end
