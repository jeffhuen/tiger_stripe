# File generated from our OpenAPI spec
defmodule Stripe.Params.Treasury.InboundTransferCreateParams do
  @moduledoc "Parameters for inbound transfer create."

  @typedoc """
  * `amount` - Amount (in cents) to be transferred.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `financial_account` - The FinancialAccount to send funds to.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `origin_payment_method` - The origin payment method to be debited for the InboundTransfer. Max length: 5000.
  * `statement_descriptor` - The complete description that appears on your customers' statements. Maximum 10 characters. Can only include -#.$&*, spaces, and alphanumeric characters. Max length: 10.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amount,
    :currency,
    :description,
    :expand,
    :financial_account,
    :metadata,
    :origin_payment_method,
    :statement_descriptor
  ]
end
