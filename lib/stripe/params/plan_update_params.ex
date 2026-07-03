# File generated from our OpenAPI spec
defmodule Stripe.Params.PlanUpdateParams do
  @moduledoc "Parameters for plan update."

  @typedoc """
  * `active` - Whether the plan is currently available for new subscriptions.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `nickname` - A brief description of the plan, hidden from customers. Max length: 5000.
  * `product` - The product the plan belongs to. This cannot be changed once it has been used in a subscription or subscription schedule. Max length: 5000.
  * `trial_period_days` - Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://docs.stripe.com/api#create_subscription-trial_from_plan).
  """
  @type t :: %__MODULE__{}

  defstruct [:active, :expand, :metadata, :nickname, :product, :trial_period_days]
end
