# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Treasury.ReceivedDebitCreateParams do
  @moduledoc "Parameters for received debit create."

  @typedoc """
  * `amount` - Amount (in cents) to be transferred.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - The FinancialAccount to pull funds from.
  * `initiating_payment_method_details` - Initiating payment method details for the object.
  * `network` - Specifies the network rails to be used. If not set, will default to the PaymentMethod's preferred network. See the [docs](https://docs.stripe.com/treasury/money-movement/timelines) to learn more about money movement timelines for each network type. Possible values: `ach`.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :currency,
    :description,
    :expand,
    :financial_account,
    :initiating_payment_method_details,
    :network
  ]
end
