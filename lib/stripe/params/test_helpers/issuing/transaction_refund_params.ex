# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.TransactionRefundParams do
  @moduledoc "Parameters for transaction refund."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `refund_amount` - The total amount to attempt to refund. This amount is in the provided currency, or defaults to the cards currency, and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :refund_amount]
end
