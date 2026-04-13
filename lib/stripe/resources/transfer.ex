# File generated from our OpenAPI spec
defmodule Stripe.Resources.Transfer do
  @moduledoc """
  Transfer

  A `Transfer` object is created when you move funds between Stripe accounts as
  part of Connect.

  Before April 6, 2017, transfers also represented movement of funds from a
  Stripe account to a card or bank account. This behavior has since been split
  out into a [Payout](https://api.stripe.com#payout_object) object, with corresponding payout endpoints. For more
  information, read about the
  [transfer/payout split](https://docs.stripe.com/transfer-payout-split).

  Related guide: [Creating separate charges and transfers](https://docs.stripe.com/connect/separate-charges-and-transfers)
  """

  @typedoc """
  * `amount` - Amount in cents (or local equivalent) to be transferred.
  * `amount_reversed` - Amount in cents (or local equivalent) reversed (can be less than the amount attribute on the transfer if a partial reversal was issued).
  * `balance_transaction` - Balance transaction that describes the impact of this transfer on your account balance. Nullable. Expandable.
  * `created` - Time that this record of the transfer was first created. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000. Nullable.
  * `destination` - ID of the Stripe account the transfer was sent to. Nullable. Expandable.
  * `destination_payment` - If the destination is a Stripe account, this will be the ID of the payment that the destination account received for the transfer. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `transfer`.
  * `reversals` - A list of reversals that have been applied to the transfer. Expandable.
  * `reversed` - Whether the transfer has been fully reversed. If the transfer is only partially reversed, this attribute will still be false.
  * `source_transaction` - ID of the charge that was used to fund the transfer. If null, the transfer was funded from the available balance. Nullable. Expandable.
  * `source_type` - The source balance this transfer came from. One of `card`, `fpx`, or `bank_account`. Max length: 5000.
  * `transfer_group` - A string that identifies this transaction as part of a group. See the [Connect documentation](https://docs.stripe.com/connect/separate-charges-and-transfers#transfer-options) for details. Max length: 5000. Nullable.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          amount_reversed: integer(),
          balance_transaction: String.t() | Stripe.Resources.BalanceTransaction.t(),
          created: integer(),
          currency: String.t(),
          description: String.t(),
          destination: String.t() | Stripe.Resources.Account.t(),
          destination_payment: String.t() | Stripe.Resources.Charge.t() | nil,
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          reversals: __MODULE__.Reversals.t(),
          reversed: boolean(),
          source_transaction: String.t() | Stripe.Resources.Charge.t(),
          source_type: String.t() | nil,
          transfer_group: String.t()
        }

  defstruct [
    :amount,
    :amount_reversed,
    :balance_transaction,
    :created,
    :currency,
    :description,
    :destination,
    :destination_payment,
    :id,
    :livemode,
    :metadata,
    :object,
    :reversals,
    :reversed,
    :source_transaction,
    :source_type,
    :transfer_group
  ]

  @object_name "transfer"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "balance_transaction",
      "destination",
      "destination_payment",
      "reversals",
      "source_transaction"
    ]

  defmodule Reversals do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.TransferReversal.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  def __inner_types__ do
    %{
      "reversals" => __MODULE__.Reversals
    }
  end
end
