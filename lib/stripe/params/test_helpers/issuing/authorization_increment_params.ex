# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.AuthorizationIncrementParams do
  @moduledoc "Parameters for authorization increment."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `increment_amount` - The amount to increment the authorization by. This amount is in the authorization currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `is_amount_controllable` - If set `true`, you may provide [amount](https://docs.stripe.com/api/issuing/authorizations/approve#approve_issuing_authorization-amount) to control how much to hold for the authorization.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :increment_amount, :is_amount_controllable]
end
