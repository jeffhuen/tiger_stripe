# File generated from our OpenAPI spec
defmodule Stripe.Params.V2.Core.EventDestinationCreateParams do
  @moduledoc "Parameters for event destination create."

  @typedoc """
  * `amazon_eventbridge` - AWS account and region where Stripe creates the EventBridge partner event source.
  * `azure_event_grid` - Azure subscription, resource group, and region where Stripe creates the partner topic.
  * `description` - An optional user-defined description of the destination's purpose.
  * `enabled_events` - The list of event types enabled for delivery to this destination.
  * `event_payload` - Whether to deliver as snapshot or thin events. Possible values: `snapshot`, `thin`.
  * `events_from` - The account or organization scopes that can supply events. Use this with `enabled_events` to define the subscription.
  `@self`: Receive events from the account that owns the event destination.
  `@accounts`: Receive events emitted from other accounts you manage, including your v1 and v2 accounts.
  `@organization_members`: Receive events from accounts directly linked to the organization.
  `@organization_members/@accounts`: Receive events from all accounts connected to any platform accounts in the organization.
  * `include` - Include normally redacted webhook fields in the create response. Public API clients must include `webhook_endpoint.signing_secret` to receive the signing secret.
  * `metadata` - User-defined key/value data for the destination.
  * `name` - A user-defined label for identifying the destination.
  * `snapshot_api_version` - For snapshot events only, the Stripe API version used to render event objects; do not provide this for thin events.
  * `type` - The delivery transport. Chosen when the destination is created and cannot be changed by update. Possible values: `amazon_eventbridge`, `azure_event_grid`, `webhook_endpoint`.
  * `webhook_endpoint` - Delivery target for the webhook endpoint. Live mode requires HTTPS; sandbox mode also supports HTTP.
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
