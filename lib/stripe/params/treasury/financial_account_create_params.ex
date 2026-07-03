# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.FinancialAccountCreateParams do
  @moduledoc "Parameters for financial account create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - Encodes whether a FinancialAccount has access to a particular feature. Stripe or the platform can control features via the requested field.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `nickname` - The nickname for the FinancialAccount.
  * `platform_restrictions` - The set of functionalities that the platform can restrict on the FinancialAccount.
  * `supported_currencies` - The currencies the FinancialAccount can hold a balance in.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :expand,
    :features,
    :metadata,
    :nickname,
    :platform_restrictions,
    :supported_currencies
  ]
end
