# File generated from our OpenAPI spec
defmodule Stripe.Params.QuoteFinalizeQuoteParams do
  @moduledoc "Parameters for quote finalize quote."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - A future timestamp on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :expires_at]
end
