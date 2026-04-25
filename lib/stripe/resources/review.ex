# File generated from our OpenAPI spec
defmodule Stripe.Resources.Review do
  @moduledoc """
  RadarReview

  Reviews can be used to supplement automated fraud detection with human expertise.

  Learn more about [Radar](https://stripe.com/radar) and reviewing payments
  [here](https://docs.stripe.com/radar/reviews).
  """

  @typedoc """
  * `billing_zip` - The ZIP or postal code of the card used, if applicable. Max length: 5000. Nullable.
  * `charge` - The charge associated with this review. Nullable. Expandable.
  * `closed_reason` - The reason the review was closed, or null if it has not yet been closed. One of `approved`, `refunded`, `refunded_as_fraud`, `disputed`, `redacted`, `canceled`, `payment_never_settled`, or `acknowledged`. Possible values: `acknowledged`, `approved`, `canceled`, `disputed`, `payment_never_settled`, `redacted`, `refunded`, `refunded_as_fraud`. Nullable.
  * `created` - Time at which the object was created. Measured in seconds since the Unix epoch. Format: Unix timestamp.
  * `id` - Unique identifier for the object. Max length: 5000.
  * `ip_address` - The IP address where the payment originated. Max length: 5000. Nullable.
  * `ip_address_location` - Information related to the location of the payment. Note that this information is an approximation and attempts to locate the nearest population center - it should not be used to determine a specific address. Nullable. Expandable.
  * `livemode` - Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  * `object` - String representing the object's type. Objects of the same type share the same value. Possible values: `review`.
  * `open` - If `true`, the review needs action.
  * `opened_reason` - The reason the review was opened. One of `rule` or `manual`. Possible values: `manual`, `rule`.
  * `payment_intent` - The PaymentIntent ID associated with this review, if one exists. Expandable.
  * `reason` - The reason the review is currently open or closed. One of `rule`, `manual`, `approved`, `refunded`, `refunded_as_fraud`, `disputed`, `redacted`, `canceled`, `payment_never_settled`, or `acknowledged`. Max length: 5000.
  * `session` - Information related to the browsing session of the user who initiated the payment. Nullable. Expandable.
  """
  @type t :: %__MODULE__{
          billing_zip: String.t(),
          charge: String.t() | Stripe.Resources.Charge.t(),
          closed_reason: String.t(),
          created: integer(),
          id: String.t(),
          ip_address: String.t(),
          ip_address_location: ip_address_location(),
          livemode: boolean(),
          object: String.t(),
          open: boolean(),
          opened_reason: String.t(),
          payment_intent: String.t() | Stripe.Resources.PaymentIntent.t() | nil,
          reason: String.t(),
          session: session()
        }

  defstruct [
    :billing_zip,
    :charge,
    :closed_reason,
    :created,
    :id,
    :ip_address,
    :ip_address_location,
    :livemode,
    :object,
    :open,
    :opened_reason,
    :payment_intent,
    :reason,
    :session
  ]

  @object_name "review"
  def object_name, do: @object_name

  def expandable_fields, do: ["charge", "ip_address_location", "payment_intent", "session"]

  @typedoc """
  * `city` - The city where the payment originated. Max length: 5000. Nullable.
  * `country` - Two-letter ISO code representing the country where the payment originated. Max length: 5000. Nullable.
  * `latitude` - The geographic latitude where the payment originated. Nullable.
  * `longitude` - The geographic longitude where the payment originated. Nullable.
  * `region` - The state/county/province/region where the payment originated. Max length: 5000. Nullable.
  """
  @type ip_address_location :: %{
          optional(:city) => String.t() | nil,
          optional(:country) => String.t() | nil,
          optional(:latitude) => float() | nil,
          optional(:longitude) => float() | nil,
          optional(:region) => String.t() | nil,
          optional(String.t()) => term()
        }

  @typedoc """
  * `browser` - The browser used in this browser session (e.g., `Chrome`). Max length: 5000. Nullable.
  * `device` - Information about the device used for the browser session (e.g., `Samsung SM-G930T`). Max length: 5000. Nullable.
  * `platform` - The platform for the browser session (e.g., `Macintosh`). Max length: 5000. Nullable.
  * `version` - The version for the browser session (e.g., `61.0.3163.100`). Max length: 5000. Nullable.
  """
  @type session :: %{
          optional(:browser) => String.t() | nil,
          optional(:device) => String.t() | nil,
          optional(:platform) => String.t() | nil,
          optional(:version) => String.t() | nil,
          optional(String.t()) => term()
        }

  def __nested_fields__ do
    %{
      "ip_address_location" => %{
        fields: %{
          "city" => :scalar,
          "country" => :scalar,
          "latitude" => :scalar,
          "longitude" => :scalar,
          "region" => :scalar
        }
      },
      "session" => %{
        fields: %{
          "browser" => :scalar,
          "device" => :scalar,
          "platform" => :scalar,
          "version" => :scalar
        }
      }
    }
  end
end
