# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.Location do
  @moduledoc """
  Tax location

  Tax locations represent venues for services, tickets, or other product types.
  """

  @typedoc """
  * `address` - Expandable.
  * `description` - A descriptive text providing additional context about the tax location. This can include information about the venue, types of events held, services available, or any relevant details for better identification (for example, "A spacious auditorium suitable for large concerts and events."). Max length: 5000. Nullable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.location`.
  * `type` - The type of tax location to be defined. Currently the only option is `performance`. Possible values: `performance`.
  """
  @type t :: %__MODULE__{}

  defstruct [:address, :description, :id, :livemode, :object, :type]

  @object_name "tax.location"
  def object_name, do: @object_name

  def expandable_fields, do: ["address"]

  def __nested_fields__ do
    %{
      "address" => {:resource, Stripe.Resources.Address}
    }
  end
end
