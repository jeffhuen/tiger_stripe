# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.ClaimableSandboxCreateParams do
  @moduledoc "Parameters for claimable sandbox create."

  @typedoc """
  * `channel` - The distribution channel used to pre-install your Stripe App on the claimable sandbox.
  Use `testing` to install your app's external test version or `public` to install its published version.
  This field defaults to `public` if omitted. Possible values: `public`, `testing`.
  * `enable_mcp_access` - If true, returns a key that can be used with [Stripe's MCP server](https://docs.stripe.com/mcp).
  * `onboarding_link_details` - Details about the onboarding link.
  * `prefill` - Values that are prefilled when a user claims the sandbox. When a user claims the sandbox, they will be able to update these values.
  """
  @type t :: %__MODULE__{}

  defstruct [:channel, :enable_mcp_access, :onboarding_link_details, :prefill]
end
