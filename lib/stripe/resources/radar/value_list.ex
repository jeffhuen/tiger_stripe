# File generated from our OpenAPI spec
defmodule Stripe.Resources.Radar.ValueList do
  @moduledoc """
  RadarListList

  Value lists allow you to group values together which can then be referenced in rules.

  Related guide: [Default Stripe lists](https://docs.stripe.com/radar/lists#managing-list-items)
  """

  @typedoc """
  * `alias` - The name of the value list for use in rules. Max length: 5000.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `created_by` - The name or email address of the user who created this value list. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `item_type` - The type of items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, `case_sensitive_string`, `customer_id`, `sepa_debit_fingerprint`, or `us_bank_account_fingerprint`. Possible values: `card_bin`, `card_fingerprint`, `case_sensitive_string`, `country`, `customer_id`, `email`, `ip_address`, `sepa_debit_fingerprint`, `string`, `us_bank_account_fingerprint`.
  * `list_items` - List of items contained within this value list. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `name` - The name of the value list. Max length: 5000.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `radar.value_list`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :alias,
    :created,
    :created_by,
    :id,
    :item_type,
    :list_items,
    :livemode,
    :metadata,
    :name,
    :object
  ]

  @object_name "radar.value_list"
  def object_name, do: @object_name

  def expandable_fields, do: ["list_items"]

  def __nested_fields__ do
    %{
      "list_items" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.Radar.ValueListItem}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      }
    }
  end
end
