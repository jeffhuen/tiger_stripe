# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.TransactionCreateFromCalculationParams do
  @moduledoc "Parameters for transaction create from calculation."

  @typedoc """
  * `calculation` - Tax Calculation ID to be used as input when creating the transaction. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `posted_at` - The Unix timestamp representing when the tax liability is assumed or reduced, which determines the liability posting period and handling in tax liability reports. The timestamp must fall within the `tax_date` and the current time, unless the `tax_date` is scheduled in advance. Defaults to the current time. Format: Unix timestamp.
  * `reference` - A custom order or sale identifier, such as 'myOrder_123'. Must be unique across all transactions, including reversals. Max length: 500.
  """
  @type t :: %__MODULE__{}

  defstruct [:calculation, :expand, :metadata, :posted_at, :reference]
end
