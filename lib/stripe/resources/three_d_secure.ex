# File generated from our OpenAPI spec
defmodule Stripe.Resources.ThreeDSecure do
  @moduledoc """
  ThreeDSecure resource.
  """

  @typedoc """
  * `address_line1_check` - Nullable.
  * `address_zip_check` - Nullable.
  * `authenticated` - Nullable.
  * `brand` - Nullable.
  * `card` - Nullable.
  * `country` - Nullable.
  * `customer` - Nullable.
  * `cvc_check` - Nullable.
  * `description`
  * `dynamic_last4` - Nullable.
  * `exp_month` - Nullable.
  * `exp_year` - Nullable.
  * `fingerprint`
  * `funding` - Nullable.
  * `iin`
  * `issuer`
  * `last4` - Nullable.
  * `name` - Nullable.
  * `three_d_secure`
  * `tokenization_method` - Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :address_line1_check,
    :address_zip_check,
    :authenticated,
    :brand,
    :card,
    :country,
    :customer,
    :cvc_check,
    :description,
    :dynamic_last4,
    :exp_month,
    :exp_year,
    :fingerprint,
    :funding,
    :iin,
    :issuer,
    :last4,
    :name,
    :three_d_secure,
    :tokenization_method
  ]

  @object_name "source_type_three_d_secure"
  def object_name, do: @object_name
end
