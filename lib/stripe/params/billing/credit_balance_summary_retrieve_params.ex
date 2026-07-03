# File generated from our OpenAPI spec
defmodule Stripe.Params.Billing.CreditBalanceSummaryRetrieveParams do
  @moduledoc "Parameters for credit balance summary retrieve."

  @typedoc """
  * `customer` - The customer whose credit balance summary you're retrieving. Max length: 5000.
  * `customer_account` - The account representing the customer whose credit balance summary you're retrieving. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `filter` - The filter criteria for the credit balance summary.
  """
  @type t :: %__MODULE__{}

  defstruct [:customer, :customer_account, :expand, :filter]
end
