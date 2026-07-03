# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.TransactionCreateForceCaptureParams do
  @moduledoc "Parameters for transaction create force capture."

  @typedoc """
  * `amount` - The total amount to attempt to capture. This amount is in the provided currency, or defaults to the cards currency, and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `card` - Card associated with this transaction. Max length: 5000.
  * `currency` - The currency of the capture. If not provided, defaults to the currency of the card. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `expand` - Specifies which fields in the response should be expanded.
  * `merchant_data` - Details about the seller (grocery store, e-commerce website, etc.) where the card authorization happened.
  * `purchase_details` - Additional purchase information that is optionally provided by the merchant.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :card, :currency, :expand, :merchant_data, :purchase_details]
end
