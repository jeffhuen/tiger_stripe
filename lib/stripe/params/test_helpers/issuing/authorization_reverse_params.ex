# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.AuthorizationReverseParams do
  @moduledoc "Parameters for authorization reverse."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `reverse_amount` - The amount to reverse from the authorization. If not provided, the full amount of the authorization will be reversed. This amount is in the authorization currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :reverse_amount]
end
