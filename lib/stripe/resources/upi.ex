# File generated from our OpenAPI spec
defmodule Stripe.Resources.UPI do
  @moduledoc """
  mandate_options_upi
  """

  @typedoc """
  * `amount` - Amount to be charged for future payments. Nullable.
  * `amount_type` - One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be charged in future payments. If `maximum`, the amount charged can be up to the value passed for the `amount` param. Possible values: `fixed`, `maximum`. Nullable.
  * `description` - A description of the mandate or subscription that is meant to be displayed to the customer. Max length: 20. Nullable.
  * `end_date` - End date of the mandate or subscription. Format: Unix timestamp. Nullable.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :amount_type, :description, :end_date]

  @object_name "mandate_options_upi"
  def object_name, do: @object_name
end
