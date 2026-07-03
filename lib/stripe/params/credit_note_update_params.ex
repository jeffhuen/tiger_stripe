# File generated from our OpenAPI spec
defmodule Stripe.Params.CreditNoteUpdateParams do
  @moduledoc "Parameters for credit note update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `memo` - Credit note memo. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :memo, :metadata]
end
