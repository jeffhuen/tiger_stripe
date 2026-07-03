# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.LocationUpdateParams do
  @moduledoc "Parameters for location update."

  @typedoc """
  * `address` - The full address of the location. You can't change the location's `country`. If you need to modify the `country` field, create a new `Location` object and re-register any existing readers to that location.
  * `address_kana` - The Kana variation of the full address of the location (Japan only).
  * `address_kanji` - The Kanji variation of the full address of the location (Japan only).
  * `configuration_overrides` - The ID of a configuration that will be used to customize all readers in this location.
  * `display_name` - A name for the location.
  * `display_name_kana` - The Kana variation of the name for the location (Japan only).
  * `display_name_kanji` - The Kanji variation of the name for the location (Japan only).
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `phone` - The phone number for the location.
  """
  @type t :: %__MODULE__{}

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
end
