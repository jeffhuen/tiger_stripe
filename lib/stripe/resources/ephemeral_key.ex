# File generated from our OpenAPI spec
defmodule Stripe.Resources.EphemeralKey do
  @moduledoc """
  EphemeralKey
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expires` - Time at which the key will expire. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `ephemeral_key`.
  * `secret` - The key's secret. You can use this value to make authorized requests to the Stripe API. Max length: 5000.
  """
  @type t :: %__MODULE__{
          created: integer(),
          expires: integer(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          secret: String.t() | nil
        }

  defstruct [:created, :expires, :id, :livemode, :object, :secret]

  @object_name "ephemeral_key"
  def object_name, do: @object_name
end
