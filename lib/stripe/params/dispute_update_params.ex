# File generated from our OpenAPI spec
defmodule Stripe.Params.DisputeUpdateParams do
  @moduledoc "Parameters for dispute update."

  @typedoc """
  * `evidence` - Evidence to upload, to respond to a dispute. Updating any field in the hash will submit all fields in the hash for review. The combined character count of all fields is limited to 150,000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `submit` - Whether to immediately submit evidence to the bank. If `false`, evidence is staged on the dispute. Staged evidence is visible in the API and Dashboard, and can be submitted to the bank by making another request with this attribute set to `true` (the default).
  """
  @type t :: %__MODULE__{}

  defstruct [:evidence, :expand, :metadata, :submit]
end
