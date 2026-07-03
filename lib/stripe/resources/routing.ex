# File generated from our OpenAPI spec
defmodule Stripe.Resources.Routing do
  @moduledoc """
  payment_method_options_card_present_routing
  """

  @typedoc """
  * `requested_priority` - Requested routing priority Possible values: `domestic`, `international`. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:requested_priority]

  @object_name "payment_method_options_card_present_routing"
  def object_name, do: @object_name
end
