# File generated from our OpenAPI spec
defmodule Stripe.Resources.ApplicationFee do
  @moduledoc """
  PlatformFee
  """

  @typedoc """
  * `account` - ID of the Stripe account this fee was taken from. Expandable.
  * `amount` - Amount earned, in cents (or local equivalent).
  * `amount_refunded` - Amount in cents (or local equivalent) refunded (can be less than the amount attribute on the fee if a partial refund was issued)
  * `application` - ID of the Connect application that earned the fee. Expandable.
  * `balance_transaction` - Balance transaction that describes the impact of this collected application fee on your account balance (not including refunds). Nullable. Expandable.
  * `charge` - ID of the charge that the application fee was taken from. Expandable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `fee_source` - Polymorphic source of the application fee. Includes the ID of the object the application fee was created from. Nullable. Expandable.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - If the object exists in live mode, the value is `true`. If the object exists in test mode, the value is `false`.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `application_fee`.
  * `originating_transaction` - ID of the corresponding charge on the platform account, if this fee was the result of a charge using the `destination` parameter. Nullable. Expandable.
  * `refunded` - Whether the fee has been fully refunded. If the fee is only partially refunded, this attribute will still be false.
  * `refunds` - A list of refunds that have been applied to the fee. Expandable.
  """
  @type t :: %__MODULE__{
          account: String.t() | Stripe.Resources.Account.t(),
          amount: integer(),
          amount_refunded: integer(),
          application: String.t() | Stripe.Resources.Application.t(),
          balance_transaction: String.t() | Stripe.Resources.BalanceTransaction.t(),
          charge: String.t() | Stripe.Resources.Charge.t(),
          created: integer(),
          currency: String.t(),
          fee_source: __MODULE__.FeeSource.t(),
          id: String.t(),
          livemode: boolean(),
          object: String.t(),
          originating_transaction: String.t() | Stripe.Resources.Charge.t(),
          refunded: boolean(),
          refunds: __MODULE__.Refunds.t()
        }

  defstruct [
    :account,
    :amount,
    :amount_refunded,
    :application,
    :balance_transaction,
    :charge,
    :created,
    :currency,
    :fee_source,
    :id,
    :livemode,
    :object,
    :originating_transaction,
    :refunded,
    :refunds
  ]

  @object_name "application_fee"
  def object_name, do: @object_name

  def expandable_fields,
    do: [
      "account",
      "application",
      "balance_transaction",
      "charge",
      "fee_source",
      "originating_transaction",
      "refunds"
    ]

  defmodule FeeSource do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `charge` - Charge ID that created this application fee. Max length: 5000.
    * `payout` - Payout ID that created this application fee. Max length: 5000.
    * `type` - Type of object that created the application fee. Possible values: `charge`, `payout`.
    """
    @type t :: %__MODULE__{
            charge: String.t() | nil,
            payout: String.t() | nil,
            type: String.t() | nil
          }
    defstruct [:charge, :payout, :type]
  end

  defmodule Refunds do
    @moduledoc "Nested struct within the parent resource."

    @typedoc """
    * `data` - Details about each object.
    * `has_more` - True if this list has another page of items after this one that can be fetched.
    * `object` - String representing the object's type. Objects of the same type share the same value. Always has the value `list`. Possible values: `list`.
    * `url` - The URL where this list can be accessed. Max length: 5000.
    """
    @type t :: %__MODULE__{
            data: [Stripe.Resources.FeeRefund.t()] | nil,
            has_more: boolean() | nil,
            object: String.t() | nil,
            url: String.t() | nil
          }
    defstruct [:data, :has_more, :object, :url]
  end

  def __inner_types__ do
    %{
      "fee_source" => __MODULE__.FeeSource,
      "refunds" => __MODULE__.Refunds
    }
  end
end
