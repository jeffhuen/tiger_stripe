# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.FinancialAccountUpdateParams do
  @moduledoc "Parameters for financial account update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `features` - Encodes whether a FinancialAccount has access to a particular feature, with a status enum and associated `status_details`. Stripe or the platform may control features via the requested field.
  * `forwarding_settings` - A different bank account where funds can be deposited/debited in order to get the closing FA's balance to $0
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `nickname` - The nickname for the FinancialAccount.
  * `platform_restrictions` - The set of functionalities that the platform can restrict on the FinancialAccount.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :expand,
    :features,
    :forwarding_settings,
    :metadata,
    :nickname,
    :platform_restrictions
  ]
end
