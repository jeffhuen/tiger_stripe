# File generated from our OpenAPI spec
defmodule Stripe.Params.TransferCreateParams do
  @moduledoc "Parameters for transfer create."

  @typedoc """
  * `amount` - A positive integer in cents (or local equivalent) representing how much to transfer.
  * `currency` - Three-letter [ISO code for currency](https://www.iso.org/iso-4217-currency-codes.html) in lowercase. Must be a [supported currency](https://docs.stripe.com/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `destination` - The ID of a connected Stripe account. [See the Connect documentation](https://docs.stripe.com/docs/connect/separate-charges-and-transfers) for details.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `source_transaction` - You can use this parameter to transfer funds from a charge before they are added to your available balance. A pending balance will transfer immediately but the funds will not become available until the original charge becomes available. [See the Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-availability) for details.
  * `source_type` - The source balance to use for this transfer. One of `bank_account`, `card`, or `fpx`. For most users, this will default to `card`. Possible values: `bank_account`, `card`, `fpx`. Max length: 5000.
  * `transfer_group` - A string that identifies this transaction as part of a group. See the [Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-options) for details.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :currency,
    :description,
    :destination,
    :expand,
    :metadata,
    :source_transaction,
    :source_type,
    :transfer_group
  ]
end
