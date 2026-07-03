# File generated from our OpenAPI spec
defmodule Stripe.Resources.FeeRefund do
  @moduledoc """
  FeeRefund

  `Application Fee Refund` objects allow you to refund an application fee that
  has previously been created but not yet refunded. Funds will be refunded to
  the Stripe account from which the fee was originally collected.

  Related guide: [Refunding application fees](https://docs.stripe.com/connect/destination-charges#refunding-app-fee)
  """

  @typedoc """
  * `amount` - Amount, in cents (or local equivalent).
  * `balance_transaction` - Balance transaction that describes the impact on your account balance. Nullable. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `fee` - ID of the application fee that was refunded. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Nullable.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `fee_refund`.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :balance_transaction, :created, :currency, :fee, :id, :metadata, :object]

  @object_name "fee_refund"
  def object_name, do: @object_name

  def expandable_fields, do: ["balance_transaction", "fee"]
end
