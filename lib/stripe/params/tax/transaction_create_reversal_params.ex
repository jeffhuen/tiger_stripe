# File generated from our OpenAPI spec
defmodule Stripe.Params.Tax.TransactionCreateReversalParams do
  @moduledoc "Parameters for transaction create reversal."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `flat_amount` - A flat amount to reverse across the entire transaction, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units) in negative. This value represents the total amount to refund from the transaction, including taxes.
  * `line_items` - The line item amounts to reverse.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `mode` - If `partial`, the provided line item or shipping cost amounts are reversed. If `full`, the original transaction is fully reversed. Possible values: `full`, `partial`.
  * `original_transaction` - The ID of the Transaction to partially or fully reverse. Max length: 5000.
  * `reference` - A custom identifier for this reversal, such as `myOrder_123-refund_1`, which must be unique across all transactions. The reference helps identify this reversal transaction in exported [tax reports](https://docs.stripe.com/tax/reports). Max length: 500.
  * `shipping_cost` - The shipping cost to reverse.
  """
  @type t :: %__MODULE__{
          expand: [String.t()] | nil,
          flat_amount: integer() | nil,
          line_items: [__MODULE__.LineItems.t()] | nil,
          metadata: %{String.t() => String.t()} | nil,
          mode: String.t(),
          original_transaction: String.t(),
          reference: String.t(),
          shipping_cost: __MODULE__.ShippingCost.t() | nil
        }

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

  defmodule LineItems do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount` - The amount to reverse, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units) in negative.
    * `amount_tax` - The amount of tax to reverse, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units) in negative.
    * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    * `original_line_item` - The `id` of the line item to reverse in the original transaction. Max length: 5000.
    * `quantity` - The quantity reversed. Appears in [tax exports](https://docs.stripe.com/tax/reports), but does not affect the amount of tax reversed.
    * `reference` - A custom identifier for this line item in the reversal transaction, such as 'L1-refund'. Max length: 500.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            amount_tax: integer() | nil,
            metadata: %{String.t() => String.t()} | nil,
            original_line_item: String.t() | nil,
            quantity: integer() | nil,
            reference: String.t() | nil
          }
    defstruct [:amount, :amount_tax, :metadata, :original_line_item, :quantity, :reference]
  end

  defmodule ShippingCost do
    @moduledoc "Nested parameters."

    @typedoc """
    * `amount` - The amount to reverse, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units) in negative.
    * `amount_tax` - The amount of tax to reverse, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units) in negative.
    """
    @type t :: %__MODULE__{
            amount: integer() | nil,
            amount_tax: integer() | nil
          }
    defstruct [:amount, :amount_tax]
  end
end
