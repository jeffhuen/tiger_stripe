# File generated from our OpenAPI spec
defmodule Stripe.Params.WebhookEndpointUpdateParams do
  @moduledoc "Parameters for webhook endpoint update."

  @typedoc """
  * `description` - An optional description of what the webhook is used for.
  * `disabled` - Disable the webhook endpoint if set to true.
  * `enabled_events` - The list of events to enable for this endpoint. You may specify `['*']` to enable all events, except those that require explicit selection.
  * `expand` - Specifies which fields in the response should be expanded.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  * `url` - The URL of the webhook endpoint.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :disabled, :enabled_events, :expand, :metadata, :url]
end
