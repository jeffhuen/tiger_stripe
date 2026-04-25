# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.PersonalizationDesignCreateParams do
  @moduledoc "Parameters for personalization design create."

  @typedoc """
  * `card_logo` - The file for the card logo, for use with physical bundles that support card logos. Must have a `purpose` value of `issuing_logo`.
  * `carrier_text` - Hash containing carrier text, for use with physical bundles that support carrier text.
  * `expand` - Specifies which fields in the response should be expanded.
  * `lookup_key` - A lookup key used to retrieve personalization designs dynamically from a static string. This may be up to 200 characters. Max length: 200.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `name` - Friendly display name. Max length: 200.
  * `physical_bundle` - The physical bundle object belonging to this personalization design. Max length: 5000.
  * `preferences` - Information on whether this personalization design is used to create cards when one is not specified.
  * `transfer_lookup_key` - If set to true, will atomically remove the lookup key from the existing personalization design, and assign it to this personalization design.
  """
  @type t :: %__MODULE__{
          card_logo: String.t() | nil,
          carrier_text: carrier_text() | nil,
          expand: [String.t()] | nil,
          lookup_key: String.t() | nil,
          metadata: %{String.t() => String.t()} | nil,
          name: String.t() | nil,
          physical_bundle: String.t(),
          preferences: preferences() | nil,
          transfer_lookup_key: boolean() | nil
        }

  defstruct [
    :card_logo,
    :carrier_text,
    :expand,
    :lookup_key,
    :metadata,
    :name,
    :physical_bundle,
    :preferences,
    :transfer_lookup_key
  ]

  @typedoc """
  * `footer_body` - The footer body text of the carrier letter.
  * `footer_title` - The footer title text of the carrier letter.
  * `header_body` - The header body text of the carrier letter.
  * `header_title` - The header title text of the carrier letter.
  """
  @type carrier_text :: %{
          optional(:footer_body) => map() | nil,
          optional(:footer_title) => map() | nil,
          optional(:header_body) => map() | nil,
          optional(:header_title) => map() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `is_default` - Whether we use this personalization design to create cards when one isn't specified. A connected account uses the Connect platform's default design if no personalization design is set as the default design.
  """
  @type preferences :: %{
          optional(:is_default) => boolean() | nil,
          optional(String.t()) => term()
        }
end
