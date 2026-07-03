# File generated from our OpenAPI spec
defmodule Stripe.Params.Issuing.DisputeCreateParams do
  @moduledoc "Parameters for dispute create."

  @typedoc """
  * `amount` - The dispute amount in the card's currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal). If not set, defaults to the full transaction amount.
  * `evidence` - Evidence provided for the dispute.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `transaction` - The ID of the issuing transaction to create a dispute for. For transaction on Treasury FinancialAccounts, use `treasury.received_debit`. Max length: 5000.
  * `treasury` - Params for disputes related to Treasury FinancialAccounts
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :evidence, :expand, :metadata, :transaction, :treasury]
end
