# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventDestinationCreateParams do
  @moduledoc "Parameters for event destination create."

  @typedoc """
  * `amazon_eventbridge` - Amazon EventBridge configuration.
  * `description` - An optional description of what the event destination is used for.
  * `enabled_events` - The list of events to enable for this endpoint.
  * `event_payload` - Payload type of events being subscribed to. Possible values: `snapshot`, `thin`.
  * `events_from` - Where events should be routed from.
  * `include` - Additional fields to include in the response.
  * `metadata` - Metadata.
  * `name` - Event destination name.
  * `snapshot_api_version` - If using the snapshot event payload, the API version events are rendered as.
  * `type` - Event destination type. Possible values: `amazon_eventbridge`, `webhook_endpoint`.
  * `webhook_endpoint` - Webhook endpoint configuration.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amazon_eventbridge,
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
