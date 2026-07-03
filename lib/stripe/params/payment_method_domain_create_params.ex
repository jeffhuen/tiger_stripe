# File generated from our OpenAPI spec
defmodule Stripe.Params.PaymentMethodDomainCreateParams do
  @moduledoc "Parameters for payment method domain create."

  @typedoc """
  * `domain_name` - The domain name that this payment method domain object represents. Max length: 5000.
  * `enabled` - Whether this payment method domain is enabled. If the domain is not enabled, payment methods that require a payment method domain will not appear in Elements or Embedded Checkout.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:domain_name, :enabled, :expand]
end
