# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerSessionCreateParams do
  @moduledoc "Parameters for customer session create."

  @typedoc """
  * `components` - Configuration for each component. At least 1 component must be enabled.
  * `customer` - The ID of an existing customer for which to create the Customer Session. Max length: 5000.
  * `customer_account` - The ID of an existing Account for which to create the Customer Session. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:components, :customer, :customer_account, :expand]
end
