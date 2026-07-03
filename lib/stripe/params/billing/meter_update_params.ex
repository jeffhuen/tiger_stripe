# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.MeterUpdateParams do
  @moduledoc "Parameters for meter update."

  @typedoc """
  * `display_name` - The meter’s name. Not visible to the customer. Max length: 250.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:display_name, :expand]
end
