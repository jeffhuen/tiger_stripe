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
  @type t :: %__MODULE__{}

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

  def __nested_fields__ do
    %{
      "fee_source" => %{
        fields: %{
          "charge" => :scalar,
          "payout" => :scalar,
          "type" => :scalar
        }
      },
      "refunds" => %{
        fields: %{
          "data" => {:list, {:resource, Stripe.Resources.FeeRefund}},
          "has_more" => :scalar,
          "object" => :scalar,
          "url" => :scalar
        }
      }
    }
  end
end
