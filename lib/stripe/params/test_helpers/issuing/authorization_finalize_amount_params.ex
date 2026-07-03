# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.AuthorizationFinalizeAmountParams do
  @moduledoc "Parameters for authorization finalize amount."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `final_amount` - The final authorization amount that will be captured by the merchant. This amount is in the authorization currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `fleet` - Fleet-specific information for authorizations using Fleet cards.
  * `fuel` - Information about fuel that was purchased with this transaction.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :final_amount, :fleet, :fuel]
end
