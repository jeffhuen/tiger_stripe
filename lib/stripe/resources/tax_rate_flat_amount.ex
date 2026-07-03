# File generated from our OpenAPI spec
defmodule Stripe.Resources.TaxRateFlatAmount do
  @moduledoc """
  TaxRateFlatAmount

  The amount of the tax rate when the `rate_type` is `flat_amount`. Tax rates with `rate_type` `percentage` can vary based on the transaction, resulting in this field being `null`. This field exposes the amount and currency of the flat tax rate.
  """

  @typedoc """
  * `amount` - Amount of the tax when the `rate_type` is `flat_amount`. This positive integer represents how much to charge in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
  * `currency` - Three-letter ISO currency code, in lowercase. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :currency]

  @object_name "tax_rate_flat_amount"
  def object_name, do: @object_name
end
