# File generated from our OpenAPI spec
defmodule Stripe.Resources.V2.Core.EventDestination do
  @moduledoc """
  Event Destination

  Set up an event destination to receive events from Stripe across multiple destination types, including [webhook endpoints](https://docs.stripe.com/webhooks) and [Amazon EventBridge](https://docs.stripe.com/event-destinations/eventbridge). Event destinations support receiving [thin events](https://docs.stripe.com/api/v2/events) and [snapshot events](https://docs.stripe.com/api/events).
  """

  @typedoc """
  * `amazon_eventbridge` - Amazon EventBridge configuration.
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
  * `type` - Event destination type. Possible values: `amazon_eventbridge`, `webhook_endpoint`.
  * `updated` - Time at which the object was last updated. Format: date-time.
  * `webhook_endpoint` - Webhook endpoint configuration.
  """
  @type t :: %__MODULE__{
          amazon_eventbridge: amazon_eventbridge() | nil,
          created: String.t(),
          description: String.t(),
          enabled_events: [String.t()],
          event_payload: String.t(),
          events_from: [String.t()] | nil,
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()} | nil,
          name: String.t(),
          object: String.t(),
          snapshot_api_version: String.t() | nil,
          status: String.t(),
          status_details: status_details() | nil,
          type: String.t(),
          updated: String.t(),
          webhook_endpoint: webhook_endpoint() | nil
        }

  defstruct [
    :amazon_eventbridge,
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

  @typedoc """
  * `aws_account_id` - The AWS account ID.
  * `aws_event_source_arn` - The ARN of the AWS event source.
  * `aws_event_source_status` - The state of the AWS event source. Possible values: `active`, `deleted`, `pending`, `unknown`.
  """
  @type amazon_eventbridge :: %{
          optional(:aws_account_id) => String.t() | nil,
          optional(:aws_event_source_arn) => String.t() | nil,
          optional(:aws_event_source_status) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `disabled` - Details about why the event destination has been disabled.
  """
  @type status_details :: %{
          optional(:disabled) => status_details_disabled() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `reason` - Reason event destination has been disabled. Possible values: `no_aws_event_source_exists`, `user`.
  """
  @type status_details_disabled :: %{
          optional(:reason) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `signing_secret` - The signing secret of the webhook endpoint, only includable on creation.
  * `url` - The URL of the webhook endpoint, includable.
  """
  @type webhook_endpoint :: %{
          optional(:signing_secret) => String.t() | nil,
          optional(:url) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "amazon_eventbridge" => %{
        fields: %{
          "aws_account_id" => :scalar,
          "aws_event_source_arn" => :scalar,
          "aws_event_source_status" => :scalar
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
