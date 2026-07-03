# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventDestinationUpdateParams do
  @moduledoc "Parameters for event destination update."

  @typedoc """
  * `description` - An optional description of what the event destination is used for.
  * `enabled_events` - The list of events to enable for this endpoint.
  * `include` - Additional fields to include in the response. Currently supports `webhook_endpoint.url`.
  * `metadata` - Metadata.
  * `name` - Event destination name.
  * `webhook_endpoint` - Webhook endpoint configuration.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :enabled_events, :include, :metadata, :name, :webhook_endpoint]
end
