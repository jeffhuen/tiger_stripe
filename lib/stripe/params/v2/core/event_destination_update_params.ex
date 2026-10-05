# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventDestinationUpdateParams do
  @moduledoc "Parameters for event destination update."

  @typedoc """
  * `description` - An optional user-defined description of the destination's purpose; it does not control routing.
  * `enabled_events` - The list of event types enabled for delivery to this destination. Event scopes are configured when the destination is created.
  * `include` - Include the normally redacted `webhook_endpoint.url` in the response.
  * `metadata` - Metadata.
  * `name` - A user-defined label for identifying the destination; it does not control routing.
  * `webhook_endpoint` - New delivery target for the webhook endpoint. Live mode requires HTTPS; sandbox mode also supports HTTP.
  """
  @type t :: %__MODULE__{}

  defstruct [:description, :enabled_events, :include, :metadata, :name, :webhook_endpoint]
end
