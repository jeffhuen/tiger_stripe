# File generated from our OpenAPI spec
defmodule Stripe.Resources.Stores do
  @moduledoc """
  payment_intent_next_action_konbini_stores
  """

  @typedoc """
  * `familymart` - FamilyMart instruction details. Nullable. Expandable.
  * `lawson` - Lawson instruction details. Nullable. Expandable.
  * `ministop` - Ministop instruction details. Nullable. Expandable.
  * `seicomart` - Seicomart instruction details. Nullable. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:familymart, :lawson, :ministop, :seicomart]

  @object_name "payment_intent_next_action_konbini_stores"
  def object_name, do: @object_name

  def expandable_fields, do: ["familymart", "lawson", "ministop", "seicomart"]

  def __nested_fields__ do
    %{
      "familymart" => {:resource, Stripe.Resources.Familymart},
      "lawson" => {:resource, Stripe.Resources.Lawson},
      "ministop" => {:resource, Stripe.Resources.Ministop},
      "seicomart" => {:resource, Stripe.Resources.Seicomart}
    }
  end
end
