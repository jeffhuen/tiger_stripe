# File generated from our OpenAPI spec
defmodule Stripe.Resources.WebhookEndpoint do
  @moduledoc """
  NotificationWebhookEndpoint

  You can configure [webhook endpoints](https://docs.stripe.com/webhooks/) via the API to be
  notified about events that happen in your Stripe account or connected
  accounts.

  Most users configure webhooks from [the dashboard](https://dashboard.stripe.com/webhooks), which provides a user interface for registering and testing your webhook endpoints.

  Related guide: [Setting up webhooks](https://docs.stripe.com/webhooks/configure)
  """

  @typedoc """
  * `api_version` - The API version events are rendered as for this webhook endpoint. Max length: 5000. Nullable.
  * `application` - The ID of the associated Connect application. Max length: 5000. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `description` - An optional description of what the webhook is used for. Max length: 5000. Nullable.
  * `enabled_events` - The list of events to enable for this endpoint. `['*']` indicates that all events are enabled, except those that require explicit selection.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `metadata` - Set of [key-value pairs](https://docs.stripe.com/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `webhook_endpoint`.
  * `secret` - The endpoint's secret, used to generate [webhook signatures](https://docs.stripe.com/webhooks/signatures). Only returned at creation. Max length: 5000.
  * `status` - The status of the webhook. It can be `enabled` or `disabled`. Max length: 5000.
  * `url` - The URL of the webhook endpoint. Max length: 5000.
  """
  @type t :: %__MODULE__{
          api_version: String.t(),
          application: String.t(),
          created: integer(),
          description: String.t(),
          enabled_events: [String.t()],
          id: String.t(),
          livemode: boolean(),
          metadata: %{String.t() => String.t()},
          object: String.t(),
          secret: String.t() | nil,
          status: String.t(),
          url: String.t()
        }

  defstruct [
    :api_version,
    :application,
    :created,
    :description,
    :enabled_events,
    :id,
    :livemode,
    :metadata,
    :object,
    :secret,
    :status,
    :url
  ]

  @object_name "webhook_endpoint"
  def object_name, do: @object_name
end
