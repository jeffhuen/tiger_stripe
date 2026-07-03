# File generated from our OpenAPI spec
defmodule Stripe.Resources.TransferReversal do
  @moduledoc """
  TransferReversal

  [Stripe Connect](https://docs.stripe.com/connect) platforms can reverse transfers made to a
  connected account, either entirely or partially, and can also specify whether
  to refund any related application fees. Transfer reversals add to the
  platform's balance and subtract from the destination account's balance.

  Reversing a transfer that was made for a [destination
  charge](https://docs.stripe.com/docs/connect/destination-charges) is allowed only up to the amount of
  the charge. It is possible to reverse a
  [transfer_group](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-options)
  transfer only if the destination account has enough balance to cover the
  reversal.

  Related guide: [Reverse transfers](https://docs.stripe.com/connect/separate-charges-and-transfers#reverse-transfers)
  """

  @typedoc """
  * `amount` - Amount, in cents (or local equivalent).
  * `balance_transaction` - Balance transaction that describes the impact on your account balance. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `destination_payment_refund` - Linked payment refund for the transfer reversal. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `transfer_reversal`.
  * `source_refund` - ID of the refund responsible for the transfer reversal. Nullable. Expandable.
  * `transfer` - ID of the transfer that was reversed. Expandable.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :balance_transaction,
    :created,
    :currency,
    :destination_payment_refund,
    :id,
    :metadata,
    :object,
    :source_refund,
    :transfer
  ]

  @object_name "transfer_reversal"
  def object_name, do: @object_name

  def expandable_fields,
    do: ["balance_transaction", "destination_payment_refund", "source_refund", "transfer"]
end
