# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.EventDestination do
  @moduledoc """
  Event Destination

  Set up an event destination to receive events from Stripe across multiple destination types, including [webhook endpoints](https://docs.stripe.com/webhooks) and [Amazon EventBridge](https://docs.stripe.com/event-destinations/eventbridge). Event destinations support receiving [thin events](https://docs.stripe.com/api/v2/events) and [snapshot events](https://docs.stripe.com/api/events).
  """

  @typedoc """
  * `amazon_eventbridge` - Amazon EventBridge configuration.
  * `azure_event_grid` - Azure Event Grid configuration.
  * `created` - Time at which the object was created. Format: date-time.
  * `description` - An optional description of what the event destination is used for.
  * `enabled_events` - The list of events to enable for this endpoint.
  * `event_payload` - Payload type of events being subscribed to. Possible values: `snapshot`, `thin`.
  * `events_from` - Specifies which accounts' events route to this destination.
  `@self`: Receive events from the account that owns the event destination.
  `@accounts`: Receive events emitted from other accounts you manage which includes your v1 and v2 accounts.
  `@organization_members`: Receive events from accounts directly linked to the organization.
  `@organization_members/@accounts`: Receive events from all accounts connected to any platform accounts in the organization.
  * `id` - Unique identifier for the object.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Metadata.
  * `name` - Event destination name.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.event_destination`.
  * `snapshot_api_version` - If using the snapshot event payload, the API version events are rendered as.
  * `status` - Status. It can be set to either enabled or disabled. Possible values: `disabled`, `enabled`.
  * `status_details` - Additional information about event destination status.
  * `type` - Event destination type. Possible values: `amazon_eventbridge`, `azure_event_grid`, `webhook_endpoint`.
  * `updated` - Time at which the object was last updated. Format: date-time.
  * `webhook_endpoint` - Webhook endpoint configuration.
  """
  @type t :: %__MODULE__{}

  defstruct [
    :amazon_eventbridge,
    :azure_event_grid,
    :created,
    :description,
    :enabled_events,
    :event_payload,
    :events_from,
    :id,
    :livemode,
    :metadata,
    :name,
    :object,
    :snapshot_api_version,
    :status,
    :status_details,
    :type,
    :updated,
    :webhook_endpoint
  ]

  @object_name "v2.core.event_destination"
  def object_name, do: @object_name

  def __nested_fields__ do
    %{
      "amazon_eventbridge" => %{
        fields: %{
          "aws_account_id" => :scalar,
          "aws_event_source_arn" => :scalar,
          "aws_event_source_status" => :scalar
        }
      },
      "azure_event_grid" => %{
        fields: %{
          "azure_partner_topic_name" => :scalar,
          "azure_partner_topic_status" => :scalar,
          "azure_region" => :scalar,
          "azure_resource_group_name" => :scalar,
          "azure_subscription_id" => :scalar
        }
      },
      "status_details" => %{
        fields: %{
          "disabled" => %{
            fields: %{
              "reason" => :scalar
            }
          }
        }
      },
      "webhook_endpoint" => %{
        fields: %{
          "signing_secret" => :scalar,
          "url" => :scalar
        }
      }
    }
  end
end
