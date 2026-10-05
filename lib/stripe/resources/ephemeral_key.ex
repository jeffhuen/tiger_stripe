# File generated from our OpenAPI spec
defmodule Stripe.Resources.EphemeralKey do
  @moduledoc """
  Ephemeral Key

  Ephemeral keys give the SDKs (like Stripe's mobile SDKs and Issuing Elements) temporary, scoped access to a specific
  resource, such as a Customer, Issuing Card, or Identity VerificationSession, without exposing your secret API key.

  Related guides: [Using Issuing Elements](https://docs.stripe.com/issuing/elements).
  """

  @typedoc """
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `expires` - Time at which the key will expire. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `ephemeral_key`.
  * `secret` - The key's secret. You can use this value to make authorized requests to the Stripe API. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:created, :expires, :id, :livemode, :object, :secret]

  @object_name "ephemeral_key"
  def object_name, do: @object_name
end
