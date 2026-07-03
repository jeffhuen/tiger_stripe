# File generated from our OpenAPI spec
defmodule Stripe.Resources.ShippingRate do
  @moduledoc """
  ShippingRate

  Shipping rates describe the price of shipping presented to your customers and
  applied to a purchase. For more information, see [Charge for shipping](https://docs.stripe.com/payments/during-payment/charge-shipping).
  """

  @typedoc """
  * `active` - Whether the shipping rate can be used for new purchases. Defaults to `true`.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `delivery_estimate` - The estimated range for how long shipping will take, meant to be displayable to the customer. This will appear on CheckoutSessions. Nullable. Expandable.
  * `display_name` - The name of the shipping rate, meant to be displayable to the customer. This will appear on CheckoutSessions. Max length: 5000. Nullable.
  * `fixed_amount` - Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `shipping_rate`.
  * `tax_behavior` - Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Possible values: `exclusive`, `inclusive`, `unspecified`. Nullable.
  * `tax_code` - A [tax code](https://docs.stripe.com/tax/tax-categories) ID. The Shipping tax code is `txcd_92010001`. Nullable. Expandable.
  * `type` - The type of calculation to use on the shipping rate. Possible values: `fixed_amount`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :active,
    :created,
    :delivery_estimate,
    :display_name,
    :fixed_amount,
    :id,
    :livemode,
    :metadata,
    :object,
    :tax_behavior,
    :tax_code,
    :type
  ]

  @object_name "shipping_rate"
  def object_name, do: @object_name

  def expandable_fields, do: ["delivery_estimate", "fixed_amount", "tax_code"]

  def __nested_fields__ do
    %{
      "delivery_estimate" => %{
        fields: %{
          "maximum" => %{
            fields: %{
              "unit" => :scalar,
              "value" => :scalar
            }
          },
          "minimum" => %{
            fields: %{
              "unit" => :scalar,
              "value" => :scalar
            }
          }
        }
      },
      "fixed_amount" => %{
        fields: %{
          "amount" => :scalar,
          "currency" => :scalar,
          "currency_options" =>
            {:map,
             %{
               fields: %{
                 "amount" => :scalar,
                 "tax_behavior" => :scalar
               }
             }}
        }
      }
    }
  end
end
