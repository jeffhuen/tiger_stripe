# File generated from our OpenAPI spec
defmodule Stripe.Params.Identity.VerificationSessionUpdateParams do
  @moduledoc "Parameters for verification session update."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `options` - A set of options for the session’s verification checks.
  * `provided_details` - Details provided about the user being verified. These details may be shown to the user.
  * `type` - The type of [verification check](https://docs.stripe.com/identity/verification-checks) to be performed. Possible values: `document`, `id_number`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :metadata, :options, :provided_details, :type]
end
