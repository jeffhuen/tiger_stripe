# File generated from our OpenAPI spec
defmodule Stripe.Resources.EventData do
  @moduledoc """
  NotificationEventData
  """

  @typedoc """
  * `object` - Object containing the API resource relevant to the event. For example, an `invoice.created` event will have a full [invoice object](https://api.stripe.com#invoice_object) as the value of the object key.
  * `previous_attributes` - Object containing the names of the updated attributes and their values prior to the event (only included in events of type `*.updated`). If an array attribute has any updated elements, this object contains the entire array. In Stripe API versions 2017-04-06 or earlier, an updated array attribute in this object includes only the updated array elements.
  """
  @type t :: %__MODULE__{}

  defstruct [:object, :previous_attributes]

  @object_name "notification_event_data"
  def object_name, do: @object_name
end
