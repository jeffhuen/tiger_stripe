# File generated from our OpenAPI spec
defmodule Stripe.Resources.Radar.Rule do
  @moduledoc """
  RadarRule
  """

  @typedoc """
  * `action` - The action taken on the payment. Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `predicate` - The predicate to evaluate the payment against. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:action, :id, :predicate]

  @object_name "rule"
  def object_name, do: @object_name
end
