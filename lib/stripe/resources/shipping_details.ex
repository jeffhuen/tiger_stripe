# File generated from our OpenAPI spec
defmodule Stripe.Resources.ShippingDetails do
  @moduledoc """
  Shipping
  """

  @typedoc """
  * `address` - Expandable.
  * `carrier` - The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. Max length: 5000. Nullable.
  * `name` - Recipient name. Max length: 5000.
  * `phone` - Recipient phone (including extension). Max length: 5000. Nullable.
  * `tracking_number` - The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          address: Stripe.Resources.Address.t() | nil,
          carrier: String.t() | nil,
          name: String.t() | nil,
          phone: String.t() | nil,
          tracking_number: String.t() | nil
        }

  defstruct [:address, :carrier, :name, :phone, :tracking_number]

  @object_name "shipping"
  def object_name, do: @object_name

  def expandable_fields, do: ["address"]

  def __nested_fields__ do
    %{
      "address" => {:resource, Stripe.Resources.Address}
    }
  end
end
