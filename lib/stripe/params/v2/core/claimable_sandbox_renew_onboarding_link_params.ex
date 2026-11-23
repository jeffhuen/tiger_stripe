# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.ClaimableSandboxRenewOnboardingLinkParams do
  @moduledoc "Parameters for claimable sandbox renew onboarding link."

  @typedoc """
  * `onboarding_link_details` - Details about the onboarding link. If omitted, existing details are reused.
  Omitted URL fields retain their existing values.
  """
  @type t :: %__MODULE__{}

  defstruct [:onboarding_link_details]
end
