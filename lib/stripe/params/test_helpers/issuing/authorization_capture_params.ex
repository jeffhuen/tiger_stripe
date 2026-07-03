# File generated from our OpenAPI spec
defmodule Stripe.Params.TestHelpers.Issuing.AuthorizationCaptureParams do
  @moduledoc "Parameters for authorization capture."

  @typedoc """
  * `capture_amount` - The amount to capture from the authorization. If not provided, the full amount of the authorization will be captured. This amount is in the authorization currency and in the [smallest currency unit](https://docs.stripe.com/currencies#zero-decimal).
  * `close_authorization` - Whether to close the authorization after capture. Defaults to true. Set to false to enable multi-capture flows.
  * `expand` - Specifies which fields in the response should be expanded.
  * `purchase_details` - Additional purchase information that is optionally provided by the merchant.
  """
  @type t :: %__MODULE__{}

  defstruct [:capture_amount, :close_authorization, :expand, :purchase_details]
end
