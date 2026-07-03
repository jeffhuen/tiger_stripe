# File generated from our OpenAPI spec
defmodule Stripe.Resources.Address do
  @moduledoc """
  Address
  """

  @typedoc """
  * `city` - City, district, suburb, town, or village. Max length: 5000. Nullable.
  * `country` - Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)). Max length: 5000. Nullable.
  * `line1` - Address line 1, such as the street, PO Box, or company name. Max length: 5000. Nullable.
  * `line2` - Address line 2, such as the apartment, suite, unit, or building. Max length: 5000. Nullable.
  * `postal_code` - ZIP or postal code. Max length: 5000. Nullable.
  * `state` - State, county, province, or region ([ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2)). Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:city, :country, :line1, :line2, :postal_code, :state]

  @object_name "address"
  def object_name, do: @object_name
end
