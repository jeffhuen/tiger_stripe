# File generated from our OpenAPI spec
defmodule Stripe.Resources.Issuing.PersonalizationDesign do
  @moduledoc """
  IssuingPersonalizationDesign

  A Personalization Design is a logical grouping of a Physical Bundle, card logo, and carrier text that represents a product line.
  """

  @typedoc """
  * `card_logo` - The file for the card logo to use with physical bundles that support card logos. Must have a `purpose` value of `issuing_logo`. Nullable. Expandable.
  * `carrier_text` - Hash containing carrier text, for use with physical bundles that support carrier text. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `lookup_key` - A lookup key used to retrieve personalization designs dynamically from a static string. This may be up to 200 characters. Max length: 5000. Nullable.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - Friendly display name. Max length: 5000. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `issuing.personalization_design`.
  * `physical_bundle` - The physical bundle object belonging to this personalization design. Expandable.
  * `preferences` - Expandable.
  * `rejection_reasons` - Expandable.
  * `status` - Whether this personalization design can be used to create cards. Possible values: `active`, `inactive`, `rejected`, `review`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :card_logo,
    :carrier_text,
    :created,
    :id,
    :livemode,
    :lookup_key,
    :metadata,
    :name,
    :object,
    :physical_bundle,
    :preferences,
    :rejection_reasons,
    :status
  ]

  @object_name "issuing.personalization_design"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["card_logo", "carrier_text", "physical_bundle", "preferences", "rejection_reasons"]

  def __nested_fields__ do
    %{
      "carrier_text" => %{
        fields: %{
          "footer_body" => :scalar,
          "footer_title" => :scalar,
          "header_body" => :scalar,
          "header_title" => :scalar
        }
      },
      "preferences" => %{
        fields: %{
          "is_default" => :scalar,
          "is_platform_default" => :scalar
        }
      },
      "rejection_reasons" => %{
        fields: %{
          "card_logo" => {:list, :scalar},
          "carrier_text" => {:list, :scalar}
        }
      }
    }
  end
end
