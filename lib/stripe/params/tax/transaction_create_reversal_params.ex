# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.TransactionCreateReversalParams do
  @moduledoc "Parameters for transaction create reversal."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `flat_amount` - A flat amount to reverse across the entire transaction, in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) in negative. This value represents the total amount to refund from the transaction, including taxes.
  * `line_items` - The line item amounts to reverse.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `mode` - If `partial`, the provided line item or shipping cost amounts are reversed. If `full`, the original transaction is fully reversed. Possible values: `full`, `partial`.
  * `original_transaction` - The ID of the Transaction to partially or fully reverse. Max length: 5000.
  * `reference` - A custom identifier for this reversal, such as `myOrder_123-refund_1`, which must be unique across all transactions. The reference helps identify this reversal transaction in exported [tax reports](https://docs.stripe.com/tax/reports). Max length: 500.
  * `shipping_cost` - The shipping cost to reverse.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :expand,
    :flat_amount,
    :line_items,
    :metadata,
    :mode,
    :original_transaction,
    :reference,
    :shipping_cost
  ]
end
