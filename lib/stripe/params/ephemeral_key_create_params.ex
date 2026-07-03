# File generated from our OpenAPI spec
defmodule Stripe.Params.EphemeralKeyCreateParams do
  @moduledoc "Parameters for ephemeral key create."

  @typedoc """
  * `customer` - The ID of the Customer you'd like to modify using the resulting ephemeral key. Max length: 5000.
  * `expand` - Specifies which fields in the response should be expanded.
  * `issuing_card` - The ID of the Issuing Card you'd like to access using the resulting ephemeral key. Max length: 5000.
  * `nonce` - A single-use token, created by Stripe.js, used for creating ephemeral keys for Issuing Cards without exchanging sensitive information. Max length: 5000.
  * `verification_session` - The ID of the Identity VerificationSession you'd like to access using the resulting ephemeral key Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:customer, :expand, :issuing_card, :nonce, :verification_session]
end
