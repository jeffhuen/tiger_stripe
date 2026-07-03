# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventDestinationCreateParams do
  @moduledoc "Parameters for event destination create."

  @typedoc """
  * `amazon_eventbridge` - Amazon EventBridge configuration.
  * `azure_event_grid` - Azure Event Grid configuration.
  * `description` - An optional description of what the event destination is used for.
  * `enabled_events` - The list of events to enable for this endpoint.
  * `event_payload` - Payload type of events being subscribed to. Possible values: `snapshot`, `thin`.
  * `events_from` - Specifies which accounts' events route to this destination.
  `@self`: Receive events from the account that owns the event destination.
  `@accounts`: Receive events emitted from other accounts you manage which includes your v1 and v2 accounts.
  `@organization_members`: Receive events from accounts directly linked to the organization.
  `@organization_members/@accounts`: Receive events from all accounts connected to any platform accounts in the organization.
  * `include` - Additional fields to include in the response.
  * `metadata` - Metadata.
  * `name` - Event destination name.
  * `snapshot_api_version` - If using the snapshot event payload, the API version events are rendered as.
  * `type` - Event destination type. Possible values: `amazon_eventbridge`, `azure_event_grid`, `webhook_endpoint`.
  * `webhook_endpoint` - Webhook endpoint configuration.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amazon_eventbridge,
    :azure_event_grid,
    :description,
    :enabled_events,
    :event_payload,
    :events_from,
    :include,
    :metadata,
    :name,
    :snapshot_api_version,
    :type,
    :webhook_endpoint
  ]
end
