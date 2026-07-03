# File generated from our OpenAPI spec
defmodule Stripe.Resources.NextActionKonbiniDisplayDetails do
  @moduledoc """
  payment_intent_next_action_konbini
  """

  @typedoc """
  * `expires_at` - The timestamp at which the pending Konbini payment expires. Format: Unix timestamp.
  * `hosted_voucher_url` - The URL for the Konbini payment instructions page, which allows customers to view and print a Konbini voucher. Max length: 5000. Nullable.
  * `stores` - Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [:expires_at, :hosted_voucher_url, :stores]

  @object_name "payment_intent_next_action_konbini"
  def object_name, do: @object_name

  def expandable_fields, do: ["stores"]

  def __nested_fields__ do
    %{
      "stores" => {:resource, Stripe.Resources.Stores}
    }
  end
end
