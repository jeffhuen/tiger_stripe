# File generated from our OpenAPI spec
defmodule Stripe.Resources.ApplePayDomain do
  @moduledoc """
  ApplePayDomain
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `domain_name` - Max length: 5000.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `apple_pay_domain`.
  """
  @type t :: %__MODULE__{
          created: integer(),
          domain_name: String.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:created, :domain_name, :id, :livemode, :object]

  @object_name "apple_pay_domain"
  def object_name, do: @object_name
end
