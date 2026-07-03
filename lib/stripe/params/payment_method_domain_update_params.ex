# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentMethodDomainUpdateParams do
  @moduledoc "Parameters for payment method domain update."

  @typedoc """
  * `enabled` - Whether this payment method domain is enabled. If the domain is not enabled, payment methods that require a payment method domain will not appear in Elements or Embedded Checkout.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:enabled, :expand]
end
