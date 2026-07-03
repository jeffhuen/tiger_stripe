# File generated from our OpenAPI spec
defmodule Stripe.Params.CustomerBalanceTransactionCreateParams do
  @moduledoc "Parameters for customer balance transaction create."

  @typedoc """
  * `amount` - The integer amount in **cents (or local equivalent)** to apply to the customer's credit balance.
  * `currency` - Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Specifies the [`invoice_credit_balance`](https://docs.stripe.com/api/customers/object#customer_object-invoice_credit_balance) that this transaction will apply to. If the customer's `currency` is not set, it will be updated to this value. Format: ISO 4217 currency code.
  * `description` - An arbitrary string attached to the object. Often useful for displaying to users. Max length: 350.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:amount, :currency, :description, :expand, :metadata]
end
