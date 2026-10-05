# File generated from our OpenAPI spec
defmodule Stripe.Params.ThreeDSecure.AuthenticationSubmitParams do
  @moduledoc "Parameters for authentication submit."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `fingerprinting_result` - The fingerprinting result of the issuer fingerprinting step.

  Refer to the [Issuer fingerprinting section of the Standalone 3DS guide](https://stripe.com/payments/3d-secure/standalone-3d-secure#issuer-fingerprinting) for more information. Max length: 5000.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :fingerprinting_result, :metadata]
end
