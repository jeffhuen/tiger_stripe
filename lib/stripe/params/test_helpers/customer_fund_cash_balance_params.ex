# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.CustomerFundCashBalanceParams do
  @moduledoc "Parameters for customer fund cash balance."

  @typedoc """
  * `amount` - Amount to be used for this test cash balance transaction. A positive integer representing how much to fund in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal) (e.g., 100 cents to fund $1.00 or 100 to fund ¥100, a zero-decimal currency).
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `expand` - Specifies which fields in the response should be expanded.
  * `reference` - A description of the test funding. This simulates free-text references supplied by customers when making bank transfers to their cash balance. You can use this to test how Stripe's [reconciliation algorithm](https://docs.stripe.com/payments/customer-balance/reconciliation) applies to different user inputs. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :currency, :expand, :reference]
end
