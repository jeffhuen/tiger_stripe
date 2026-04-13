# File generated from our OpenAPI spec
defmodule Stripe.Resources.Tax.TransactionLineItem do
  @moduledoc """
  TaxProductResourceTaxTransactionLineItem
  """

  @typedoc """
  * `amount` - The line item amount in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units). If `tax_behavior=inclusive`, then this amount includes taxes. Otherwise, taxes were calculated on top of this amount.
  * `amount_tax` - The amount of tax calculated for this line item, in the [smallest currency unit](https://docs.stripe.com/currencies#minor-units).
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `tax.transaction_line_item`.
  * `product` - The ID of an existing [Product](https://docs.stripe.com/api/products/object). Max length: 5000. Nullable.
  * `quantity` - The number of units of the item being purchased. For reversals, this is the quantity reversed.
  * `reference` - A custom identifier for this line item in the transaction. Max length: 5000.
  * `reversal` - If `type=reversal`, contains information about what was reversed. Nullable. Expandable.
  * `tax_behavior` - Specifies whether the `amount` includes taxes. If `tax_behavior=inclusive`, then the amount includes taxes. Possible values: `exclusive`, `inclusive`.
  * `tax_code` - The [tax code](https://docs.stripe.com/tax/tax-categories) ID used for this resource. Max length: 5000.
  * `type` - If `reversal`, this line item reverses an earlier transaction. Possible values: `reversal`, `transaction`.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_tax: integer(),
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          product: String.t(),
          quantity: integer(),
          reference: String.t(),
          reversal: __MODULE__.Reversal.t(),
          tax_behavior: String.t(),
          tax_code: String.t(),
          type: String.t()
        }

  defstruct [
    :amount,
    :amount_tax,
    :id,
    :livemode,
    :metadata,
    :object,
    :product,
    :quantity,
    :reference,
    :reversal,
    :tax_behavior,
    :tax_code,
    :type
  ]

  @object_name "tax.transaction_line_item"
  def object_name, do: @object_name

  def expandable_fields, do: ["reversal"]

  defmodule Reversal do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `original_line_item` - The `id` of the line item to reverse in the original transaction. Max length: 5000.
    """
    @type t :: %__MODULE__{
            original_line_item: String.t() | nil
          }
    defstruct [:original_line_item]
  end

  def __inner_types__ do
    %{
      "reversal" => __MODULE__.Reversal
    }
  end
end
