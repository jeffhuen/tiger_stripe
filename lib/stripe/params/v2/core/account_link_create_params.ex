# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.AccountLinkCreateParams do
  @moduledoc "Parameters for account link create."

  @typedoc """
  * `account` - The ID of the Account to create link for.
  * `use_case` - Specifies the Stripe-hosted flow for this Account Link. Set `type` and the matching options hash—for example,
  `account_onboarding`—to configure the flow, including which Account configurations to collect information for and
  any flow-specific collection or redirect options.
  """
  @type t :: %__MODULE__{}

  defstruct [:account, :use_case]
end
