# File generated from our OpenAPI spec
defmodule Stripe.Resources.Radar.ValueListItem do
  @moduledoc """
  RadarListListItem

  Value list items allow you to add specific values to a given Radar value list, which can then be used in rules.

  Related guide: [Managing list items](https://docs.stripe.com/radar/lists#managing-list-items)
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `created_by` - The name or email address of the user who added this item to the value list. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `radar.value_list_item`.
  * `value` - The value of the item. Max length: 5000.
  * `value_list` - The identifier of the value list this item belongs to. Max length: 5000.
  """
  @type t :: %__MODULE__{
          created: integer(),
          created_by: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          value: String.t(),
          value_list: String.t()
        }

  defstruct [:created, :created_by, :id, :livemode, :object, :value, :value_list]

  @object_name "radar.value_list_item"
  def object_name, do: @object_name
end
