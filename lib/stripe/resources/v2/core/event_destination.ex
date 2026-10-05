# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.EventDestination do
  @moduledoc """
  Event Destination

  Set up an event destination to receive events from Stripe across multiple destination types, including [webhook endpoints](https://docs.stripe.com/webhooks), [Amazon EventBridge](https://docs.stripe.com/event-destinations/eventbridge), and [Azure Event Grid](https://docs.stripe.com/event-destinations/eventgrid). Event destinations support receiving [thin events](https://docs.stripe.com/api/v2/events) and [snapshot events](https://docs.stripe.com/api/events).
  """

  @typedoc """
  * `amazon_eventbridge` - Configuration for delivering events through an Amazon EventBridge partner event source.
  * `azure_event_grid` - Configuration for delivering events through an Azure Event Grid partner topic.
  * `created` - The time when the destination was created. Format: date-time.
  * `description` - An optional user-defined description of the destination's purpose.
  * `enabled_events` - The list of event types enabled for delivery to this destination.
  * `event_payload` - Whether to deliver as snapshot or thin events. Possible values: `snapshot`, `thin`.
  * `events_from` - Specifies which accounts' events route to this destination.
  `@self`: Receive events from the account that owns the event destination.
  `@accounts`: Receive events emitted from other accounts you manage which includes your v1 and v2 accounts.
  `@organization_members`: Receive events from accounts directly linked to the organization.
  `@organization_members/@accounts`: Receive events from all accounts connected to any platform accounts in the organization.
  * `id` - Unique identifier for the object.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - User-defined key/value data for the destination; it has no effect on event matching or delivery.
  * `name` - A user-defined label for identifying the destination in Stripe.
  * `object` - String representing the object's type. Objects of the same type share the same value of the object field. Possible values: `v2.core.event_destination`.
  * `snapshot_api_version` - For snapshot events only, the Stripe API version used to render event objects. You can't change this value after you create the event destination. Thin events are not pinned to an API version.
  * `status` - Whether Stripe currently attempts delivery. Stripe attempts delivery to enabled destinations when their provider configuration is active; disabled destinations do not receive delivery attempts. Possible values: `disabled`, `enabled`.
  * `status_details` - Additional lifecycle context for the destination status, when available.
  * `type` - The delivery transport. Chosen when the destination is created and cannot be changed by update. Possible values: `amazon_eventbridge`, `azure_event_grid`, `webhook_endpoint`.
  * `updated` - The time when the destination object was last updated. Format: date-time.
  * `webhook_endpoint` - Configuration for delivering events to a webhook endpoint. Live mode requires HTTPS; sandbox mode also supports HTTP.
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
