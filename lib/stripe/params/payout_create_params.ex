# File generated from our OpenAPI spec
defmodule Stripe.Params.PayoutCreateParams do
  @moduledoc "Parameters for payout create."

  @typedoc """
  * `amount` - A positive integer in cents representing how much to payout.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `destination` - The ID of a bank account or a card to send the payout to. If you don't provide a destination, we use the default external account for the specified currency.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `method` - The method used to send this payout, which is `standard` or `instant`. We support `instant` for payouts to debit cards and bank accounts in certain countries. Learn more about [bank support for Instant Payouts](https://stripe.com/docs/payouts/instant-payouts-banks). Possible values: `instant`, `standard`. Max length: 5000.
  * `payout_method` - The ID of a v2 FinancialAccount to send funds to.
  * `source_type` - The balance type of your Stripe balance to draw this payout from. Balances for different payment sources are kept separately. You can find the amounts with the Balances API. One of `bank_account`, `card`, or `fpx`. Possible values: `bank_account`, `card`, `fpx`. Max length: 5000.
  * `statement_descriptor` - A string that displays on the recipient's bank or card statement (up to 22 characters). A `statement_descriptor` that's longer than 22 characters return an error. Most banks truncate this information and display it inconsistently. Some banks might not display it at all. For US ACH payouts, this maps to the ACH Company Entry Description field, which the NACHA standard limits to 10 characters. Stripe truncates descriptors longer than 10 characters for US ACH payouts. Max length: 22.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :currency,
    :description,
    :destination,
    :expand,
    :metadata,
    :method,
    :payout_method,
    :source_type,
    :statement_descriptor
  ]
end
