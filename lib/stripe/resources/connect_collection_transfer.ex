# File generated from our OpenAPI spec
defmodule Stripe.Resources.ConnectCollectionTransfer do
  @moduledoc """
  ConnectCollectionTransfer
  """

  @typedoc """
  * `amount` - Amount transferred, in cents (or local equivalent).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `destination` - ID of the account that funds are being collected for. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `connect_collection_transfer`.
  """
  @type t :: %__MODULE__{
          amount: integer(),
          currency: String.t(),
          destination: String.t() | Stripe.Resources.Account.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t()
        }

  defstruct [:amount, :currency, :destination, :id, :livemode, :object]

  @object_name "connect_collection_transfer"
  def object_name, do: @object_name

  def expandable_fields, do: ["destination"]
end
