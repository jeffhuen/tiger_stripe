# File generated from our OpenAPI spec
defmodule Stripe.Params.FileLinkUpdateParams do
  @moduledoc "Parameters for file link update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `expires_at` - A future timestamp after which the link will no longer be usable, or `now` to expire the link immediately.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :expires_at, :metadata]
end
