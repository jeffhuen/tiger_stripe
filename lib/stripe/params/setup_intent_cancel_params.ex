# File generated from our OpenAPI spec
defmodule Stripe.Params.SetupIntentCancelParams do
  @moduledoc "Parameters for setup intent cancel."

  @typedoc """
  * `cancellation_reason` - Reason for canceling this SetupIntent. Possible values are: `abandoned`, `requested_by_customer`, or `duplicate` Possible values: `abandoned`, `duplicate`, `requested_by_customer`. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  """
  @type t :: %__MODULE__{}

  defstruct [:cancellation_reason, :expand]
end
