# File generated from our OpenAPI spec
defmodule Stripe.Resources.Familymart do
  @moduledoc """
  payment_intent_next_action_konbini_familymart
  """

  @typedoc """
  * `confirmation_number` - The confirmation number. Max length: 5000.
  * `payment_code` - The payment code. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:confirmation_number, :payment_code]

  @object_name "payment_intent_next_action_konbini_familymart"
  def object_name, do: @object_name
end
