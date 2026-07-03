# File generated from our OpenAPI spec
defmodule Stripe.Params.Terminal.OnboardingLinkCreateParams do
  @moduledoc "Parameters for onboarding link create."

  @typedoc """
  * `expand` - Specifies which fields in the response should be expanded.
  * `link_options` - Specific fields needed to generate the desired link type.
  * `link_type` - The type of link being generated. Possible values: `apple_terms_and_conditions`.
  * `on_behalf_of` - Stripe account ID to generate the link for. Max length: 5000.
  """
  @type t :: %__MODULE__{}

  defstruct [:expand, :link_options, :link_type, :on_behalf_of]
end
