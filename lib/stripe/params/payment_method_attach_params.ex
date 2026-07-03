# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentMethodAttachParams do
  @moduledoc "Parameters for payment method attach."

  @typedoc """
  * `customer` - The ID of the customer to which to attach the PaymentMethod. Max length: 5000.
  * `customer_account` - The ID of the Account representing the customer to which to attach the PaymentMethod. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:customer, :customer_account, :expand]
end
